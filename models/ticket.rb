require 'active_record'
class Ticket < ActiveRecord::Base
  self.inheritance_column = :foo # Since type is reserved keyword in active-record

  belongs_to :submitter, class_name: "User"
  belongs_to :assignee, class_name: "User"

  def self.validate_column(search_term)
    return true if self.column_names.include?(search_term)
    puts "\n\nInvalid search term ##{search_term} for #{self}. Please view the list of searchable fields.\n\n"
    false
  end

  def self.search(search_term, search_value)
    tickets = self.where("#{search_term} = ?", search_value)
    if tickets.count == 0
      puts "No matches found."
    else
      puts "\n#{tickets.count} matches found.\n"
    end
    tickets.each do |t|
      t.pretty_print
    end
  end

  def pretty_print
    puts "\n=========== Ticket ===========\n"
    puts "_id\t\t\t\t\t#{_id}"
    puts "url\t\t\t\t\t#{url}"
    puts "external_id\t\t\t\t\t#{external_id}"
    puts "type\t\t\t\t\t#{type}"
    puts "subject\t\t\t\t\t#{subject}"
    puts "description\t\t\t\t\t#{description}"
    puts "priority\t\t\t\t\t#{priority}"
    puts "status\t\t\t\t\t#{status}"
    puts "submitter_id\t\t\t\t\t#{submitter_id}"
    puts "assignee_id\t\t\t\t\t#{assignee_id}"
    puts "organization_id\t\t\t\t\t#{organization_id}"
    puts "tags\t\t\t\t\t#{tags}"
    puts "has_incidents\t\t\t\t\t#{has_incidents}"
    puts "due_at\t\t\t\t\t#{due_at}"
    puts "via\t\t\t\t\t#{via}"
  end

end