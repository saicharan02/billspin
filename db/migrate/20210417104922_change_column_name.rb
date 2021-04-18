class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change

    rename_column(:users, :username, :name)

    rename_column(:users, :money_to_get, :money_took)


  end
end
