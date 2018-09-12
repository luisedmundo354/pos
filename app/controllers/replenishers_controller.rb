class ReplenishersController < ApplicationController
  before_action :set_replenisher, only: [:show, :edit, :update, :destroy]
  def index
    @replenisher = Replenisher.all
  end

 def Show
 end

 def edit
 end

 def update
   respond_to do |format|
     if @replenisher.update(replenisher_params)
       format.html { redirect_to replenishers_path, notice: 'replenisher was successfully updated.' }
     else
       format.html { render :edit }
     end
   end
 end

 def new
  @replenisher = Replenisher.new
end

 def create
   @replenisher = Replenisher.new(replenisher_params)
   respond_to do |format|
     if @replenisher.save
       format.html { redirect_to replenishers_path, notice: 'The new replenisher is now live.' }
     else
       format.html { render :new }
     end
   end
 end

 def destroy
   #Destroy/delete the record
   @replenisher.destroy
   #Redirect
   respond_to do |format|
     format.html { redirect_to replenishers_path, notice: 'Category was successfully destroyed.' }
   end
 end

 private
 # Use callbacks to share common setup or constraints between actions.
 def set_replenisher
   @replenisher = Replenisher.find(params[:id])
 end

 # Never trust parameters from the scary internet, only allow the white list through.
 def replenisher_params
   params.require(:replenisher).permit(:fname, :lname, :email, :phone, :dni)
 end
end
