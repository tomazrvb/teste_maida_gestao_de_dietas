class InitPagesController < ApplicationController
  
  def new
    render "login.html.erb"
  end

  def login
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to home_path
    else
      flash.now[:danger] = 'Email e/ou senha invalida'
      render 'login'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  

  def index
  
  end
end
