require 'rake/clean'
require 'json'
require 'yaml'
require 'erb'

task :default => [:dtsi, :dot, :pdf, :json]

#-----------------------------------------------------------------------------
# ZMK configuration snippet (DTSI)
#-----------------------------------------------------------------------------

keymap_zmk = File.readlines('keymap.zmk')
POS_BY_KEY = keymap_zmk.grep(/^#define POS_[LR]H_\w+ \d+/).map do |line|
  (_define, name, value) = line.split
  key = name[/_(.+)/, 1]
  pos = Integer(value)
  [key, pos]
end.to_h
KEY_BY_POS = POS_BY_KEY.invert

dtsi_files = FileList['*.dtsi.erb'].each do |erb|
  dtsi = erb.pathmap('%X')
  dtsi_base = dtsi.pathmap('%X')
  file dtsi => FileList[erb, "#{dtsi_base}.{json,zmk}", '*.yaml', __FILE__]
  CLEAN.include "#{erb}.tmp"

  dtsi_min = "#{dtsi}.min"
  file dtsi_min => dtsi
  CLOBBER.include dtsi_min
end
task :dtsi => dtsi_files

rule '.dtsi' => '.dtsi.erb' do |t|
  input = File.read(t.source)
    # NOTE: this may shift line numbers, hence dump *.tmp below
    .gsub(/\n(?= *<%(?!=))/, '') # remove leading newline

  template = ERB.new(input, trim_mode: '<>')
  template.filename = t.source + '.tmp'
  File.write(template.filename, input) # for error line numbers

  output = template.result()
    .gsub(/ +$/, '') # remove trailing spaces
    .gsub(/\n+(?= +#(?!define))/, "\n") # tighten #elif
  File.write(t.name, output)
end

rule '.dtsi.min' => '.dtsi' do |t|
  minified = File.read(t.source)
    .gsub(%r{^\s*//(?! ==== ).*}, '') # remove comment lines
    .gsub(%r{(?<=[^\*])//.*}, '') # remove trailing comments
    .gsub(/^\s+/, '') # remove indentation
    .squeeze("\n") # remove blank lines
    .squeeze(' ') # remove extra spaces
  File.write(t.name, minified)
end

#-----------------------------------------------------------------------------
# Graphviz DOT for diagrams
#-----------------------------------------------------------------------------

task :dot => ['define.svg', 'define.json']

file 'define.svg' => 'define.dot' do |t|
  sh "dot -Tsvg #{t.prerequisites[0]} > #{t.name}"
end

file 'define.dot' => ['define.dot.erb', 'keymap.dtsi.min', 'device.dtsi.min'] do |t|
  sh "erb #{t.prerequisites[0]} > #{t.name}"
end

file 'define.json' => ['keymap.dtsi.min', 'device.dtsi.min'] do |t|
  defaults =
    `grep -h -A1 '#ifndef' #{t.prerequisites.join(' ')} | grep '#define'`
    .gsub(/#define (\w+)/, '\1 =')
    .lines.inject({}) do |hash, line|
      setting = line[/\w+/]
      value = eval(line) rescue nil
      hash[setting] = value if value
      hash
    end
  File.write(t.name, JSON.pretty_generate({defaults: defaults}))
end

#-----------------------------------------------------------------------------
# printable layer map diagrams
#-----------------------------------------------------------------------------

layers_pdf = 'README/all-layer-diagrams.pdf'
task :pdf => layers_pdf

layers_pdf_sequence = %w[
  base
  engrammer
  lower
  magic
  cursor
  number
  function
  emoji
  symbol
  mouse
  system
  world
  typing
  gaming
  factory
  template
]

layer_pngs = Dir["README/{#{layers_pdf_sequence.join(",")}}-layer-diagram.png"]

layer_pdfs = layer_pngs.map do |png|
  pdf = png.ext('pdf')
  file pdf => png
  pdf
end
CLEAN.include layer_pdfs

file layers_pdf => layer_pdfs do |t|
  sh 'pdfunite', *t.prerequisites, t.name
end
CLOBBER.include layers_pdf

rule '.pdf' => '.png' do |t|
  sh 'gm', 'convert', t.source, t.name
end

#-----------------------------------------------------------------------------
# Glove80 Layout Editor keymap (JSON)
#-----------------------------------------------------------------------------

task :json => 'keymap.json'

file 'keymap.json' => ['default.json', __FILE__] do |t|
  default = JSON.load_file(t.prerequisites[0])

  require 'pp'
  pp default.map {|k,v| [k, v.class] }.to_h

  keymap = JSON.load_file(t.name)
  layer_by_name = keymap['layer_names'].zip(keymap['layers']).to_h

  if false # extract layers from keymap.json
    layer_by_name.each do |name, layer|
      keymap_for_layer = default.clone
      keymap_for_layer['title'] = "#{name} layer for Glorious Engrammer keymap"
      keymap_for_layer['layers'][0] = layer
      keymap_for_layer['layer_names'][0] = name

      # break if name == 'Typing'
      # File.write "layouts/#{name}.json", JSON.pretty_generate(keymap_for_layer)
      File.write "layers/#{name}.json", JSON.pretty_generate(keymap_for_layer)
    end
  end

  # XXX: cut out the noise for debugging
  keymap.delete 'notes'
  keymap.delete 'custom_devicetree'
  keymap.delete 'custom_defined_behaviors'

  # choose the layers to include into the keymap
  config = YAML.load_file('config.yaml')
  config['layers'].reverse.each do |filepath|
    layout = JSON.load_file(filepath)
    keymap['tags'].unshift layout['layer_names'].first.downcase
    keymap['layer_names'].unshift layout['layer_names'].first
    keymap['layers'].unshift layout['layers'].first
  end
  File.write t.name+'.new', JSON.pretty_generate(keymap)

end
