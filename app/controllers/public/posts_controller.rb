class Public::PostsController < ApplicationController


  def index
    @customers = Customer.all
    @posts = Post.all
    @posts = Post.all.order(created_at: :desc)

  end

  # 検索
  def search
    @posts = Post.search(params[:search])
    render 'index'
  end



  def create
      @post = Post.new(post_params)
      @post.customer = current_customer
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
  end


  def edit
     @post = Post.find(params[:id])
     @customer = current_customer
    redirect_to(posts_path) unless @customer.email != "guest@example.com"
  end


  def update
      @post = Post.find(params[:id])
    if  @post.update(post_params)
      flash[:notice] = "更新が完了しました"
      redirect_to customers_path
    else
      @customer = current_customer
      render 'public/customers/show'
    end
  end



   def destroy
       post = Post.find(params[:id])
       post.destroy
       flash[:notice] = "削除されました"
       redirect_to customers_path
   end




  private
  def post_params
    params.require(:post).permit(:toiletry,:skin_product,:hairdryer,:luggage,:address,:latitude,
                                  :longitude,:onsen_name,:parking, :payment, :towel_stock,:image,:star)
  end
end
