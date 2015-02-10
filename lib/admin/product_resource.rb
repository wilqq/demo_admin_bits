class Admin::ProductResource < AdminBits::Resource
  filters :sample_filter_method
  ordering :by_each_attribute, default: { by_id: :asc }

  def resource
    Product
  end

  def path
    admin_products_path
  end

  def sample_filter_method(resource)
    resource
  end
end
