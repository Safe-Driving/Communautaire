# == Schema Information
# Schema version: 20110326180355
#
# Table name: topics
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  category   :integer
#  author     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Topic < ActiveRecord::Base

  belongs_to :category, :foreign_key => "category"
  belongs_to :user, :foreign_key => "author"
  has_many :posts

  validates :title,  	:presence => true
  validates :category,  :presence => true
  validates :author,  	:presence => true

end
