class Admin::OrderResource < AdminBits::Resource
  filters :sample_filter_method
  ordering :by_each_attribute, default: { by_id: :asc }

  def resource
    Order
  end

  def path
    admin_orders_path
  end

  def sample_filter_method(resource)
    resource
  end
end
