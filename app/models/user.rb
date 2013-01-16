class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me, :confirmed_at, :birthday, :gender, :juhu
  # attr_accessible :title, :body

  validates_presence_of :firstname, :lastname, :birthday, :gender
  validates_uniqueness_of :email, :case_sensitive => false
end
