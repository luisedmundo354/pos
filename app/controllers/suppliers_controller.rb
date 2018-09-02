class SuppliersController < ApplicationController
  def index
	@supplier_items = Supplier.all
  end

  def new
   @supplier = Supplier.new
 end

 def create
   @supplier = Supplier.new(params.require(:supplier).permit(:name, :phone, :address))

   respond_to do |format|
     if @supplier.save
       format.html { redirect_to suppliers_path, notice: 'Your supplier item is now live.' }
     else
       format.html { render :new }
     end
   end
 end

 def edit
   @supplier = Supplier.find(params[:id])
 end

 def update
   @supplier = Supplier.find(params[:id])
   respond_to do |format|
     if @supplier.update(params.require(:supplier).permit(:name, :phone, :address))
       format.html { redirect_to supplier_path, notice: 'Supplier was successfully updated.' }
     else
       format.html { render :edit }
     end
   end
 end

 def show
   @supplier = Supplier.find(params[:id])
 end

 def destroy
   #Perform the lookup
   @supplier = Supplier.find(params[:id])
   #Destroy/delete the record
   @supplier.destroy
   #Redirect
   respond_to do |format|
     format.html { redirect_to suppliers_path, notice: 'Supplier was successfully destroyed.' }
   end
 end
#This is copyed into the new.permit method
#  def blog_params
#    params.require(:blog).permit(:tittle, :body)
#  end
end
