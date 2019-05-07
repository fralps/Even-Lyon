class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]

  def show
  	dont_show
  	@user = User.find(params[:id])
  end

  def dont_show
  	@user = User.find(params[:id])
  	if @user != current_user
  		redirect_to root_path
  		flash[:alert] = "Condidential Information"
  	end
  end
end
