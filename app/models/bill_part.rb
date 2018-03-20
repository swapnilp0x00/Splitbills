class BillPart < ApplicationRecord
  belongs_to :user
  belongs_to :bill

  validates_presence_of :bill_id, :participant_id ,:amount
end
