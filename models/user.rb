require 'active_record'
class User < ActiveRecord::Base

  has_many :submitted_tickets, foreign_key: :submitter_id, class_name: "Ticket"
  has_many :assigned_tickets, foreign_key: :assignee_id, class_name: "Ticket"

  belongs_to :organization

  def self.validate_column(search_term)
    return true if self.column_names.include?(search_term)
    puts "\n\nInvalid search term ##{search_term} for #{self}. Please view the list of searchable fields.\n\n"
    false
  end

  def self.search(search_term, search_value)
    users = self.where("#{search_term} = ?", search_value)
    if users.count == 0
      puts "No matches found."
    else
      puts "\n#{users.count} matches found.\n"
    end
    users.each do |u|
      u.pretty_print
    end
  end

  def pretty_print
    puts "\n=========== User ===========\n"
    puts "_id\t\t\t\t\t#{_id}"
    puts "name\t\t\t\t\t#{name}"
    puts "url\t\t\t\t\t#{url}"
    puts "external_id\t\t\t\t\t#{external_id}"
    puts "active\t\t\t\t\t#{active}"
    puts "verified\t\t\t\t\t#{verified}"
    puts "shared\t\t\t\t\t#{shared}"
    puts "locale\t\t\t\t\t#{locale}"
    puts "timezone\t\t\t\t\t#{timezone}"
    puts "last_login_at\t\t\t\t\t#{last_login_at}"
    puts "phone\t\t\t\t\t#{phone}"
    puts "signature\t\t\t\t\t#{signature}"
    puts "organization_id\t\t\t\t\t#{organization_id}"
    puts "tags\t\t\t\t\t#{tags}"
    puts "suspended\t\t\t\t\t#{suspended}"
    puts "role\t\t\t\t\t#{role}"

    puts "\n=========== Submitted Tickets ===========\n"
    puts "No Submitted Tickets"if self.submitted_tickets.count == 0
    self.submitted_tickets.each_with_index do |ticket, index|
      puts "Ticket_#{index} \t\t #{ticket.subject}"
    end

    puts "\n=========== Assigned Tickets ===========\n"
    puts "No Assigned Tickets"if self.assigned_tickets.count == 0
    self.assigned_tickets.each_with_index do |ticket, index|
      puts "Ticket_#{index} \t\t #{ticket.subject}"
    end
  end

end