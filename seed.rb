require 'json'
require_relative 'models/user'
require_relative 'models/ticket'
require_relative 'models/organization'
require 'active_record'

def db_configuration
   db_configuration_file = File.join(File.expand_path('..', __FILE__), '.', 'db', 'config.yml')
   YAML.load(File.read(db_configuration_file))
end

def seed_data
  ActiveRecord::Base.establish_connection(db_configuration["development"])

  # seed users
  users_file = File.read('json/users.json')
  users_json_objects = JSON.parse(users_file)
  users_json_objects.each do |obj|
    next if User.exists?(obj["_id"])
    user = User.new(obj)
    user.id = user._id
    user.save!
  end

  # seed tickets
  tickets_file = File.read('json/tickets.json')
  tickets_json_objects = JSON.parse(tickets_file)
  tickets_json_objects.each do |obj|
    next if Ticket.where(_id: obj["_id"]).count > 0
    Ticket.create!(obj)
  end

  # seed organizations
  organizations_file = File.read('json/organizations.json')
  organizations_json_objects = JSON.parse(organizations_file)
  organizations_json_objects.each do |obj|
    next if Organization.exists?(obj["_id"])
    org = Organization.new(obj)
    org.id = org._id
    org.save!
  end
end

db_configuration
seed_data