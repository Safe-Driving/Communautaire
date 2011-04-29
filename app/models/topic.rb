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
#  content    :text
#  description :string(255)
#

class Topic < ActiveRecord::Base

  belongs_to :user,     :foreign_key => "author"
  belongs_to :category, :foreign_key => "category"
  has_many :posts,		:foreign_key => "topic"

  validates :title,  	    :presence => true
  validates :category,    :presence => true
  validates :author,  	  :presence => true
  validates :content,     :presence => true
  validates :description, :presence => true

end
