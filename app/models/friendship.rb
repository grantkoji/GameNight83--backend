class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, :class_name => "User"

    def friend1_name
        self.user.username
    end

    def friend2_name
        self.friend.username
    end
    # belongs_to :friend_requested, class_name: "User"
    # belongs_to :friend_accepted, class_name: "User"

end