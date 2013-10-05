class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :onion
      t.integer :status
      t.integer :response
      t.integer :delivery
      t.datetime :date

      t.timestamps
    end
  end
end
