
namespace :translate do
	
	task :init do |t, args|
		args.with_defaults(:repo => "git://github.com/teambox/teambox.git")
		system("bundle install")
		system("script/generate tolk_migration")
		Rake::Task['db:migrate'].invoke
		system("git clone #{args.repo} teambox_temp")
		Rake::Task['translate:pull'].invoke
		system("rake tolk:sync")
		system("rake tolk:import")
	end
            
	task :pull do
		puts "Copying updated translations from repo"
    	system("cp -r teambox_temp/config/locales config")
  	end
  	
	task :push do
		puts "Copying updated translations to repo"
    	system("cp -r config/locales teambox_temp/config")
  	end
  	
  	task :reset do |t, args|
  		args.with_defaults(:repo => "git://github.com/teambox/teambox.git")
  		puts "Removing source repo"
    	system("rm -rf teambox_temp")
    	system("git clone #{args.repo} teambox_temp")
    	Rake::Task['translate:pull'].invoke
    	puts "Imporing english translation"
    	system("rake tolk:sync")
    	puts "Synchronizig translations"
		system("rake tolk:import")
  	end
  	
  	task :clean do
  		puts "Cleaning"
    	system("rm -rf teambox_temp") 
  	end
end