class Admin::OrderResource < AdminBits::Resource
  filters :having_name
  ordering :by_each_attribute, :by_items_count, default: { by_id: :asc }
  per_page 5

  def resource
    Order
  end

  def path
    admin_orders_path
  end

  def having_name(resource)
    name = "%#{ filter_params[:having_name] }%"
    resource.where(["name LIKE ?", name])
  end

  def by_items_count(resource, direction = 'ASC')
    resource.select("orders.*, COUNT(items.id) item_count").joins(:items).group("orders.id").order("item_count #{direction}")
  end
end
