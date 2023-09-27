class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password])
      # Осуществить вход пользователя и переадресовать на страницу профиля.
      log_in user
      redirect_to user
    else
      # Сообщение об ошибке.
      flash.now[:danger] = 'Invalid email/password combination' # Неправильно!
      render action: 'new'
    end
  end
    
  def destroy
  end

end