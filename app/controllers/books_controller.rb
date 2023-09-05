class BooksController < ApplicationController
  def top
  end

  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
  @book = Book.find(params[:id])
  @user = @book.user
  end

  def edit
  is_matching_login_user
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

# 自分で
  def update
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

    private

  def book_params
    params.permit(:title, :body, :user_id)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)    # 自分で
    end
  end

end


