# frozen_string_literal: true
require 'random_name_generator'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
@rng = RandomNameGenerator.new
justin = Account.create(email: 'justinamaple@gmail.com', password: 'asdf')
justin.create_inventory

def randomize_equipment(character)
  character.create_equipment
  slots = %w[Weapon Armor Pet]
  slots.each do |slot|
    character.equipment.items.create(
      name: @rng.compose(3),
      slot: slot,
      rarity: rand(0..4),
      description: @lorem
    )
  end
end

joe = justin.characters.create(name: 'Joe', level: 1, race: 'Human')
randomize_equipment(joe)

jenny = justin.characters.create(name: 'Jenny', level: 1, race: 'Human', gender: 'Female')
randomize_equipment(jenny)

ham = justin.characters.create(name: 'Ham', level: 1, race: 'Plant', gender: 'Other')
randomize_equipment(ham)

slots = %w[Weapon Armor Pet]
20.times do
  justin.inventory.items.create(name: @rng.compose(3), slot: slots.sample, rarity: rand(0..4), description: @lorem)
end
