# == Schema Information
# Schema version: 20110326180355
#
# Table name: articles
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  author     :integer
#  category   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Article < ActiveRecord::Base

  belongs_to :category
  belongs_to :user

  validates :title,  	:presence => true
  validates :content,  	:presence => true
  validates :author,  	:presence => true
  validates :category,  :presence => true

end
