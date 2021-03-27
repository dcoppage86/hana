class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        
        session[:user_id] = @user.id
        
        redirect_to users_path(@user)
    end

    def show
      
    end

    def edit
      
    end
    
    def update
      if @user.update_attributes(user_params)
        flash[:success] = "User was successfully updated"
        redirect_to user_path(@user)
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
    end
    
    
    

    private

    def set_user
      @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
