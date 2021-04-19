class User < ApplicationRecord

  attr_accessor :username, :email, :password

  validates :username, :email, :password, presence: :true, unless: :guest?
  validates :username, uniqueness: :true, allow_blank: :false

  has_many :bills

  has_many :debts, :foreign_key => "debtor_id"
  
  def password
    @password || self.password_digest
  end

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password)
  end

  def verify_password(password)
  	BCrypt::Password.new(self.password_digest) == password
  end

  def to_param
    name
  end

  def self.new_guest
    new { |u| u.guest = true }
  end

  def move_to(user)
    bills.update_all(user_id: user.id)
    credits.update_all(creditor_id: user.id)
  end

end
