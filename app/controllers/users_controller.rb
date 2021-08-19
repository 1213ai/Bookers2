class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    # @books = @user.books.page(params[:page]).reverse_order
    # NoMethodError in UsersController#showエラー
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(1)
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction_id)
  end

end
