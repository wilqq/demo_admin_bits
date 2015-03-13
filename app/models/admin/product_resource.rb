class Admin::ProductResource < AdminBits::Resource
  filters :having_name, :price_between
  ordering :by_each_attribute, default: { by_id: :asc }
  per_page 5

  def resource
    Product
  end

  def path
    admin_products_path
  end

  def having_name(resource)
    name = "%#{ filter_params[:having_name] }%"
    resource.where(["name LIKE ?", name])
  end

  def price_between(resource)
    to = filter_params['price_between']['to']
    from = filter_params['price_between']['from']

    resource = resource.where(["price <= ?", to]) if to.present?
    resource = resource.where(["price >= ?", from]) if from.present?
    resource
  end
end
