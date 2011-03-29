# == Schema Information
# Schema version: 20110326180355
#
# Table name: users
#
#  id            :integer         not null, primary key
#  pseudo        :string(255)
#  first_name    :string(255)
#  last_name     :string(255)
#  email         :string(255)
#  password      :string(255)
#  administrator :boolean
#  created_at    :datetime
#  updated_at    :datetime
#

class User < ActiveRecord::Base


  has_many :articles
  has_many :topics
  has_many :posts

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :pseudo,  :presence => true,
            :length   => { :maximum => 50 }

  validates :first_name,  	:presence => true
  validates :last_name,  	:presence => true
  validates :password,  	:presence => true
  validates :administrator, :presence => true

  validates :email, :presence => true,
            :format   => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }


  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return user
  end



end
