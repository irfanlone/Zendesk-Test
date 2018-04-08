require 'active_record'
class Organization < ActiveRecord::Base

  has_many :users

  def self.column_searchable?(column_name)
    return true if self.column_names.include?(column_name)
    puts "\n\nInvalid search term ##{column_name} for #{self}. Please view the list of searchable fields.\n\n"
    false
  end

  def self.search(search_term, search_value)
    self.where("#{search_term} = ?", search_value)
  end
end