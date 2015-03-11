class Admin::ItemResource < AdminBits::Resource
  filters :where_order_id
  ordering :by_each_attribute, :by_order_name, default: { by_id: :asc }
  per_page 5

  def resource
    Item
  end

  def path
    admin_items_path
  end

  def where_order_id(resource)
    resource.where(order_id: filter_params[:where_order_id])
  end

  def by_order_name(resource, direction = 'ASC')
    resource.joins(:order).order("orders.name #{direction}")
  end
end
