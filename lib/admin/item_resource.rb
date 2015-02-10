class Admin::ItemResource < AdminBits::Resource
  filters :where_order_id
  ordering :by_each_attribute, default: { by_id: :asc }

  def resource
    Item
  end

  def path
    admin_items_path
  end

  def sample_filter_method(resource)
    resource
  end

  def where_order_id(resource)
    resource.where(order_id: filter_params[:where_order_id])
  end
end
