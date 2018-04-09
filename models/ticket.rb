require 'active_record'
class Ticket < ActiveRecord::Base
  self.inheritance_column = :foo # Since type is reserved keyword in active-record

  belongs_to :submitter, class_name: "User"
  belongs_to :assignee, class_name: "User"

  def self.column_searchable?(column_name)
    self.column_names.include?(column_name)
  end

  def self.search(search_term, search_value)
    self.where("#{search_term} = ?", search_value)
  end
end