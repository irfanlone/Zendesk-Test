#!/usr/bin/env ruby
require_relative 'search.rb'

class App
  include DisplayUtils

  VALID_ENTITIES = {
    1 => :user,
    2 => :ticket,
    3 => :organization
  }.freeze

  attr_reader :search

  def initialize
    welcome_message
    ActiveRecord::Base.establish_connection(db_configuration["development"])
    @search = Search.new
  end

  def start
    while true
      start_search
    end
  end

  private

  def start_search
    puts "\n1. Search Zendesk"
    puts "2. To view list of searchable fields"
    puts "Type 'q' to exit"

    input = gets.chomp
    exit if input.downcase == "q"

    case input.to_i
    when 1
      get_search_criteria
    when 2
      display_searchable_fields
    else
      puts "Invalid option selected."
    end
  end

  def get_search_criteria
    puts "\n1. Search Users"
    puts "2. Search Tickets"
    puts "3. Search Organizations"

    input = gets.chomp
    exit if input.downcase == "q"

    if VALID_ENTITIES.has_key?(input.to_i)
      puts "\nEnter the search term"
      search_term = gets.chomp
      puts "Enter the search value"
      search_value = gets.chomp

      matches = search.run(VALID_ENTITIES[input.to_i], search_term, search_value)
      display_results(matches) unless matches.nil?
    else
      puts "Invalid option."
    end
  end

  def db_configuration
    db_configuration_file = File.join(File.expand_path('..', __FILE__), '.', 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file))
  end
end

App.new.start