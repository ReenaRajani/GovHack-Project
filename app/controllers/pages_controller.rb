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

  private
  # P = Principle
  # M = Repayment amount
  # R = Interest rate
  def repayment_time p, m
    r = 0.07

    log_param = m - p*r/12

    # Priciple will NEVER be repayed
    if m < 0 || log_param < 0
      return 0
    end

    part1 = Math.log(m) - Math.log(log_param)
    part2 = Math.log(1 + r/12)

    part1 / part2
  end
end
