class ReportsController < ApplicationController
  def reportlist
  end

  def custlist
    @customers = User.all.order(:lastname)
  end

  def productlist
    @prolist = Product.joins(:supplier, :animal).select("suppliers.*,animals.*,products.*")
  end

  def salelist
	@order_items = Order.joins(:user, :order_item => :product).select("orders.*,
	users.*,order_items.*,products.*")

	
  end
end
