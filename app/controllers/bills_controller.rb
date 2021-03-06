class BillsController < ApplicationController
  include ApplicationHelper
  # before_action :require_login, :only => [:index]

  # GET /bills or /bills.json
  def index
    @bills = current_user.bills
    render :index
  end

  # GET /bills/1 or /bills/1.json
  def show
		@bill = Bill.find(params[:id])
		@guests = @bill.guests

		if current_user == @bill.user
			render :show
		else
			flash[:notice] = "Login required to edit bill."
			redirect_to login_url
		end
	end

  # GET /bills/new
  def new
    @user = current_user
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills or /bills.json
  def create
    bill_id = Bill.last.nil? ? 1 : Bill.last.id=+1
    @bill = Bill.new(:id => bill_id, :user => current_user, :name => params[:bill][:name], :description => params[:bill][:description], :amount => params[:bill][:amount])
    if @bill.valid?
      @bill.save

      print "###Bill Params"
      print params[:bill]

      params[:bill][:guests][0][:name] = current_user.name unless current_user.guest?
      Bill.calculate(bill_id,params[:bill][:amount].to_i, params[:bill][:guests])

      respond_to do |format|
				format.json { render :json => {:error => "none", :message => "Bill id: #{@bill.id} successfully added."} }
				format.html { redirect_to bill_url(@bill) }
			end
    else
        render :new
    end
  end

  # PATCH/PUT /bills/1 or /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: "Bill was successfully updated." }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1 or /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: "Bill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_bill
  #     @bill = Bill.find(params[:id])
  #   end

    
end
