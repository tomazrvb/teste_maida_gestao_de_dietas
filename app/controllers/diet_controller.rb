class DietController < ApplicationController

    def home
        @meals_list_type = [["Café da manhã",1],["Lanche",2], ["Almoço",3], ["Jantar",4]]
        if logged_in?
            @user  =  current_user
            @diet = Diet.find_by( user_id:  @user.id) 
        else
            redirect_to root_url
        end
    end
    
end
