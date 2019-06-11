class SalesController < ApplicationController

  def new
    @sale = Sale.new
    @categories = ["uno","dos","tres","cuatro"]
  end

  def create
    @sale = Sale.new(sales_params)
    if @sale.discount > 0
       @sale.value = (@sale.value) - (@sale.value * @sale.discount/100)
    end
    if @sale.tax == false
        @sale.value = @sale.value * 1.19
    else
        @sale.tax == 0
    end
    @sale.total = @sale.value
    @sale.save
    redirect_to sales_done_path
  end

  def done
    @sales = Sale.all
  end

  private
  def sales_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end

end
