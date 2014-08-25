require 'rake/testtask'
#To invoke rake task     
# BROWSER=safari rake spec:livewire             You can choose what browser you want to use, if you use the launch_browser method
# rake spec:FolderName                          This will run all the files in the folder
# rake spec:FileNameInSandBox                   This runs a specific file in the sandbox folder (only works for the sandbox)
namespace :spec do

    Rake::TestTask.new do |t|
      t.libs = ["support"]
      t.name = :livewire
      t.warning = false
      t.verbose = false
      t.test_files = FileList['spec/livewire/*_spec.rb']
    end

    Rake::TestTask.new do |t|
      t.libs = ["support"]
      t.name = :sandbox
      t.warning = false
      t.verbose = false
      t.test_files = FileList['spec/sandbox/*_spec.rb']
    end

    Rake::TestTask.new do |t|
      t.libs = ["support"]
      t.name = :sandbox_spec
      t.warning = false
      t.verbose = false
      t.test_files = FileList['spec/sandbox/sandbox_spec.rb']
    end



  		#######This rule runs file individually in the sandbox
      	#######It expects a sandbox directory
      	####### rake spec:security   will run the security_spec.rb file
          rule(/spec:.+/) do |t|
          name = t.name.gsub("spec:","")
          path = File.join( File.dirname(__FILE__),'spec/sandbox','%s_spec.rb'%name )
            if File.exist? path
              Rake::TestTask.new(name) do |t|
                t.test_files = [path]
                t.libs = ["support"]
              end
              puts "\nRunning spec/%s_spec.rb"%[name]
              Rake::Task[name].invoke
            else
              puts "File does not exist: %s"%path
            end
        end
end



