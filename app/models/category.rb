# == Schema Information
# Schema version: 20110326180355
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base

  has_many :articles
  has_many :topics

  validates :name,  	:presence => true

end
