class AddColumnToCars < ActiveRecord::Migration
  def up
    add_column :cars, :country, :string, null: false
  end

  def down
    remove_column :cars, :country, :string
  end
end
