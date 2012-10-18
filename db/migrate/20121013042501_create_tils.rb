class CreateTils < ActiveRecord::Migration
  def change
    create_table :tils do |t|
      t.text :body
      t.string :slug

      t.timestamps
    end
  end
end
