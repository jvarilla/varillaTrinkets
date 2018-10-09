class HomeController < ApplicationController
skip_before_action :authorize

  def index
  @promotions = Promotion.where("startdate <= ? AND enddate >= ?", Date.today, Date.today)
  end

  def about
  end

  def contact
  end

  def privacy
  end

  def help
  end
  
  def search
	@results = false
	@productlist = ""
	if !params[:searchinput].nil?
		@results = true
		#Receive user input
		@searchinput = params[:searchinput]
		#Add wild card chars for Approximate results
		@searchcriteria = "%#{params[:searchinput]}%"
		#Put search results in array
		@productlist = Product.joins(:animal).select("products.*,
		animals.*").where("prodname LIKE ? or description LIKE ? or kingdom LIKE ? or species LIKE ?", 
		@searchcriteria, @searchcriteria, @searchcriteria, @searchcriteria)
	end
  end

 def catalog
	@prod = Product.all
 end
 
 def _catalogitem
	@catalogitemdisplay = Product.all #find(1) #params[:prodid].to_i)
	
 end
 
 def cart
 end

  def buy
    # Get the specific product selected to be purchased and the quantity.
	# Converting the value to integer using the to_i method
	@prodid = params[:prodid].to_i;
	@qty = params[:qty].to_i;
	
	# Set session cart arrays to nil. 
	session[:cart_prod] << @prodid
	session[:cart_qty] << @qty

	# Redirect to display cart (shopping cart)
	redirect_to cart_url
  end

  def updatecart
 	# Get the specific item that needs to be removed
	cartid = params[:cartid].to_i;
  
	 # Remove the specific element that is desired to be removed from the array.
	session[:cart_prod].delete_at(cartid)
	session[:cart_qty].delete_at(cartid)
  
  	# Redirect to display cart (shopping cart)
	redirect_to cart_url
 end
 
 def checkout
 	cartlen = session[:cart_prod].length
	i=0
	totalOrderPrice = 0
	if cartlen > 0
	 while i < cartlen
		totalOrderPrice +=  Product.find(session[:cart_prod][i].to_i).price * session[:cart_qty][i]	
		i = i + 1
	end
	
	i = 0
		
	 # Save new record in Order table
	 # Customer ID, Sale Date and Sale Notes
	orderid = Order.create(user_id: session[:user_id], orderdate: Date.today, saleprice: totalOrderPrice) 

	# For each item in the shopping cart save the record in the in OrderItem table
	while i < cartlen
		OrderItem.create(order_id: orderid.id, product_id: session[:cart_prod][i].to_i, quantity: session[:cart_qty][i].to_i)
		i = i + 1
	end 
	  session[:cart_prod] = Array.new
	  session[:cart_qty] = Array.new
	end
end

  
end
