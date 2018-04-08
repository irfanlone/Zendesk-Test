require 'json'
require_relative 'models/user'
require_relative 'models/ticket'
require 'active_record'

def db_configuration
   db_configuration_file = File.join(File.expand_path('..', __FILE__), '.', 'db', 'config.yml')
   YAML.load(File.read(db_configuration_file))
end

def seed_data
  ActiveRecord::Base.establish_connection(db_configuration["development"])

  entity_file = File.read('tickets.json')
  json_objects = JSON.parse(entity_file)

  json_objects.each { |obj| Ticket.create!(obj) }
end

db_configuration
seed_data