class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :_id
      t.string :url
      t.string :external_id
      t.string :name
      t.string :domain_names
      t.string :details
      t.boolean :shared_tickets
      t.string :tags
      t.timestamps null: false
    end
  end
end