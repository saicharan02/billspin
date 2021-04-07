class Guest < ApplicationRecord
  attr_accessor :name, :money_paid, :money_to_pay, :bill_id, :user_id

  belongs_to :bill
end
