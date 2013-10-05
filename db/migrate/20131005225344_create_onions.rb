class CreateOnions < ActiveRecord::Migration
  def change
    create_table :onions do |t|
      t.string :title
      t.string :name
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
