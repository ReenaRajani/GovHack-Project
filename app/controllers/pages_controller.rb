class PagesController < ApplicationController
  def landing
  end

  def details

    values  = params[:details]
    property = PropertyPrice.where("region = '#{values[:region]}'").order(date: :desc).first
    property_price = property.median
    income = Income.find_by("gender = '#{values[:gender]}' and state = '#{values[:state]}' and #{values[:age]} between age_min and age_max ")
    yearly_income = income.average
    monthly_income =yearly_income /12
    repayment_amount = monthly_income/ 3 # assuming that they pay one third of their amount

     repayment_period = repayment_time(property_price ,repayment_amount)

    info = {
      :success => true,
      :propertyprice => property_price,
      :averageincome => yearly_income,
      :repaymentperiod => repayment_period
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
