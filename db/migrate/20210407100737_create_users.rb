class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.float :money_given
      t.float :money_to_get
      t.boolean :guest

      t.timestamps
    end
  end
end
