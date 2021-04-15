class Debt < ApplicationRecord
  attr_accessor :amount, :debtor_name, :creditor_name, :bill_id, :debtor_id, :creditor_id

  belongs_to :bill
end
