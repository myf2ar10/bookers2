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
  @users = User.all
  end



  def edit
  is_matching_login_user
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
    # @user.profile_image.attach(params[:profile_image])コメントアウトしておく

    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "error."
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)    # 自分で
    end
  end

end