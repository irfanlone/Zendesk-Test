require_relative 'models/user.rb'
require_relative 'models/ticket.rb'
require_relative 'models/organization.rb'
require_relative 'lib/display_utils.rb'

class Search
  include DisplayUtils

  def initialize
    ActiveRecord::Base.establish_connection(db_configuration["development"])
    welcome_message
  end

  def start_search
    while true
      puts "\n1. Search Zendesk"
      puts "2. To view list of searchable fields"
      puts "Type 'q' to exit"

      input = gets.chomp
      exit if input.downcase == "q"

      case input.to_i
      when 1
        search
      when 2
        display_searchable_fields
      else
        puts "Invalid option selected."
      end
    end
  end

  private

  def search
    puts "\n1. Search Users"
    puts "2. Search Tickets"
    puts "3. Search Organizations"

    input = gets.chomp
    exit if input.downcase == "q"

    case input.to_i
    when 1
      search_entities(:user)
    when 2
      search_entities(:ticket)
    when 3
      search_entities(:organization)
    else
      puts "Invalid option selected."
    end
  end

  def search_entities(entity)
    puts "\nEnter the search term"
    search_term = gets.chomp
    puts "Enter the search value"
    search_value = gets.chomp

    case entity
    when :user
      search_users(search_term, search_value)
    when :ticket
      search_tickets(search_term, search_value)
    when :organization
      search_organizations(search_term, search_value)
    else
      "Puts Invalid entity."
    end
  end

  def search_users(search_term, search_value)
    return if !User.column_searchable?(search_term)

    users = User.search(search_term, search_value)
    display_results(users)
  end

  def search_tickets(search_term, search_value)
    return if !Ticket.column_searchable?(search_term)

    tickets = Ticket.search(search_term, search_value)
    display_results(tickets)
  end

  def search_organizations(search_term, search_value)
    return if !Organization.column_searchable?(search_term)

    organizations = Organization.search(search_term, search_value)
    display_results(organizations)
  end

  def db_configuration
    db_configuration_file = File.join(File.expand_path('..', __FILE__), '.', 'db', 'config.yml')
    YAML.load(File.read(db_configuration_file))
  end
end