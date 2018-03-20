json.extract! bill, :id, :event, :date, :location, :total_amount, :user_id, :created_at, :updated_at
json.url bill_url(bill, format: :json)
