require_relative 'models/user.rb'
require_relative 'models/ticket.rb'
require_relative 'models/organization.rb'
require_relative 'lib/display_utils.rb'

class Search
  include DisplayUtils

  def run(entity, search_term, search_value)
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

  private

  def search_users(search_term, search_value)
    if !User.column_searchable?(search_term)
      display_invalid_search_term(search_term)
      return
    end

    User.search(search_term, search_value)
  end

  def search_tickets(search_term, search_value)
    if !Ticket.column_searchable?(search_term)
      display_invalid_search_term(search_term)
      return
    end

    Ticket.search(search_term, search_value)
  end

  def search_organizations(search_term, search_value)
    if !Organization.column_searchable?(search_term)
      display_invalid_search_term(search_term)
      return
    end

    Organization.search(search_term, search_value)
  end
end