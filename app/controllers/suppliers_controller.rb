class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  def index
	@supplier_items = Supplier.all
  end

  def new
   @supplier = Supplier.new
 end

 def create
   @supplier = Supplier.new(supplier_params)

   respond_to do |format|
     if @supplier.save
       format.html { redirect_to suppliers_path, notice: 'Your supplier item is now live.' }
     else
       format.html { render :new }
     end
   end
 end

 def edit
 end

 def update
   respond_to do |format|
     if @supplier.update(supplier_params)
       format.html { redirect_to supplier_path, notice: 'Supplier was successfully updated.' }
     else
       format.html { render :edit }
     end
   end
 end

 def show
 end

 def destroy
   #Destroy/delete the record
   @supplier.destroy
   #Redirect
   respond_to do |format|
     format.html { redirect_to suppliers_path, notice: 'Supplier was successfully destroyed.' }
   end
 end
#This is copyed into the new.permit method

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def supplier_params
    params.require(:supplier).permit(:name, :phone, :address)
  end
end
