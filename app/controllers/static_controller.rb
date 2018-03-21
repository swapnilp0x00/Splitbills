class StaticController < ApplicationController
  before_action :authenticate_user!
  def root
  end

  def home
    @borrowing_hash = current_user.total_borrowing
    @amount = @borrowing_hash[current_user.id]
    
  end
end
