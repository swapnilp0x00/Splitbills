class Bill < ApplicationRecord
  belongs_to :user , class_name: 'User', foreign_key: :user_id, primary_key: :id
  has_many :bill_parts, class_name:"BillPart", foreign_key: :bill_id , primary_key: :id, inverse_of: :bill , dependent: :delete_all

  # remember to uncomment
  # validates_presence_of :event, :date, :location, :total_amount, :user_id

  accepts_nested_attributes_for :bill_parts,
  reject_if: lambda{|attrs| attrs['participant_id'].blank? || attrs['amount'].blank?}

  validates :total_amount, :numericality => { :greater_than_or_equal_to => 0 }

  # work around
  # There are always bill parts present on bill
  after_initialize do |bill|
    if bill.bill_parts.empty?
      User.order(:id).each{|user| bill.bill_parts.build(participant_id:user.id) }
    end
  end

  def get_total_bill_amount
    total_bill_amount = BillPart.where(bill_id: self.id).sum(:amount)
  end

  def get_number_of_participants
    number_of_participants = BillPart.where(bill_id: self.id).count
  end

  def get_split_per_head
    self.get_total_bill_amount / self.get_number_of_participants
  end
end
