class Bill < ApplicationRecord
  belongs_to :user , class_name: 'User', foreign_key: :user_id, primary_key: :id
  has_many :bill_parts, class_name:"BillPart", foreign_key: :bill_id , primary_key: :id, inverse_of: :bill

  # remember to uncomment
  # validates_presence_of :event, :date, :location, :total_amount, :user_id

  accepts_nested_attributes_for :bill_parts,
  reject_if: lambda{|attrs| attrs['participant_id'].blank? || attrs['amount'].blank?}
end
