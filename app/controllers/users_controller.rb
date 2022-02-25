class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show, :destroy ]
    before_action :require_user, except: [:show, :index, :new, :create]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
       @users = User.all 
    end

    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] ="Your account is created correct."
            redirect_to articles_path           
        else
            render 'new', status: :unprocessable_entity  
        end
    end
    def edit
    end
    def update
        if @user.update(user_params)
            flash[:notice] = "User edited"
            redirect_to user_path
            else
                render "edit", status: :unprocessable_entity
        end
    end

    def show
        @articles = @user.articles
    end
    
    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user #zerujemy sesję - inaczje błąd będzie 
        flash[:notice] = "Twoje konto zostało usunięte"
        redirect_to articles_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id]) 
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
          flash[:alert] = "Możesz edytować tylko swoje konto."
          redirect_to @user
        end
      end
end