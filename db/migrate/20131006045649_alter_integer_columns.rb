class AlterIntegerColumns < ActiveRecord::Migration
  def up
    change_table :statuses do |t|
      t.change :delivery, :float
      t.change :response, :float
    end
  end
end
