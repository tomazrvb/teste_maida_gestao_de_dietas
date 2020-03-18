class WeightHistoriesController < ApplicationController
  def dash
    if logged_in?
      @user  =  current_user
      @weightHistory = WeightHistory.where( user_id:  @user.id)
      history = WeightHistory.where( user_id:  @user.id).select(([:weighing_date, :weight])).group(:weighing_date, :weight)
      @series = []
      history.each do |h|
        @series << [h.weighing_date,h.weight]
      end
    else
      redirect_to root_url
    end
  end
  
  def create
    user  =  current_user
    @hist = WeightHistory.create(
      weighing_date: params[:hist][:weighing_date],
      weight: params[:hist][:weight].to_f,
      user_id:  user.id
    )
    if @hist.save
      redirect_to weight_histories_dash_path
    else 
      redirect_to weight_histories_dash_path
    end
  end
  
  def destroy
    @weightHistory = WeightHistory.find_by(id: params[:id])
    @weightHistory.destroy
    redirect_to weight_histories_dash_path
  end
end
