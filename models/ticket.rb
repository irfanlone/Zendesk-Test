require 'active_record'
class Ticket < ActiveRecord::Base
  self.inheritance_column = :foo # Since type is reserved keyword in active-record

  belongs_to :submitter, class_name: "User"
  belongs_to :assignee, class_name: "User"

  scope :search_tags, ->(search_value) { where("tickets.tags LIKE ?", "%#{search_value}%") }

  def self.column_searchable?(column_name)
    self.column_names.include?(column_name.downcase)
  end

  def self.search(search_term, search_value)
    return self.search_tags(search_value) if search_term == "tags"

    self.where("#{search_term} = ?", search_value)
  end
end