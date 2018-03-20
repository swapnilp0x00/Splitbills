class CreateBillParts < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_parts do |t|
      t.integer :bill_id
      t.integer :participant_id
      t.integer :amount

      t.timestamps
    end
  end
end
