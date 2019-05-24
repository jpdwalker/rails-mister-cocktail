# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Dose.destroy_all
# Ingredient.destroy_all
# Cocktail.destroy_all

# puts "creating three ingredients"
# ingredient_one = Ingredient.create(name: "ice")
# ingredient_two = Ingredient.create(name: "mint leaves")
# ingredient_three = Ingredient.create(name: "lemon")

# ingredients = [ingredient_one, ingredient_two, ingredient_three]

# puts "creating cocktails and doses "
# 5.times do
#   cocktail = Cocktail.create!(name: Faker::Cannabis.cannabinoid )
#   5.times do
#     Dose.create!(
#       description: Faker::Cannabis.buzzword,
#       cocktail: cocktail,
#       ingredient: ingredients.sample
#     )
#   end
# end

require 'open-uri'
require 'json'

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredient_serialized = open(url).read
ingredients = JSON.parse(ingredient_serialized)

ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end
