require 'active_record'

class User < ActiveRecord::Base

  def pretty_print
    puts "_id\t\t\t\t\t#{_id}"
    puts "name\t\t\t\t\t#{name}"
    puts "url\t\t\t\t\t#{url}"
    puts "external_id\t\t\t\t\t#{external_id}"
    puts "active\t\t\t\t\t#{active}"
    puts "verified\t\t\t\t\t#{verified}"
    puts "shared\t\t\t\t\t#{shared}"
    puts "locale\t\t\t\t\t#{locale}"
    puts "timezone\t\t\t\t\t#{timezone}"
    puts "last_login_at\t\t\t\t\t#{last_login_at}"
    puts "phone\t\t\t\t\t#{phone}"
    puts "signature\t\t\t\t\t#{signature}"
    puts "organization_id\t\t\t\t\t#{organization_id}"
    puts "tags\t\t\t\t\t#{tags}"
    puts "suspended\t\t\t\t\t#{suspended}"
    puts "role\t\t\t\t\t#{role}"
  end

      # t.string :_id
      # t.string :url
      # t.string :external_id
      # t.string :name

      # t.string :alias
      # t.boolean :active
      # t.boolean :verified
      # t.boolean :shared
      # t.string :locale
      # t.string :timezone
      # t.datetime :last_login_at
      # t.string :email

      # t.string :phone
      # t.string :signature
      # t.integer :organization_id
      # t.string :tags
      # t.boolean :suspended
      # t.string :role

end