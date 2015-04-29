require 'faker'
require 'factory_girl'

FactoryGirl.define do
  factory :book do
    title       Faker::Name.title
    description Faker::Lorem.paragraph
    rating      Faker::Number.digit
    year        2013
    isbn        1234567

    association :authors, factory: :author
    association :publisher, factory: :publisher
    association :genres, factory: :genre
    association :tags, factory: :tag
  end

  factory :author do
    name        Faker::Name.name
    biography   Faker::Lorem.paragraph
  end

  factory :publisher do
    name        Faker::Name.name
  end

  factory :genre do
    name        Faker::Lorem.word
  end

  factory :tag do
    name        Faker::Lorem.word
  end

  factory :user do
    name       Faker::Name.title
    password   Faker::Lorem.word
    access     admin
  end
end