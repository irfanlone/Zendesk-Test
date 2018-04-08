require 'active_record'

class User < ActiveRecord::Base

  has_many :submitted_tickets, foreign_key: :submitter_id, class_name: "Ticket"
  has_many :assigned_tickets, foreign_key: :assignee_id, class_name: "Ticket"

  belongs_to :organization

  def pretty_print
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

    puts "\n *********** Submitted Tickets **************** \n\n"
    self.submitted_tickets.each_with_index do |ticket, index|
      puts "Ticket_#{index} \t\t #{ticket.subject}"
    end

    puts "\n *********** Assigned Tickets **************** \n\n"
    self.assigned_tickets.each_with_index do |ticket, index|
      puts "Ticket_#{index} \t\t #{ticket.subject}"
    end
  end

end