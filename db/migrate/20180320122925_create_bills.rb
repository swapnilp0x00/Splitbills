class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.string :event
      t.date :date
      t.string :location
      t.integer :total_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
