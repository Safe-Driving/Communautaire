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
require "digest"
class User < ActiveRecord::Base


  has_many :articles, :foreign_key => "author"
  has_many :topics,   :foreign_key => "author"
  has_many :posts,    :foreign_key => "author"

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :pseudo,  :presence => true,
            :length   => { :maximum => 50 }

  validates :first_name,  	:presence => true
  validates :last_name,  	:presence => true


  validates :email, :presence => true,
            :format   => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }

  validates :password, :presence     => true,
            :confirmation => true,
            :length       => { :within => 6..40 }





end
