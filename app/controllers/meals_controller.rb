class MealsController < ApplicationController
  
  def create
    type ={
      "1"=>"Café da manhã",
      "2"=>"Lanche",
      "3"=>"Almoço",
      "4"=>"Jantar"
    }
    user  =  current_user
    diet = Diet.find_by( user_id:  user.id) 
    
    @meal = Meal.new(
      description: params[:meal][:description],
      schedule: params[:meal][:schedule],
      meal_type: type[params[:meal][:type]].to_s,
      diet_id: diet.id
    )
    if @meal.save
      redirect_to home_path
    else
      redirect_to home_path,  notice: 'Dados incompletos ou faltantes. Por favor informar todos os dados Corretamete!'
    end
  end
  def destroy
    @meal = Meal.find_by(id: params[:id])
    @meal.destroy
    redirect_to home_path
  end

end

