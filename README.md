# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




# StepsToBeFollowed:
  * Create the Scaffolded Module for the "users" table with the attributes of firstname,lastname,email
  * Followed by this install whenever on the local system
  * Once the Things are done we just add the whenever gem to the Gemfile and then execute the following commands .
  * do bundle install
  * Now execute the command $ wheneverize .
  * On execution we create a file in the folder under config a file called schedule.rb
  * In schedule.rb we write the whenever dsl syntax for the sake fof the configuration 
  * Now i followed the Documentation from medium https://medium.com/coffee-and-codes/schedule-tasks-using-whenever-gem-ruby-on-rails-50b9af025607.
  * Now in this documentation an important commands that i have found is 
  ```  
    $ rails g task my_custom_namespace my_task1 my_task2 my_task3
  ```  
  * Now once the command is made to execute there are another commands that have to be done like in schedule.rb 
  ```
    ENV[‘RAILS_ENV’] = “development”
    set :output, ‘log/whenever.log’
    every 1.day, :at => ‘10:20 am’ do
       rake “news:fetch”
    end
  ``` 
  * Once the tasks are done now we can update the cron tab with the command
  ```
    $ whenever --update-crontab

  ``` 
  * The above command tries to convert the things written in the Ruby Language this can be converted into the machine level cron language and will be stored in the crontab file
  * The command that we can execute to edit the cron tab file is 
  ```
    $ crontab -e
  ```
  * Now once the cronfile got updated the things are ready to be outputed into the file name whenever.log 
  * So thus ends the implementation of cron
  * Very Easy,Simple and elegant
  * some configuration in config/application.rb 
    ```
    config.autoload_paths << Rails.root.join('lib')
    ```
  * By this line we reduced the error of Undefined Model to which we are referring in the rake task 


# The Advantage that i have taken out of the cron
  * We have gone through the process of making rotational logs that reduces the cost of the company to pay for papertrail on heroku
  file_handle = File.open('log/development.log','r') 
  * Now that you have the file handle we need to open the file and read from it
  imported_notes = file_handle.read
  puts "------------These are are the file handles from #{Time.now}----------------"
  write_file_handle = File.open("log/#{Time.now}_development.log",'w')
  write_file_handle.write(imported_notes)
  File.open('log/development.log', 'w') do |file| 
    file.truncate(0)
  end

