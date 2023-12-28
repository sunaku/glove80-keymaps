task :default => :dtsi

dtsi_files = FileList["*.dtsi.erb"].pathmap("%X").each do |f|
  file f => FileList["#{f}.erb", "*.yaml", __FILE__]
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
end
