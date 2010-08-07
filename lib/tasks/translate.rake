
namespace :translate do
	
	task :init do |t, args|
		args.with_defaults(:repo => "git://github.com/teambox/teambox.git")
		system("bundle install")
		system("script/generate tolk_migration")
		Rake::Task['db:migrate'].invoke
		system("git clone #{args.repo} teambox_temp")
		Rake::Task['translate:pull'].invoke
	end
            
	task :pull do |t, args|
		args.with_defaults(:lang => "sl")
		puts "Copying updated translations from repo"
		system("cd teambox_temp && git pull")
		system("cp -f teambox_temp/config/locales config/locales/en.yml")
    	system("cp -f teambox_temp/config/locales config/locales/#{args.repo}.yml")
    	system("rake tolk:sync")
		system("rake tolk:import")
  	end
  	
	task :push do
		puts "Copying updated translations to repo"
    	system("cp -rf config/locales teambox_temp/config")
    	system("cd teambox_temp && git add . && git commit -m 'Updated transaltion' && git push")
  	end
  	
 	task :pullall do
		puts "Copying updated translations from repo"
		system("cd teambox_temp && git pull")
    	system("cp -rf teambox_temp/config/locales config")
  	end
  		
  	task :reset do |t, args|
  		Rake::Task['translate:clean'].invoke
		Rake::Task['translate:init'].invoke
  	end
  	
  	task :clean do
  		puts "Cleaning"
    	system("rm -rf teambox_temp") 
    	system("rm -rf db/migrate") 
    	system("rm -f db/development.sqlite3")
    	system("rm -f db/schema.rb")
    	system("rm -rf config/locales")
    	system("git reset --hard")
		system("git checkout config/locales")
  	end
end 