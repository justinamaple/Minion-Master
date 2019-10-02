class AddGenderToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :gender, :string, default: 'm'
  end
end
