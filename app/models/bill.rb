class Bill < ApplicationRecord
  belongs_to :user
  has_many :bill_parts

  validates_presence_of :event, :date, :location, :total_amount, :user_id
end
