require 'active_record'
class User < ActiveRecord::Base

  has_many :submitted_tickets, foreign_key: :submitter_id, class_name: "Ticket"
  has_many :assigned_tickets, foreign_key: :assignee_id, class_name: "Ticket"

  belongs_to :organization

  scope :search_tags, ->(search_value) { where("users.tags LIKE ?", "%#{search_value}%") }

  def self.column_searchable?(column_name)
    self.column_names.include?(column_name.downcase)
  end

  def self.search(search_term, search_value)
    return self.search_tags(search_value) if search_term == "tags"

    self.where("#{search_term} = ?", search_value)
  end
end