class UsersController < ApplicationController

  def index
    @user = User.find_by_email(params[:email])
    respond_to do |format|
          format.html 
          format.js  {render :json => @user.to_json(:only => [ :first_name, :last_name, :email, :encrypted_password ])}
    end
  end
  def show
    @user = User.find(params[:id])
  end
end
