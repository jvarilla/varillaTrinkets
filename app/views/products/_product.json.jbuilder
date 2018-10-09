json.extract! product, :id, :page_id, :integer, :animal_id, :supplier_id, :integer, :prodname, :price, :length, :width, :height, :mainimg, :frontimg, :backimg, :leftimg, :rightimg, :topimg, :bottomimg, :description, :primarycolor, :secondarycolor, :hasbase, :numinstock, :created_at, :updated_at
json.url product_url(product, format: :json)
