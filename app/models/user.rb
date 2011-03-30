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
  validates :administrator, :presence => false

  validates :email, :presence => true,
            :format   => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }

  validates :password, :presence     => true,
            :confirmation => true,
            :length       => { :within => 6..40 }

  # before_save :encrypt_password


  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end



end
