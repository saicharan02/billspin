json.extract! bill, :id, :name, :description, :amount, :created_at, :updated_at
json.url bill_url(bill, format: :json)
