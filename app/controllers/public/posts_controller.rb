class Public::PostsController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
  end


  private
  def posts_params
    params.require(:posts).permit(:image)
  end
end
