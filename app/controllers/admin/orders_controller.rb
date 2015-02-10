class Admin::OrdersController < Admin::BaseController

  def index
    @orders = resource.fetch_for_index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      flash[:notice] = "You have successfully created order"
      redirect_to admin_orders_path
    else
      flash[:alert] = "order can't be created"
      render 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(order_params)
      flash[:notice] = "You have successfully updated order"
      redirect_to admin_orders_path
    else
      flash[:alert] = "order can't be updated"
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])

    @order.destroy
    flash[:notice] = "You have successfully deleted order"
    redirect_to admin_orders_path
  end

  private

  def resource
    @resource ||= Admin::OrderResource.new(params)
  end

  def order_params
    params.require(:order).permit(:name)
  end
end
