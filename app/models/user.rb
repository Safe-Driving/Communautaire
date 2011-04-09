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
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me


  has_many :articles, :foreign_key => "author"
  has_many :topics,   :foreign_key => "author"
  has_many :posts,    :foreign_key => "author"

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i




end
