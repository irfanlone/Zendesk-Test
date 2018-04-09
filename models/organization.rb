require 'active_record'
class Organization < ActiveRecord::Base

  has_many :users

  scope :search_tags, ->(search_value) {
    where("organizations.tags LIKE ?", "%#{search_value}%")
  }

  scope :search_domains, ->(search_value) {
    where("organizations.domain_names LIKE ?", "%#{search_value}%")
  }

  def self.column_searchable?(column_name)
    self.column_names.include?(column_name.downcase)
  end

  def self.search(search_term, search_value)
    case search_term
    when "tags"
      self.search_tags(search_value)
    when "domain_names"
      self.search_domains(search_value)
    else
      self.where("#{search_term} = ?", search_value)
    end
  end
end