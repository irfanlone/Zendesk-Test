require 'active_record'

class Ticket < ActiveRecord::Base
  self.inheritance_column = :foo # Since type is reserved keyword in active-record

  belongs_to :submitter, class_name: "User"
  belongs_to :assignee, class_name: "User"

  def pretty_print
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