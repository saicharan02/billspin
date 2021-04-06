class Bill < ApplicationRecord
  belongs_to :users
  belongs_to :friend_list
end
