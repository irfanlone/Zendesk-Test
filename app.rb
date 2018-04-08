#!/usr/bin/env ruby

require_relative 'models/user.rb'
require_relative 'models/ticket.rb'
require_relative 'models/organization.rb'

def db_configuration
   db_configuration_file = File.join(File.expand_path('..', __FILE__), '.', 'db', 'config.yml')
   YAML.load(File.read(db_configuration_file))
end

def prnthelp
  puts "Welcome to Zendesk Search"
  puts "Type 'quit' to exit at any time. Press 'Enter' to continue"
end

def looper
  ActiveRecord::Base.establish_connection(db_configuration["development"])
  prnthelp
  search_options
end

def search_options
  puts "\n1. Search Zendesk"
  puts "2. To view list of searchable fields"
  puts "Type 'quit' to exit"
  input = gets.chomp
  exit if input == "quit"
  case input.to_i
    when 1 then search
    when 2 then show_searchable_fields
    else puts "Invalid option selected."
  end
  search_options
end

def search
  puts "\n1. Search Users"
  puts "2. Search Tickets"
  puts "3. Search Organizations"
  input = gets.chomp
  exit if input == "quit"
  case input.to_i
    when 1 then search_entities("User")
    when 2 then search_entities("Ticket")
    when 3 then search_entities("Organization")
    else puts "Invalid option selected."
  end
end

def search_entities(entity)
  puts "\nEnter the search term"
  search_term = gets.chomp
  puts "Enter the search value"
  search_value = gets.chomp

  case entity
  when "User"
    search_users(search_term, search_value)
  when "Ticket"
    search_tickets(search_term, search_value)
  when "Organization"
    search_organizations(search_term, search_value)
  else
    "Puts Invalid entity."
  end
end

def search_users(search_term, search_value)
  return if !User.validate_column(search_term)
  users = User.search(search_term, search_value)
  display_results(users)
end

def search_tickets(search_term, search_value)
  return if !Ticket.validate_column(search_term)
  tickets = Ticket.search(search_term, search_value)
  display_results(tickets)
end

def search_organizations(search_term, search_value)
  return if !Organization.validate_column(search_term)
  orgs = Organization.search(search_term, search_value)
  display_results(orgs)
end

# def validate(entity, column_name)
#   return true if ActiveRecord::Base.connection.column_exists?(entity, column_name)
#   puts "\n\nInvalid search term ##{column_name} for #{entity}. Please view the list of searchable fields.\n\n"
#   false
# end

def show_searchable_fields
  puts "\nSHOWING SEARCHABLE FIELDS\n"
  puts "\n============ User Fields ==============\n"
  puts User.column_names
  puts "\n============ Ticket Fields ==============\n"
  puts Ticket.column_names
  puts "\n============ Organization Fields ==============\n"
  puts Organization.column_names
end

def display_results(matches)
  if matches.empty?
    puts "No matches found."
  else
    puts "\n#{matches.count} matches found.\n"
  end
  matches.each do |obj|
    obj.pretty_print
  end
end

looper