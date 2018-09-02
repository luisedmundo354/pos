class CategoriesController < ApplicationController
  def index
	@category_items = Category.all
  end

  def new
   @category = Category.new
 end

 def create
   @category = Category.new(params.require(:category).permit(:name))

   respond_to do |format|
     if @category.save
       format.html { redirect_to categories_path, notice: 'Your category item is now live.' }
     else
       format.html { render :new }
     end
   end
 end

 def edit
   @category = Category.find(params[:id])
 end

 def update
   @category = Category.find(params[:id])
   respond_to do |format|
     if @category.update(params.require(:category).permit(:name))
       format.html { redirect_to category_path, notice: 'Category was successfully updated.' }
     else
       format.html { render :edit }
     end
   end
 end

 def show
   @category = Category.find(params[:id])
 end

 def destroy
   #Perform the lookup
   @category = Category.find(params[:id])
   #Destroy/delete the record
   @category.destroy
   #Redirect
   respond_to do |format|
     format.html { redirect_to categories_path, notice: 'Category was successfully destroyed.' }
   end
 end
#This is copyed into the new.permit method
#  def blog_params
#    params.require(:blog).permit(:tittle, :body)
#  end
end
