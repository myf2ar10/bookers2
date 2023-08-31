class UsersController < ApplicationController

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end


  def show
  @user = User.find(params[:id])
  @book = Book.new
  @books = @user.books
  end



  def edit
  @user = User.find(params[:id])

  end

    # 自分で、新規投稿バリデーション
  def create
    @user = current_user
    if @user.save
      redirect_to user_path(@user_params)
    else
      render :new
    end
  end
    # ここまで

  def update
    @user = User.find(params[:id])
    p params
    p user_params
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error."
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end