class User < ApplicationRecord

  attr_accessor :username, :email, :password

  validates :username, :email, :password, presence: :true, unless: :guest?
  validates :username, uniqueness: :true, allow_blank: :false

  has_many :bills

  has_many :debts, :foreign_key => "debtor_id"
  


  def self.new_guest
    new { |u| u.guest = true }
  end

end
