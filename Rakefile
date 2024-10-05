require 'rake/clean'
require 'erb'

task :default => [:dtsi, :dot, :pdf]

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
# Graphviz DOT for diagrams
#-----------------------------------------------------------------------------

task :dot => 'define.svg'

file 'define.svg' => 'define.dot' do |t|
  sh "dot -Tsvg #{t.prerequisites[0]} > #{t.name}"
end

file 'define.dot' => ['define.dot.erb', 'keymap.dtsi.min'] do |t|
  sh "erb #{t.prerequisites[0]} > #{t.name}"
end

#-----------------------------------------------------------------------------
# printable layer map diagrams
#-----------------------------------------------------------------------------

layers_pdf = 'README/all-layer-diagrams.pdf'
task :pdf => layers_pdf

layers_pdf_sequence = %w[
  base
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
