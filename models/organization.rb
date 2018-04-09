require 'active_record'
class Organization < ActiveRecord::Base

  has_many :users

  def self.column_searchable?(column_name)
    self.column_names.include?(column_name)
  end

  def self.search(search_term, search_value)
    self.where("#{search_term} = ?", search_value)
  end
end