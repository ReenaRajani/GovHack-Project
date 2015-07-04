class PagesController < ApplicationController
  def landing
  end

  def details
    binding.pry
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
