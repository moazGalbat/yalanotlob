class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #group relationship
  has_many :owned_groups, class_name: 'Group', foreign_key: 'admin_id',  dependent: :destroy
  has_and_belongs_to_many :groups, :join_table => "user_groups"


  #frinds relationship
  has_and_belongs_to_many :friends,
                          :class_name => "User",
                          :join_table => "friends",
                          :foreign_key => "first_user_id",
                          :association_foreign_key => "second_user_id"
  has_many :user_orders

  #order
  has_many :orders , dependent: :destroy
  
  #notificatiom
  has_many :notifications, foreign_key: "recipient_id" , dependent: :destroy
  has_many :invites , dependent: :destroy
  
end
