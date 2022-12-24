class Public::CustomersController < ApplicationController

  def show
       @customer = current_customer
       @post = Post.new
       redirect_to(posts_path) unless @customer.email != "guest@example.com"
  end


  def edit
      @customer = current_customer
  end


  def update
      @customer = current_customer
  if  @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
  else
      render :edit
  end
  end



  def index
      @photos = current_customer.posts
      @photos = current_customer.posts.order(created_at: :desc)
      @photos = @photos.page(params[:page]).per(6)
  end


   def favorites
       @customer = Customer.find(params[:id])
       likes = @customer.likes.pluck(:post_id)
       @favorite_posts = Post.find(likes)
   end



  def destroy
      photo_details = Post.find(params[:id])
      star.destroy
      photo_details.destroy
      redirect_to customers_path
  end


  def quit
  end


  def  withdrawal
       @customer = current_customer
       @customer.update(is_deleted: true)
       reset_session
       redirect_to new_customer_registration_path
  end


  private
  def customer_params
    params.require(:customer).permit(:name,:email,:customer_image,)
  end


  private
  def post_params
    params.require(:post).permit(:toiletry,:skin_product,:hairdryer,:luggage,:address,:latitude,:longitude,:onsen_name,:star)
  end



end
