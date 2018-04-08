require 'active_record'
class Organization < ActiveRecord::Base

  has_many :users

  def self.validate_column(search_term)
    return true if self.column_names.include?(search_term)
    puts "\n\nInvalid search term ##{search_term} for #{self}. Please view the list of searchable fields.\n\n"
    false
  end

  def self.search(search_term, search_value)
    orgs = self.where("#{search_term} = ?", search_value)
    if orgs.count == 0
      puts "No matches found."
    else
      puts "\n#{orgs.count} matches found.\n"
    end
    orgs.each do |o|
      o.pretty_print
    end
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