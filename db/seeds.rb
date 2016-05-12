# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# lemon = Ingredient.create(name: "lemon")
# ice = Ingredient.create(name: "ice")
# mint = Ingredient.create(name: "mint leaves")


require 'nokogiri'
require 'open-uri'

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all


for i in 0..20
  response = open("http://www.barmano.com/drinks/ingredient/search?page=#{i}&query=keyword:")
  doc = Nokogiri::HTML(response, nil, 'utf-8')
  doc.css('.itemName').each do |element|
    name = element.search('a').inner_text
    ingredient = Ingredient.create!(name: name)
  end
end

for i in 0..12
  response = open("http://www.barmano.com/drinks/recipe/search?page=#{i}&query=recipeName:
")
  doc = Nokogiri::HTML(response, nil, 'utf-8')
  doc.css('.itemName').each do |element|
    name = element.search('a').inner_text
    cocktail = Cocktail.create!(name: name)
  end
end

