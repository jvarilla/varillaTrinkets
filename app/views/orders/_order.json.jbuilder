json.extract! order, :id, :user_id, :shippingoption_id, :orderdate, :recipientisuser, :shipaddress, :shipcity, :shipstate, :shipzip, :usefiledbillinfo, :billaddress, :billcity, :billstate, :billzip, :orderconfirmationnumber, :cardmerchant, :created_at, :updated_at
json.url order_url(order, format: :json)
