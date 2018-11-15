class SaleOrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @sale_order_item = SaleOrder.all
  end

  def new
    @sale_order = SaleOrder.new
    @sale_order.sale_items.build
    @last_record = SaleOrder.last
  end

  def create
    @sale_order = SaleOrder.new(sale_order_params)
    respond_to do |format|
      if @sale_order.save
        format.html { redirect_to sale_orders_path, notice: t('Your sale order item is now live') }
      else
        format.html { render :new }
      end
    end
  end

  def sale_item_fields
    @selected = Product.find_or_initialize_by(upc: params[:upc])
    if @selected
      respond_to do |format|
        format.js
      end
    end
  end

  def sale_results
    respond_to do |format|
      format.js
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
        format.html { redirect_to sale_order_path, notice: t('The order was successfully updated') }
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
      if @uproduct
        @uproduct.increment!(:stock, item.quantity)
      end
    end
    #Redirect
    respond_to do |format|
      format.html { redirect_to sale_orders_path, notice: t('The order was successfully destroyed') }
    end
  end

  def report
    @sale_orders = SaleOrder.all
    respond_to do |format|
      format.html
      format.csv { send_data @sale_orders.to_csv }
      format.xls
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
