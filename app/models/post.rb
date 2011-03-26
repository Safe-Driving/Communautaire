# == Schema Information
# Schema version: 20110326180355
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  content    :text
#  author     :integer
#  topic      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :topic

  validates :content,  	:presence => true
  validates :author,  	:presence => true
  validates :topic,  	:presence => true

end
