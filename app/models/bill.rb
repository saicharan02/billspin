class Bill < ApplicationRecord
  attr_accessor :name, :description, :amount, :id, :user

  validates :name, :amount, presence: :true

  belongs_to :user


end
