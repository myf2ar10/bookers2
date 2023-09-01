class BooksController < ApplicationController
  def top
  end

  def new
    @book = Book.new
  end

  def index
  end

  def show
  @book = Book.find(params[:id])
  #
  @user = @book.user
  #
  end

  def edit
  end

  def create
  p params
  @book = Book.new(book_params)
    if   @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book), notice: 'Book was successfully created.' # 詳細表示画面へ
      # redirect_to user_path(params[:user_id])
    else
      @books = Book.all
      @user = User.find(current_user.id)
      # (params[:user_id])

      render template: "users/show"
    end
  end

    private

  def book_params
    params.permit(:title, :body, :user_id)
  end

end


