require 'rake/clean'
require 'erb'

task :default => [:dtsi, :btt, :dot]

#-----------------------------------------------------------------------------
# ZMK configuration snippet (DTSI)
#-----------------------------------------------------------------------------

dtsi_files = FileList['*.dtsi.erb'].each do |erb|
  dtsi = erb.pathmap('%X')
  file dtsi => FileList[erb, '*.{yaml,json,zmk}', __FILE__]
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
# Overlay indicator helpers
#-----------------------------------------------------------------------------

#MacOS BetterTouchTool
btt_zip_dir_files = FileList['layer-indicator/macos/BetterTouchTool/bttpreset-zipdir/**/*']
task :btt => %w[layer-indicator/macos/BetterTouchTool/bttpreset-zipdir/presetjson.bttpreset layer-indicator/macos/BetterTouchTool/Glove80-Engrammer-Keyboard-Overlay-Preset.bttpresetzip]

# Create preset file if erb has changed
file 'layer-indicator/macos/BetterTouchTool/bttpreset-zipdir/presetjson.bttpreset' => 'layer-indicator/macos/BetterTouchTool/presetjson.bttpreset.erb' do |t|
  sh "erb #{t.prerequisites[0]} > #{t.name}"
end
#Create preset zip file if anything under the bttpreset-zipdir dir changes, which includes the preset file.
file 'layer-indicator/macos/BetterTouchTool/Glove80-Engrammer-Keyboard-Overlay-Preset.bttpresetzip' => btt_zip_dir_files do |t|
  sh "cd layer-indicator/macos/BetterTouchTool/bttpreset-zipdir; zip -FSr '../#{File.basename(t.name)}' *"
end


#-----------------------------------------------------------------------------
# Graphviz DOT for diagrams
#-----------------------------------------------------------------------------

task :dot => 'define.svg'

file 'define.svg' => 'define.dot' do |t|
  sh "dot -Tsvg #{t.prerequisites[0]} > #{t.name}"
end

file 'define.dot' => ['define.dot.erb', 'keymap.dtsi.min'] do |t|
  sh "erb #{t.prerequisites[0]} > #{t.name}"
end
