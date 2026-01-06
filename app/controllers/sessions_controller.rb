class SessionsController < ApplicationController
  def new
  end

  def create
  user = User.find_by(email: params[:email])

  if user&.authenticate(params[:password])
    session[:user_id] = user.id

    if user.admin?
      redirect_to admin_users_path
    else
      redirect_to user_path(user)
    end
  else
    flash.now[:alert] = "Credenciales inválidas"
    render :new
  end
end


  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Sesión cerrada"
  end
end

