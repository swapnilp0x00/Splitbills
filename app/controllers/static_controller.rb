class StaticController < ApplicationController
  before_action :authenticate_user!
  def root
  end

  def home
    @billwise_hash = current_user.billwise_borrowings
    @total_hash = current_user.total_borrowing
    @amount = @total_hash[current_user.id] || 0

    @owes_hash,@lends_hash = User.generate_ui_from_hash(current_user)
  end
end
