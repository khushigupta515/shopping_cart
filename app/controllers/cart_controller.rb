class CartController < ApplicationController
  def index
    @carts = Cart.all
  end
  def new
    # @cart = Cart.new
  end
  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      @cart.number = @cart.id
      @cart.save
      flash[:notice] = "Cart successfully added!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity ,:notice => "Cart creation failed,retry!"
    end  
  end 
  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    flash[:notice] = "Cart destroyed successfully!"
    redirect_to root_path
  end 
  def update
    raise Exception
  end 
  private
  def cart_params
      # params[:total] = 0
      # params[:cart][:total] = 0
      # params.require(:cart).permit(:title,:total)
      params.permit(:title,:total)
  end
  
end
