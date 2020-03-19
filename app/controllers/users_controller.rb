class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to home_path
        else 
            flash.now[:danger] = 'Dados incompletos ou faltantes, Por favor informar todos os dados Corretamete!'
            render action: :new
        end
    end
    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
