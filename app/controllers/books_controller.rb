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
    @books = Book.all
  end

  def show
  @book = Book.find(params[:id])
  @user = @book.user
  @book_new = Book.new
  end

  def edit
  is_matching_login_user
  @book = Book.find(params[:id])





        # if @book.user == current_user #webより
        #   render "edit"
        # else
        #   redirect_to books_path
        # end




  end

  def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      # (params[:user_id])
      render template: "books/index"
    end
  end

# 自分で
  def update
    @book = Book.find(params[:id])# 自分で
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render template: "books/edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

    private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end