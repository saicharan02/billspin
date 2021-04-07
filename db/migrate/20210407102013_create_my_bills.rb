class CreateMyBills < ActiveRecord::Migration[6.1]
  def change
    create_table :my_bills do |t|
      t.references :user
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
