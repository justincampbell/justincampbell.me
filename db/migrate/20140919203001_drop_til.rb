class DropTil < ActiveRecord::Migration
  def up
    drop_table :tils
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
