class UsersController < ApplicationController

  def new
    @user = User.new(params[:user])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      @user.inspect
      Time.now.inspect

    end
    @user.inspect

  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

end

# TODO : ajouter des messages de validation (password trop court etc)