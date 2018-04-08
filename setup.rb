#!/usr/bin/env ruby

def safe_system(command)
  result = system(command)
  if !result
    puts "\n\nCommand Failed!: #{command}"
    abort
  end
end

puts "\n\nUpdating Ruby dependencies."
safe_system("bundle")

puts "\n\nMigrating database."
safe_system("rake db:migrate")

puts "\n\nSeeding data."
safe_system("bundle exec ruby seed.rb")