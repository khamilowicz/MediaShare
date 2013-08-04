namespace :db do 
  desc "Drop, migrate and prepare test"
  task :prepare_all => :environment do 

    Rake::Task['db:drop'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke
    puts "DBs are prepared"
  end
  
end