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
  case gets.chomp.to_i
    when 1 then search
    when 2 then show_searchable_fields
  end
  search_options
end

def search
  puts "\n1. Search Users"
  puts "2. Search Tickets"
  puts "3. Search Organizations"
  case gets.chomp.to_i
    when 1 then search_users
    when 2 then search_tickets
    when 3 then search_organizatios
  end
end

def search_users
  puts "Enter the search term"
  search_term = gets.chomp
  return if !User.validate_column(search_term)
  puts "Enter the search value"
  search_value = gets.chomp
  puts "you are searching for users with #{search_term} = #{search_value}"

  User.search(search_term, search_value)
end

def search_tickets
  puts "Enter the search term"
  search_term = gets.chomp
  return if !Ticket.validate_column(search_term)
  puts "Enter the search value"
  search_value = gets.chomp
  puts "you are searching for tickets with #{search_term} = #{search_value}"

  Ticket.search(search_term, search_value)
end

def search_organizatios
  puts "Enter the search term"
  search_term = gets.chomp
  return if !Organization.validate_column(search_term)
  puts "Enter the search value"
  search_value = gets.chomp
  puts "you are searching for organizations with #{search_term} = #{search_value}"

  Organization.search(search_term, search_value)
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

looper