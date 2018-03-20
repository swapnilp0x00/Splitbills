class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bills , class_name: 'Bill',foreign_key: :author_id, primary_key: :id
  has_many :bill_parts , class_name:'BillPart' , foreign_key: :participant_id , primary_key: :id
end
