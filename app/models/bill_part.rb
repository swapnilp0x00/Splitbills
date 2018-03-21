class BillPart < ApplicationRecord
  belongs_to :user , class_name: 'User', foreign_key: :participant_id , primary_key: :id
  belongs_to :bill , class_name: 'Bill', foreign_key: :bill_id , primary_key: :id , inverse_of: :bill_parts


  # returns all bill ids in which user was present
  def get_bills_for_user(user)
    bills = BillPart.where(participant_id:user.id).map(&:id)
  end
end
