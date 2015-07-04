class PagesController < ApplicationController
  def landing
  end
  def details

    property = PropertyPrice.where("region = '#{params[:details][:region]}'").order(date: :desc).first
    binding.pry
    # set = PropertyPrice.find_by (region: params[:region] and EXTRACT(year from date) = 2015;
    price = property.median
    # set1 = Income.where()
    # avg_income = Income.find_by 


    info = {
      :success => true
    }
    render :text => info.to_json
  end

end
