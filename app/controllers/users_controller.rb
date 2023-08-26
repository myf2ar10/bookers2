class UsersController < ApplicationController
  def show

  end

  def edit
    @user = current_user

  end

    # 自分で、新規投稿バリデーション
  def create
    @user = current_user
    if @user.save
      redirect_too user_path(@user_params)
    else
      render :new
    end
  end
    # ここまで

  def update
    @user = User.find(params[:id])
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
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end