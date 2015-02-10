class Admin::ProductsController < Admin::BaseController

  def index
    @products = resource.fetch_for_index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "You have successfully created product"
      redirect_to admin_products_path
    else
      flash[:alert] = "product can't be created"
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      flash[:notice] = "You have successfully updated product"
      redirect_to admin_products_path
    else
      flash[:alert] = "product can't be updated"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    flash[:notice] = "You have successfully deleted product"
    redirect_to admin_products_path
  end

  private

  def resource
    @resource ||= Admin::ProductResource.new(params)
  end

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
