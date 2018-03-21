class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bills , class_name: 'Bill',foreign_key: :user_id, primary_key: :id
  has_many :bill_parts , class_name:'BillPart' , foreign_key: :participant_id , primary_key: :id

  # returns all bill_parts of user
  def get_bill_parts
    bills = BillPart.where(participant_id: self.id)
  end

  # returns all bills in which user was present
  def get_bills
    self.bill_parts.map(&:bill)
  end

  def billwise_borrowings
    bills = self.get_bills
    bill_and_split_hash = {}
    bill_user_amount_hash = {}
    bills.each do |bill|
      bill_and_split_hash[bill.id] = bill.get_split_per_head
    end
    bill_and_split_hash

    bills.each do |bill|
      temp_hash = {}
      bill_parts = BillPart.where(bill_id: bill.id)
      bill_parts.each do |bill_part|
        temp_hash[bill_part.participant_id] = bill_part.amount - bill_and_split_hash[bill.id]
      end
      bill_user_amount_hash[bill.id] = temp_hash
    end
    bill_user_amount_hash
  end

  def total_borrowing
    final_hash = {}
    billwise_borrowings = self.billwise_borrowings
    billwise_borrowings.values.each do |hash|
      hash.keys.each do|key|
        if final_hash.key? key
          final_hash[key] += hash[key]
        else
          final_hash[key] = hash[key]
        end
      end
    end
    final_hash
  end
end
