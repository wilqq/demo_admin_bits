class Admin::OrderResource < AdminBits::Resource
  filters :sample_filter_method
  ordering :by_each_attribute, :by_items_count, default: { by_id: :asc }

  def resource
    Order
  end

  def path
    admin_orders_path
  end

  def sample_filter_method(resource)
    resource
  end

  def by_items_count(resource, direction = 'ASC')
    Order.select("orders.*, COUNT(items.id) item_count").joins(:items).group("orders.id").order("item_count #{direction}")
  end
end
