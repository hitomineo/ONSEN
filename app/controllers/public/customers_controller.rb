class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
    # @customer = Customer.all

  end

  def  update
       @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to customer_path(@customer.id)
    else
       render :show
    end
  end


  def quit
  end


  def  withdrawal
       @customer = current_customer
       @customer.update(is_deleted: true)
       reset_session
       redirect_to new_customer_registration_path, notice: "退会処理を実行しました"
  end


  private
  def customer_params
    params.require(:customer).permit(:name,:email,:image)
  end

end
