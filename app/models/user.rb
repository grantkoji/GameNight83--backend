class User < ApplicationRecord
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user
    # has_many :game_hosts, :class_name => "User", :foreign_key => 
    # has_many :game_creators, :class_name => "User" :foreign_key => 

    # has_secure_password
    # has_many :conversations, :foreign_key => :sender_id  has_many :action_posts
    # has_many :comments
    # has_many :user_categories
    # has_many :categories, through: :user_categories
end