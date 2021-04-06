class CreateFriendLists < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_lists do |t|

      t.timestamps
    end
  end
end
