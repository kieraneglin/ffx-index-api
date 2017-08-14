class AdminLoginsController < ApplicationController

  def new
    @admin = AdminLogin.new
  end

  def create
    @admin = AdminLogin.find_by(email: params[:admin_login][:email])

    if @admin && @admin.authenticate(params[:admin_login][:password])
      session[:admin] = @admin.id
      redirect_to '/admin'
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to new_admin_login_path 
  end

  private

  def protect_against_forgery?; false; end
end
