task :default => :dtsi

dtsi_files = FileList["*.dtsi.erb"].pathmap("%X").each do |f|
  file f => ["#{f}.erb", "world.yaml", __FILE__]
end
task :dtsi => dtsi_files

rule ".dtsi" => ".dtsi.erb" do |t|
  sh "erb #{t.source} | sed 's/ *$//' | cat -s > #{t.name}"
end
