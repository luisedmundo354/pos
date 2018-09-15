class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :calculate_level, only: [:index]

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
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Your product item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    @list_items = Product.where(level: "Reponer")
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def list
    @list_items = Product.where(level: "Reponer")
    @suppliers = Supplier.distinct
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "list",
        template: "products/list.html.erb",
        encoding: "UTF-8",
        page_size: "A4",
        disable_internal_links: true
      end
    end
  end

  def destroy
    #Destroy/delete the record
    @product.destroy
    #Redirect
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product was successfully destroyed.' }
    end
  end

  def calculate_level
    @product_items = Product.all
    @product_items.each do |product|
      if product.stock <= product.ss
        product.level = 'Reponer'
        product.save
      elsif product.stock <= 2*product.ss
        product.level = 'Bajo'
        product.save
      elsif product.stock <= 3*product.ss
        product.level = 'Medio'
        product.save
      else
        product.level = 'Alto'
        product.save
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :brand, :unit, :stock, :ss, :deliver_time, :order_size, :supplier_id, :category_id ,:commentary)
  end
end
