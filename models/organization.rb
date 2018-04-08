require 'active_record'

class Organization < ActiveRecord::Base

  has_many :users

  def pretty_print
    puts "_id\t\t\t\t\t#{_id}"
    puts "url\t\t\t\t\t#{url}"
    puts "external_id\t\t\t\t\t#{external_id}"
    puts "name\t\t\t\t\t#{name}"
    puts "domain_names\t\t\t\t\t#{domain_names}"
    puts "created_at\t\t\t\t\t#{created_at}"
    puts "details\t\t\t\t\t#{details}"
    puts "shared_tickets\t\t\t\t\t#{shared_tickets}"
    puts "tags\t\t\t\t\t#{tags}"
  end

end