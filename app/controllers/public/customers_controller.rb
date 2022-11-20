class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
    before_action :ensure_correct_customer, only: [:edit, :update]
    def index
      @customers = Customer.all
      @theater = Theater.new
    end


    def show
      @customer = Customer.find(params[:id])
      @theaters = @customer.theaters
      @theater = Theater.new
      @genres = Genre.all

    end

    def edit
       @customer = Customer.find(params[:id])

    end
    def update
       @customer = Customer.find(params[:id])
       if @customer.update(customer_params)
         redirect_to customers_path, notice: "会員編集しました"
       else
         render "edit"
       end
    end

  def unsubscribe
      @customer = current_customer
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, alert:  "退会処理を実行いたしました"
  end

    private
    def customer_params
      params.require(:customer).permit(:name, :kana_name, :email, :encrypted_password, :profile_image, :introduction)
    end

    def ensure_correct_customer
      @customer = Customer.find(params[:id])
      unless @customer == current_customer
        redirect_to customer_path(current_customer)
      end
    end

end