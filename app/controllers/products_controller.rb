class ProductsController < ApplicationController
  def index
    @category_items = Product.select(:category_id).distinct
    if params[:category]
      @product_items = Product.where(:category => params[:category])
    else
      @product_items = Product.all
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:name, :unit, :stock, :ss, :deliver_time, :category_id, :supplier_id, :level, :commentary))

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Your product item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(params.require(:product).permit(:name, :unit, :stock, :ss, :deliver_time, :supplier_id, :level, :category_id ,:commentary))
        format.html { redirect_to product_path, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    #Perform the lookup
    @product = Product.find(params[:id])
    #Destroy/delete the record
    @product.destroy
    #Redirect
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product was successfully destroyed.' }
    end
  end
  #This is copyed into the new.permit method
  #  def blog_params
  #    params.require(:blog).permit(:tittle, :body)
  #  end
end
