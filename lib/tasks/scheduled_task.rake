require 'rdoc/task'
namespace :scheduled_task do
  desc "TODO"
  task task_one: :environment do
    puts "Raja Hello World"
    puts "Hi maham vi skdjf"
    User.all
  end

  desc "Rake task to get Users"
  task :fetch => :environment do
    puts "Giving All Users"
    User.all
    puts "#{Time.now} — Success!"
  end
end
