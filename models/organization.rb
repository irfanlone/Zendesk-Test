require 'active_record'
class Organization < ActiveRecord::Base

  has_many :users

  def self.validate_column(column_name)
    return true if self.column_names.include?(column_name)
    puts "\n\nInvalid search term ##{column_name} for #{self}. Please view the list of searchable fields.\n\n"
    false
  end

  def self.search(search_term, search_value)
    self.where("#{search_term} = ?", search_value)
  end

  def pretty_print
    puts "\n=========== Organization ===========\n"
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