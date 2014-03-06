# Generating a model, i.e the Games model:
rails generate model Game name:string

# to actually migrate the created migration
bundle exec rake db:migrate

# seed db with data from db/seed.db
bundle exec rake db:seed

# adding a column to a model
rails generate migration add_something_to_games something:integer

# reomve a column from a model
rails generate migration remove_something_from_games something:integer

# destroying a migration
rails destroy migration add_something_to_games

# adding an index to a model example:
rails generate migration add_index_to_games_name

# undoing a migration 
bundle exec rake db:rollback