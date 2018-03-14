class CreateTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :types do |t|
      t.string :title
      t.text :note
      t.integer :budget

      t.timestamps
    end
  end
end
