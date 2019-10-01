class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :level
      t.string :race
      t.integer :account_id

      t.timestamps
    end
  end
end
