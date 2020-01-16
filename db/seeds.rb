# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

User.create!(name: "Admin",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
User.create!(name: "Superior1",
             email: "Superior1@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true)

User.create!(name: "Superior2",
             email: "Superior2@email.com",
             password: "password",
             password_confirmation: "password",
             superior: true)

User.create!(name: "Staff1",
             email: "staff1@email.com",
             password: "password",
             password_confirmation: "password")
             
User.create!(name: "Staff2",
             email: "staff2@email.com",
             password: "password",
             password_confirmation: "password")

10.times do |n|
  name = Faker::Name.name
  email ="sample-#{n+1}@email.com"
  password = "password"
  User.create(name: name,
              email: email,
              password: password,
              password_confirmation: password)
end
