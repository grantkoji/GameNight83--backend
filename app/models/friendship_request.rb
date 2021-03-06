class FriendshipRequest < ApplicationRecord
    belongs_to :user
    belongs_to :request, :class_name => "User"

    def user_name
        self.user.username
    end

    def user_photo 
        self.user.profile_url
    end

    def request_photo
        self.request.profile_url
    end

    def request_name
        self.request.username
    end
    # belongs_to :friend_requested, class_name: "User"
    # belongs_to :friend_accepted, class_name: "User"

end