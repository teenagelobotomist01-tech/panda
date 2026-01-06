class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
  end

  private

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "No autorizado"
    end
  end
end

