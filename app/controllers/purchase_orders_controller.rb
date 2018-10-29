class PurchaseOrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @purchase_order_item = PurchaseOrder.all
  end

  def new
    @purchase_order = PurchaseOrder.new
    @purchase_order.purchase_items.build
    @last_record = PurchaseOrder.last
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    respond_to do |format|
      if @purchase_order.save
        format.html { redirect_to purchase_orders_path, notice: t('Your purchase order item is now live') }
      else
        format.html { render :new }
      end
    end
  end

  def purchase_item_fields
    @selected = Product.find_or_initialize_by(upc: params[:upc])
    if @selected
      respond_to do |format|
        format.js
      end
    end
  end

  def show
    @purchase_items = @purchase_order.purchase_items
  end

  def edit
  end

  def update
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        format.html { redirect_to purchase_order_path, notice: t('The order was successfully updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    #Destroy/delete the record
    @purchase_order.destroy
    #Redirect
    respond_to do |format|
      format.html { redirect_to purchase_orders_path, notice: t('The order was successfully destroyed') }
    end
  end

  private
    def set_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end
    def purchase_order_params
      params.require(:purchase_order).permit(:number, :comment, :replenisher_id, purchase_items_attributes: [:id, :price, :quantity, :product_id, :_destroy])
    end
end
