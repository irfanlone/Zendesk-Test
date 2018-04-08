require 'json'
require_relative 'models/user'
require 'active_record'

def db_configuration
   db_configuration_file = File.join(File.expand_path('..', __FILE__), '.', 'db', 'config.yml')
   YAML.load(File.read(db_configuration_file))
end

def seed_data
  ActiveRecord::Base.establish_connection(db_configuration["development"])

  entity_file = File.read('users.json')
  json_objects = JSON.parse(entity_file)

  json_objects.each { |obj| User.create!(obj) }
end

db_configuration
seed_data