class User < ApplicationRecord
  # has_many :played_games, :foreign_key => :host_id
  has_many :scheduled_games, :foreign_key => :host_id
  has_many :scheduled_game_players
  has_many :games, :foreign_key => :creator_id
  has_many :reviews
  has_many :game_photos
  # Friendships
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  # Friend Requests
  has_many :friendship_requests
  has_many :requests, :through => :friendships
  has_many :inverse_friendship_requests, :class_name => "FriendshipRequest", :foreign_key => "request_id"
  has_many :inverse_requests, :through => :inverse_friendship_requests, :source => :user

  validates_uniqueness_of :username
  has_secure_password

  def total_friends
    friend_array = self.friends + self.inverse_friends
    friend_array.uniq
  end

  def friend_requests_sent
    self.friendship_requests 
  end

  def friend_requests_received
    self.inverse_friendship_requests
  end

 
    # user.friends if user_id in friendship table #=> array of friends
    # user.inverse_friends if friend_id in friendship table #=> array of inverse_friends
    # user.hosted_games => array of games hosted by this user
    # has_many :game_hosts, :foreign_key => :host_id
    # has_many :hosted_games, through: :game_hosts, source: :game
    
    
    
    # has_many :games, through: :game_hosts
    # has_many :games, through: :game_players
    # has_many :game_hosts, :class_name => "User", :foreign_key => 
    # has_many :game_creators, :class_name => "User" :foreign_key => 

  
    # has_many :conversations, :foreign_key => :sender_id  has_many :action_posts
    # has_many :comments
    # has_many :user_categories
    # has_many :categories, through: :user_categories
end