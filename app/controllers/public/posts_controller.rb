class Public::PostsController < ApplicationController

  def index
    @customers = Customer.all
    @posts = Post.all
    #byebug
  end

  def create
    #byebug
    @post = Post.new(post_params)
    @post.customer = current_customer
    #@image = Post.new(post_params)
    if  @post.save
      flash[:notice] = "投稿しました"
      redirect_to posts_path
    else
      @customer = current_customer
      render 'public/customers/show'
    end
  end

  def show
    @post = Post.find(params[:id])
    byebug
  end




  private
  def post_params
    params.require(:post).permit(:toiletry,:skin_product,:hairdryer,:luggage,:address,:latitude,
                                  :longitude,:onsen_name,:parking, :payment, :towel_stock,:image)
  end
end
