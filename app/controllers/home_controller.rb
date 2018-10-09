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
		#User.find(session[:user_id]).lastname
    #Displays shipping options
    @shippingoption_choice = ShippingOption.order("optionname").collect do |c| [c.optionname + " | Ships in " +
      c.minshiptime.to_s + "-" + c.maxshiptime.to_s + " business days | Cost: $" + c.shipcost.to_s + "0", c.id] end
 end

def buy
    # Get the specific product selected to be purchased and the quantity.
	# Converting the value to integer using the to_i method
	@prodid = params[:prodid].to_i;
	@qty = params[:qty].to_i;
  @tagmsg = params[:tagmsg].to_s;
	@prodname = params[:prodname].to_s
	@dspqty = params[:qty].to_s;

	# Set session cart arrays to nil.
	session[:cart_prod] << @prodid
	session[:cart_qty] << @qty
  session[:cart_tagmsg] << @tagmsg
	@dspcartlength = 0
	@cartCountIdx = 0
	@cartlength = session[:cart_prod].length.to_i
	while @cartCountIdx < @cartlength do
		@dspcartlength += session[:cart_qty][@cartCountIdx].to_i
		@cartCountIdx += 1
	end

	@dspcartlength = @dspcartlength.to_s
	@cartUpdateMessage =  @dspqty + " " +  @prodname + "(s) with tag message " + @tagmsg + " was added to cart. " +
	@dspcartlength + " item(s) in cart. "

	# Redirect to display cart (shopping cart)
	respond_to do |format|
      format.html { redirect_to home_catalog_url, notice: @cartUpdateMessage }
      format.json { head :no_content }
	end
	#flash[:success] #= @prodname + "has been added to cart. " + session[:cart_prod].length.to_s + " items in cart"
	#redirect_to catalog#cart_url
  end

  def updatecart
 	# Get the specific item that needs to be removed
	cartid = params[:cartid].to_i;

	 # Remove the specific element that is desired to be removed from the array.
	session[:cart_prod].delete_at(cartid)
	session[:cart_qty].delete_at(cartid)
  session[:cart_tagmsg].delete_at(cartid)

  	# Redirect to display cart (shopping cart)
	redirect_to cart_url
 end

 def checkout
  #@shipcost = ShippingOption.find(params[:shippingoptionid].to_i).shipcost.to_i#select("shipping_options.shipcost")
  #@minshiptime = ShippingOption.find(params[:shippingoptionid].to_i).minshiptime#select("shipping_options.minshiptime")
  #@maxshiptime = ShippingOption.find(params[:shippingoptionid].to_i).maxshiptime#select("shipping_options.maxshiptime")
 	cartlen = session[:cart_prod].length
	i=0
	totalOrderPrice = 0 #@shipcost
	if cartlen > 0
	 while i < cartlen
		totalOrderPrice +=  Product.find(session[:cart_prod][i].to_i).price * session[:cart_qty][i]
		i = i + 1
	end

	i = 0

	 # Save new record in Order table
	 # Customer ID, Sale Date and Sale Notes
	orderid = Order.create(user_id: session[:user_id], orderdate: Date.today, saleprice: totalOrderPrice, shipaddress: params[:address].to_s,
    shipcity: params[:city].to_s, shipstate: params[:state], shipzip: params[:zip], billaddress: User.find(session[:user_id]).address,
    billcity: User.find(session[:user_id]).city, billstate: User.find(session[:user_id]).state, billzip: User.find(session[:user_id]).zip,
    cardmerchant: (params[:merchant]).to_s, shippingoption_id: 1, orderconfirmationnumber: (rand(100) * rand(400) * rand(50)) )

    @boxmessageContruct = "Love, " + params[:firstname].to_s
	# For each item in the shopping cart save the record in the in OrderItem table
	while i < cartlen
		OrderItem.create(order_id: orderid.id, product_id: session[:cart_prod][i].to_i, quantity: session[:cart_qty][i].to_i,
    tagmessage: session[:cart_tagmsg][i].to_s, tagcolor: "purple", tagfontcolor: "gold", boxmessage: @boxmessageContruct )
		i = i + 1
	end
    #@finalCheckoutMessage = "Thank you for your order! Your card has been charged for $" + @shipcost.to_s + "0. You're
    #order will arrive in " + @minshiptime.to_s + " to " + @maxshiptime.to_s + " business days."
	  session[:cart_prod] = Array.new
	  session[:cart_qty] = Array.new
    session[:cart_tagmsg] = Array.new
    respond_to do |format|
        format.html { redirect_to home_checkout_url, notice: "Your Order Has Been Received" }
        format.json { head :no_content }
  	end
	end
end


end
