class Admin::CustomersController < ApplicationController

  def top
  end

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name,:email)
  end


end
