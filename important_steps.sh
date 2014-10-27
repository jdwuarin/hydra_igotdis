# Generating a model, i.e the Games model:
rails generate model Game name:string

# to actually migrate the created migration
bundle exec rake db:migrate

# seed db with data from db/seed.db
bundle exec rake db:seed

# adding a column to a model
rails generate migration add_something_to_games something:integer

# reomove a column from a model
rails generate migration remove_something_from_games

# destroying a migration
rails destroy migration add_something_to_games

# adding an index to a model example:
rails generate migration add_index_to_games_name

# undoing a migration 
bundle exec rake db:rollback

#add admin flag to User model
rails generate migration add_admin_flag_to_users admin:bool

#for activeadmin
rails g active_admin:install              # creates the AdminUser class (What I did)
rails g active_admin:install User         # uses an existing class
rails g active_admin:install --skip-users # if devise already installed

rails generate active_admin:resource # to generate admin resource for a model


#installing Bootstrap:

"Actually you don't need gem for this, here is 
the step to install Bootstrap 3 in RoR
"
Download Bootstrap

Copy:

bootstrap/dist/css/bootstrap.css and bootstrap/dist/css/bootstrap.min.css

To: vendor/assets/stylesheets

Copy:

bootstrap/dist/js/bootstrap.js and bootstrap/dist/js/bootstrap.min.js

To: vendor/assets/javascripts

Update: app/assets/stylesheets/application.css by adding:

*= require bootstrap.min
Update: app/assets/javascripts/application.jsby adding:

//= require bootstrap.min
