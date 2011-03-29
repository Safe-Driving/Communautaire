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

  belongs_to :user, 	:foreign_key => "author"
  belongs_to :topic, 	:foreign_key => "topic"

  validates :content,  	:presence => true
  validates :author,  	:presence => true
  validates :topic,  	:presence => true

end