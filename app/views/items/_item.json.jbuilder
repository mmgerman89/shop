json.extract! item, :id, :code, :description, :brand_id, :unit_id, :stock, :min_stock, :category_id, :created_at, :updated_at
json.url item_url(item, format: :json)