class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  def index
    @customer = Customer.all
  end

 def Show
 end

 def edit
 end

 def update
   respond_to do |format|
     if @customer.update(customer_params)
       format.html { redirect_to customers_path, notice: 'customer was successfully updated.' }
     else
       format.html { render :edit }
     end
   end
 end

 def new
  @customer = Customer.new
end

 def create
   @customer = Customer.new(customer_params)
   respond_to do |format|
     if @customer.save
       format.html { redirect_to customers_path, notice: 'The new customer is now live.' }
     else
       format.html { render :new }
     end
   end
 end

 def destroy
   #Destroy/delete the record
   @customer.destroy
   #Redirect
   respond_to do |format|
     format.html { redirect_to customers_path, notice: 'Category was successfully destroyed.' }
   end
 end

 private
 # Use callbacks to share common setup or constraints between actions.
 def set_customer
   @customer = Customer.find(params[:id])
 end

 # Never trust parameters from the scary internet, only allow the white list through.
 def customer_params
   params.require(:customer).permit(:fname, :lname, :email, :phone, :dni)
 end
end
