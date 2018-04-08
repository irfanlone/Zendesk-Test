class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :_id
      t.string :url
      t.string :external_id
      t.string :type
      t.string :subject
      t.string :description
      t.string :priority
      t.string :status
      t.integer :submitter_id
      t.integer :assignee_id
      t.integer :organization_id
      t.string :tags
      t.boolean :has_incidents
      t.datetime :due_at
      t.string :via
      t.timestamps null: false
    end
  end
end
