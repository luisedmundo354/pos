class CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end

  def new
   @customer = Customer.new
 end

 def create
   @customer = Customer.new(params.require(:customer).permit(:fname, :lname, :email, :phone, :dni))

   respond_to do |format|
     if @customer.save
       format.html { redirect_to categories_path, notice: 'The new customer is now live.' }
     else
       format.html { render :new }
     end
   end
 end
end
