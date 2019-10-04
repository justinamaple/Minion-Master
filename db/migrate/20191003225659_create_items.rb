class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :slot
      t.integer :rarity
      t.string :description
      t.integer :inside_id
      t.string :inside_type

      t.timestamps
    end
  end
end
