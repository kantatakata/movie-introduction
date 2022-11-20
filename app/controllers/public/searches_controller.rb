class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  # 会員、映画、ジャンルの検索
  def search
    # binding.irb
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == "Customer"
      @customers = Customer.search_for(@content, @method)
    elsif @model == "Theater"
      @theaters = Theater.search_for(@content, @method)
    else
      @genres = Genre.search_for(@content, @method)
    end
  end
end