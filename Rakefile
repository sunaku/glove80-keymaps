task :default => [:dtsi, :dot]

dtsi_files = FileList["*.dtsi.erb"].pathmap("%X").each do |f|
  file f => FileList["#{f}.erb", "*.{yaml,json,zmk}", __FILE__]
end
task :dtsi => dtsi_files

require 'erb'
rule ".dtsi" => ".dtsi.erb" do |t|
  input = File.read(t.source)
    # NOTE: this may shift line numbers, hence dump *.tmp below
    .gsub(/\n(?= *<%(?!=))/, "") # remove leading newline

  template = ERB.new(input, trim_mode: "<>")
  template.filename = t.source + ".tmp"
  File.write(template.filename, input) # for error line numbers

  output = template.result()
    .gsub(/ +$/, "") # remove trailing spaces
    .gsub(/\n+(?= +#(?!define))/, "\n") # tighten #elif
  File.write(t.name, output)

  minified_output = output
    .gsub(%r{^\s*//(?! ==== ).*}, "") # remove comment lines
    .gsub(%r{(?<=[^\*])//.*}, "") # remove trailing comments
    .gsub(/^\s+/, "") # remove indentation
    .squeeze("\n") # remove blank lines
    .squeeze(" ") # remove extra spaces
  File.write(t.name + ".min", minified_output)
end

file "define.dot" => ["define.dot.erb", "keymap.dtsi.min", __FILE__] do |t|
  sh "erb #{t.prerequisites[0]} > #{t.name}"
end
file "define.svg" => "define.dot" do |t|
  sh "dot -Tsvg #{t.prerequisites[0]} > #{t.name}"
end
task :dot => "define.svg"
