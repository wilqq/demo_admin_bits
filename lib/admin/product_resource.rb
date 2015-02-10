class Admin::ProductResource < AdminBits::Resource
  filters :sample_filter_method
  ordering :by_id, default: { by_id: :asc }

  def resource
    Product
  end

  def path
    # This should be path to your index action - you can create any path you like
    admin_products_path
  end

  def sample_filter_method(resource)
    resource
  end

  def by_id(resource, direction = :asc)
    resource.order("id #{direction}")
  end
end
