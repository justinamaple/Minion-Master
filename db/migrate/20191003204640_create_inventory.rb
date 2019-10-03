class CreateInventory < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory do |t|
      t.integer :account_id
      t.integer :space, default: 30

      t.timestamps
    end
  end
end
