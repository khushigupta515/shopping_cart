class ItemsController < ApplicationController
    
    def index
        @cart = Cart.find(params[:cart_id])
        @items = @cart.items
      
    end
    def new
        @cart = Cart.find(params[:cart_id])
        @item = @cart.items.new
    end
    def create
        @cart = Cart.find(params[:cart_id])
        @item = @cart.items.create(items_params)
        @item.avatar.attach(params[:item][:avatar])
        
        if @item.avatar.attached?
            @item.save
        end
        if @item.save
            @cart.total = @cart.total + @item.quantity * @item.price
            @cart.save
            flash[:notice] = "Item created successfully!"
            return redirect_to cart_items_path (params[:cart_id])   
        else 
            flash[:notice] = "Item creation failed,retry!"   
            render :new, status: :unprocessable_entity
            # raise ActiveRecord::Rollback, "Item creation failed"
        end
    end
    def update
        cart = Cart.find(params[:cart_id])
        item = cart.items.find(params[:id])
        if (params[:change]=="inc")
            item.quantity = item.quantity + 1
            item.save
            cart.total = cart.total + item.price
            cart.save
           
        end 
        if (params[:change]=="dec")
            if(item.quantity!=1)
                item.quantity = item.quantity - 1
                item.save
                cart.total = cart.total - item.price
                cart.save
            end        
        end 
        flash[:notice] = "Item quantity updated successfully!" 
        return redirect_to cart_items_path (params[:cart_id])   
    end  
    def destroy
        cart = Cart.find(params[:cart_id])
        item = cart.items.find(params[:id])
        cart.total = cart.total - item.quantity * item.price
        cart.save
        item.destroy
        flash[:notice] = "Item destroyed successfully!" 
        return redirect_to cart_items_path (params[:cart_id])
    end       
    private
    def items_params
        params.require(:item).permit(:title,:quantity,:avatar,:price)
    end        
end
