task :default => :dtsi

dtsi_files = FileList["*.dtsi.erb"].pathmap("%X").each do |f|
  file f => FileList["#{f}.erb", "*.yaml", __FILE__]
end
task :dtsi => dtsi_files

require 'erb'
rule ".dtsi" => ".dtsi.erb" do |t|
  template = ERB.new(File.read(t.source), trim_mode: "<>")
  template.filename = t.source
  output = template.result()
    .gsub(/ +$/, "")          # remove trailing spaces
    .gsub(/(?<=\n\n)\n+/, "") # squeeze excess newlines
    .gsub(/\n+(?= +#(?!define))/, "\n") # tighten #elif
  File.write(t.name, output)
end
