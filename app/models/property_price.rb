# == Schema Information
#
# Table name: property_prices
#
#  id         :integer          not null, primary key
#  date       :date
#  region     :string
#  median     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PropertyPrice < ActiveRecord::Base
end
