module DisplayUtils

  def welcome_message
    puts "Welcome to Zendesk Search"
    puts "Type 'quit' to exit at any time. Press 'Enter' to continue"
  end

  def display_results(matches)
    if matches.empty?
      puts "No matches found."
      return
    end

    puts "\n#{matches.count} matches found.\n"

    matches.each do |obj|
      display_entity(obj)
    end
  end

  def display_searchable_fields
    puts "\nSHOWING SEARCHABLE FIELDS\n"
    puts "\n============ User Fields ==============\n"
    puts User.column_names
    puts "\n============ Ticket Fields ==============\n"
    puts Ticket.column_names
    puts "\n============ Organization Fields ==============\n"
    puts Organization.column_names
  end

  def display_invalid_search_term(search_term)
    puts "\n\nInvalid search term ##{search_term}. Please view the list of searchable fields.\n\n"
  end

  private

  def display_entity(entity)
    return if entity.blank?
    puts "\n=========== #{entity.class.name} ===========\n"

    entity.attributes.each do |k, v|
      puts "#{k}\t\t\t\t\t#{v}"
    end

    display_related_entities_for_user(entity) if entity.is_a? User
  end

  def display_related_entities_for_user(user)
    puts "\n=========== Submitted Tickets ===========\n"
    puts "No Submitted Tickets"if user.submitted_tickets.count == 0

    user.submitted_tickets.each_with_index do |ticket, index|
      puts "Ticket_#{index} \t\t #{ticket.subject}"
    end

    puts "\n=========== Assigned Tickets ===========\n"
    puts "No Assigned Tickets"if user.assigned_tickets.count == 0

    user.assigned_tickets.each_with_index do |ticket, index|
      puts "Ticket_#{index} \t\t #{ticket.subject}"
    end
  end
end
