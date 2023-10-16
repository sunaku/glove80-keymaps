task :default => :dtsi

task :dtsi => FileList["*.dtsi.erb"].pathmap("%X")
rule ".dtsi" => ".dtsi.erb" do |t|
  sh "erb #{t.source} > #{t.name}"
end
