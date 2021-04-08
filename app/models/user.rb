class User < ApplicationRecord

  attr_accessor :username, :email, :password

  validates :username, :email, :password, presence: :true, unless: :guest?
  validates :name, uniqueness: :true, allow_blank: :false

  has_many :bills


  def self.new_guest
    new { |u| u.guest = true }
  end

end
