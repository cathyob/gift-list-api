# frozen_string_literal: true
# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(cathy mike jamie ashley).each do |name|
  email = "#{name}@#{name}.com"
  next if User.exists? email: email
  User.create!(email: email,
               password: 'test123',
               password_confirmation: nil)
end

Giftee.create!(name: 'Bobbi', user_id: 1)
Giftee.create!(name: 'Ashley', user_id: 2)
Giftee.create!(name: 'Curtis', user_id: 3)
Giftee.create!(name: 'Laura', user_id: 4)
Giftee.create!(name: 'Charles', user_id: 1)
Giftee.create!(name: 'Mark', user_id: 2)
Giftee.create!(name: 'Alex', user_id: 3)
Giftee.create!(name: 'Jeff', user_id: 4)
