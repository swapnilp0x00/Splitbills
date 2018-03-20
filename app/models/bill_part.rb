class BillPart < ApplicationRecord
  belongs_to :user , class_name: 'User', foreign_key: :participant_id , primary_key: :id
  belongs_to :bill , class_name: 'Bill', foreign_key: :bill_id , primary_key: :id , inverse_of: :bill_parts
  
end
