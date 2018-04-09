require_relative "models/user.rb"
require_relative "models/ticket.rb"
require_relative "models/organization.rb"
require_relative "lib/display_utils.rb"

# Performs a case in-sensitive search on the current schema table with a
# specified field name and its value.
#
# It take the model name on which you want to perform search as input
# In addition its takes the field name and search string as it input
#
# It returns an array of matching active record objects for the search.
# It return an empty array in case nothing is matched.
# It return nil if the wrong field is supplied as input.
#
#  Usage:
#  my_search = Search.new
#  my_search.run(User, "name", "Rose Newton")

class Search
  include DisplayUtils

  # @param {Entity} entity
  # @return {String} search_term
  # @return {String} search_value
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