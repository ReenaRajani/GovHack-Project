# == Schema Information
#
# Table name: incomes
#
#  id         :integer          not null, primary key
#  gender     :string
#  state      :string
#  age_min    :integer
#  age_max    :integer
#  average    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Income < ActiveRecord::Base
end
