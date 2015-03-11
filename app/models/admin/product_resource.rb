class Admin::ProductResource < AdminBits::Resource
  ordering :by_each_attribute, default: { by_id: :asc }
  per_page 5

  def resource
    Product
  end

  def path
    admin_products_path
  end
end
