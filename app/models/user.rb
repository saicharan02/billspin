class User < ApplicationRecord

  attr_accessible :username, :email, :password

  validates :username, :email, :password, presence: :true
  validates :name, uniqueness: :true, allow_blank: :false

  has_many :bills

  


end
