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

  belongs_to :category, :foreign_key => "category"
  belongs_to :user, 	:foreign_key => "author"

  validates :title,  	:presence => true
  validates :content,  	:presence => true
  validates :author,  	:presence => true
  validates :category,  :presence => true

end
