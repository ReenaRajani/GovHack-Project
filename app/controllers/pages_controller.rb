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
      :monthlyincome => monthly_income,
      :repaymentperiod => repayment_period
    }





    # Toby's stuff
    gender = values[:gender]
    state = values[:state]
    age = values[:age]

    where =   "gender = '#{gender}' and " +
              "state = '#{state}' and " +
              "(#{age} between age_min and age_max or #{age} < age_max) "

    incomes = Income.where(where).order(average: :desc)
    advanceBracket = false

    if incomes.first.age_min > age.to_i
      advanceBracket = true
    end

    binding.pry

    render :text => info.to_json
  end

  def toby
    raise 'hello'
  end


  private
  def rate
    0.06
  end

  # Time it would take to repay WITHOUT an increase in
  # monthly_repayment
  def repayment_time principle, monthly_repayment
    p = principle
    m = monthly_repayment
    r = rate

    log_param = m - p*r/12

    # Priciple will NEVER be repayed
    if m < 0 || log_param < 0
      return 0
    end

    part1 = Math.log(m) - Math.log(log_param)
    part2 = Math.log(1 + r/12)

    part1 / part2
  end

  def interest_accrued principle, no_of_months
    p = principle
    r = rate / 12
    n = no_of_months

    future_value = p * (1 + r)**n
    future_value - principle
  end
end
