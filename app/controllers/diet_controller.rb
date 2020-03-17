class DietController < ApplicationController

    def home
        @meals_list_type = [["Café da manhã",1],["Lanche",2], ["Almoço",3], ["Jantar",4]]
        if logged_in?
            @user  =  current_user
            @diet = Diet.find_by( user_id:  @user.id)
            if  @diet.blank?
                @meal = nil
            else
                @meal = Meal.where( diet_id:  @diet.id).order(:schedule)
            end 
        else
            redirect_to root_url
        end
    end
    
    def create
        user  =  current_user
        @diet = Diet.new(
            start_date: params[:diet][:start_date],
            end_date: params[:diet][:end_date],
            starting_weight:params[:diet][:starting_weight],
            ideal_weight:params[:diet][:ideal_weight],
            user_id: user.id,
            height:params[:diet][:height].gsub(',','.').to_f
        )
        if @diet.save
            redirect_to home_path
        else 
            render '/home'
        end
    end
end
