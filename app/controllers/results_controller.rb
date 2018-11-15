class ResultsController < ApplicationController
  def show
    @sale_items = SaleItem.paginate(:page => params[:page], :per_page => 15).order('created_at DESC')
    @total_sales = SaleItem.sum(:price)
    render "results/#{params[:static]}"
  end
end
