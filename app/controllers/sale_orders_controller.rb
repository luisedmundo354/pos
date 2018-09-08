class SaleOrdersController < ApplicationController

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
        format.html { redirect_to sale_orders_path, notice: 'Your sale order item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @sale_order = SaleOrder.find(params[:id])
    @sale_items = @sale_order.sale_items
  end

  private
    def sale_order_params
      params.require(:sale_order).permit(:number, :comment, :customer_id, sale_items_attributes: [:price, :quantity, :product_id, :_deestroy])
    end
end
