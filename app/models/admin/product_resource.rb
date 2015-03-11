class Admin::ProductResource < AdminBits::Resource
  ordering :by_each_attribute, default: { by_id: :asc }

  def resource
    Product
  end

  def path
    admin_products_path
  end
end
