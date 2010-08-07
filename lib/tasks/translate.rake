
namespace :translate do
	
	task :init do |t, args|
		args.with_defaults(:repo => "git://github.com/teambox/teambox.git")
		%x{"bundle install"}
		%x{"script/generate tolk_migration"}
		Rake::Task['db:migrate'].invoke
		%x{"git clone #{args.repo}"}
		Rake::Task[':pull'].invoke
		Rake::Task['tolk:sync'].invoke
		Rake::Task['tolk:import'].invoke
	end
            
	task :pull do
    	File.copy("teambox/config/locales","config/locales")
  	end
  	
	task :push do
    	File.copy("config/locales","teambox/config/locales")
  	end
end