class SearchesController < ApplicationController
  before_action :authenticate_user!

  # 会員、映画、ジャンルの検索
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == "User"
      @records = User.search_for(@content, @method)
    elsif @model == "Theater"
      @records = Theater.search_for(@content, @method)
    else
      @records = Genre.search_for(@content, @method)
    end
  end
end
