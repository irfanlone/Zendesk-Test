#!/usr/bin/env ruby

require_relative 'models/user.rb'
require_relative 'models/ticket.rb'

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
  u = User.last
  u.pretty_print
end

def search_options
  puts "1. Search Zendesk"
  puts "2. To view list of searchable fields"
  puts "Type 'quit' to exit"
  case gets.chomp.to_i
    when 1 then search
    when 2 then show_searchable_fields
  end
end

def show_searchable_fields
  puts "SHOWING SEARCHING FIELDS"
end

def search
  puts "1. Search Users"
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
  puts "Enter the search value"
  search_value = gets.chomp
  puts "you are searching for users with #{search_term} = #{search_value}"

  users_file = File.read('users.json')
  users_hash = JSON.parse(users_file)

  # puts "\n\n users_hash = #{users_hash} \n\n"
  result = nil
  users_hash.each do |user|
    if user[search_term] == search_value
      result = "User Found!!"
    end
  end

  if result.nil?
    result = "User Not Found!!"
  end

  puts result
end

def search_tickets
  puts "Enter the search term"
  search_term = gets.chomp
  puts "Enter the search value"
  search_value = gets.chomp
  puts "you are searching for tickets with #{search_term} = #{search_value}"

  tickets_file = File.read('tickets.json')
  tickets_hash = JSON.parse(tickets_file)
  puts "\n\n tickets_hash = #{tickets_hash} \n\n"

  result = nil
  tickets_hash.each do |ticket|
    if ticket[search_term] == search_value
      result = "Ticket Found!!"
    end
  end

  if result.nil?
    result = "Ticket Not Found!!"
  end

  puts result
end

def search_organizatios
  puts "Enter the search term"
  search_term = gets.chomp
  puts "Enter the search value"
  search_value = gets.chomp

  puts "you are searching for organizations with #{search_term} = #{search_value}"
end

looper