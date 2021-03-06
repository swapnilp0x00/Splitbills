class BillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = current_user.bills.new
  end

  # GET /bills/1/edit
  # def edit
  # end

  # POST /bills
  # POST /bills.json
  def create
    @bill = current_user.bills.new(bill_params)
    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, success: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  # def update
  #   respond_to do |format|
  #     if @bill.update(bill_params)
  #       format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @bill }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @bill.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, success: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bill_parts
    @bill_parts = BillPart.includes(:user,:bill)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.includes(:bill_parts,:user).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:event, :date, :location, :total_amount, :user_id , bill_parts_attributes: [:participant_id , :amount])
    end
end
