class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.datetime :published_at

      t.timestamps
    end
  end
end
