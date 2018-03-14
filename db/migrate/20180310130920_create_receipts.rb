class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.integer :payment
      t.date :p_date
      t.integer :type_id
      t.integer :user_id
      t.text :memo

      t.timestamps
    end
  end
end
