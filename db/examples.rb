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
Giftee.create!(name: 'Charles', user_id: 1)
Giftee.create!(name: 'Mark', user_id: 2)
Giftee.create!(name: 'Alex', user_id: 3)

Idea.create!(title: 'Giftcard', where: 'Amazon, DSW, Dressbarn', price: 50.00, notes: 'She is loving her kindle but also said she wants new shoes', status: 0, giftee_id: 1)
Idea.create!(title: 'Giftcard', where: 'Chipotle, DSW, Sephora', price: 50.00, notes: 'She is in law school and says she doesn\'t have money to eat out or spoil herself', status: 0, giftee_id: 2)
Idea.create!(title: 'Giftcard', where: 'Amazon, Barnes and Noble', price: 50.00, notes: 'He likes sci-fi books', status: 0, giftee_id: 3)
Idea.create!(title: 'Beer', where: 'Trillium, Night Shift', price: 50.00, notes: 'He has a problem', status: 0, giftee_id: 4)
Idea.create!(title: 'Giftcard', where: 'Amazon, NHL, Oakley, Lids', price: 50.00, notes: 'He likes to wear polo shirts and hats', status: 0, giftee_id: 5)
Idea.create!(title: 'Giftcard', where: 'Amazon', price: 50.00, notes: 'He is hard to buy for', status: 0, giftee_id: 6)

Note.create!(favorites: 'Everything', sizes: 'medium, shoes -6.5', general: 'has a kindle and iphone', giftee_id: 1)
Note.create!(favorites: 'Chipotle, Amazon, JCrew', sizes: 'small', general: 'not picky', giftee_id: 2)
Note.create!(favorites: 'amazon, movies, sci-fi books', sizes: 'medium', general: 'has a kindle', giftee_id: 3)
Note.create!(favorites: 'Everything', sizes: 'medium', general: 'not picky', giftee_id: 4)
Note.create!(favorites: 'Beer, brewing supplies, old books', sizes: 'small', general: 'pretty picky', giftee_id: 5)
Note.create!(favorites: 'polos, hats, history/biography books', sizes: 'extra large', general: 'not picky', giftee_id: 6)
