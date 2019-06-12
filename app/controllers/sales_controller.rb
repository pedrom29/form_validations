class SalesController < ApplicationController

  def new
    @sale = Sale.new
    @categories = ["uno","dos","tres","cuatro"]
  end

  def create

    @sale = Sale.new(post_params)

    if @sale.discount >= 0
       @discount = (@sale.value) - (@sale.value * @sale.discount/100)


    end

    if @sale.tax == 0

        @sale.tax = 19

        @sale.total = (@discount) + (@sale.tax*@discount/100)

    else
        @sale.tax = 0
        @sale.total = (@sale.value) - (@sale.value * @sale.discount/100)



    end



    @sale.save
    redirect_to sales_done_path
  end

  def done
    @sales = Sale.all
  end

  private
  def post_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax)
  end

end
