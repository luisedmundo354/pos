class SaleOrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @sale_order_item = SaleOrder.all
  end

  def new
    @sale_order = SaleOrder.new
    @sale_order.sale_items.build
  end

  def create
    @sale_order = SaleOrder.new(sale_order_params)
    respond_to do |format|
      if @sale_order.save
        #Update stock
        @sale_order.sale_items.each do |item|
          @uproduct = Product.find_by_id(item.product_id)
          @uproduct.decrement!(:stock, item.quantity)
        end
        format.html { redirect_to sale_orders_path, notice: 'Your sale order item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @sale_items = @sale_order.sale_items
  end

  def edit
  end

  def update
    respond_to do |format|
      if @sale_order.update(sale_order_params)
        format.html { redirect_to sale_order_path, notice: 'The order was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    #Destroy/delete the record
    @sale_order.destroy
    #Update stock
    @sale_order.sale_items.each do |item|
      @uproduct = Product.find_by_id(item.product_id)
      @uproduct.increment!(:stock, item.quantity)
    end
    #Redirect
    respond_to do |format|
      format.html { redirect_to sale_orders_path, notice: 'the order was successfully destroyed.' }
    end
  end

  private
    def set_order
      @sale_order = SaleOrder.find(params[:id])
    end
    def sale_order_params
      params.require(:sale_order).permit(:number, :comment, :customer_id, sale_items_attributes: [:id, :price, :quantity, :product_id, :_destroy])
    end
end
