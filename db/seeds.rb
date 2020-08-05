require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Game.destroy_all
Friendship.destroy_all
GamePhoto.destroy_all 
PlayedGame.destroy_all
Review.destroy_all
puts "Clearing Database"

25.times do 
    User.create!(username: Faker::TvShows::SouthPark.unique.character, name: Faker::Name.unique.name, password: "1234", age: rand(18..65), fav_games: Faker::Game.unique.title)
end

25.times do
    user1 = rand(1..25)
    user2 = rand(1..25)
    until user2 != user1 do 
        user2 = rand(1..25)
    end
    Friendship.create!(user_id: user1, friend_id: user2)
end

# create_table "games", force: :cascade do |t|
#     t.string "title"
#     t.integer "creator_id"
#     t.integer "min_num_players"
#     t.integer "max_num_players"
#     t.integer "min_age"
#     t.string "description"
#     t.string "instructions_and_rules"
#     t.string "image_url", default: ""
#     t.string "link_to_game_website", default: ""
#     t.string "game_category"
#   end
Game.create!(title: "Chinese Poker", creator_id: User.all.sample.id, min_age: 12, min_num_players: 2, max_num_players: 4, image_url: "https://pnimg.net/w/articles/0/564/a36c0b4689.jpg", description: "A combination"\
" of Poker and Switch", link_to_game_website: "https://www.888poker.com/magazine/poker-world/intro-to-chinese-poker", category: "card", rules: "Every player is dealt 13 cards. The goal is to get rid of all of your cards"\
" first. The player holding the 3 of clubs will go first. The first player can play one card, a pair, or a five card hand. The next player can either pass their turn or play a matching hand (single card, pair, or five card hand) with a higher value. Values of the"\
" cards are 2 is the highest, then Ace, then King and down in order until you get to 3. Suits are also ranked with spade the highest, then heart, then diamond, then club. So a 7 of spades is higher than a 7 of hearts. Players continue"\
" to play a matching hand with a higher value until everyone else in the game has passed. If everyone else has passed, whoever played the last hand will start the next one.")



100.times do 
    rating = rand(1..10)
    review_content = "This game had no redeeming qualities. I want my time back."
    if rating == 10 
        review_content = "Love this game. Want to play it again and again and again."
    elsif rating == 9
        review_content = "Highly recommend. Was a big hit with my friends!"
    elsif rating == 8
        review_content = "Great experience for everyone. Highly recommend."
    elsif rating == 7
        review_content = "Had a lot of fun playing this game. Everyone was engaged, although we were a little confused with the instructions."
    elsif rating == 6
        review_content = "We liked playing this game. Wish there were more rounds."
    elsif rating == 5
        review_content = "Made friends into enemies. Not sure if that's a good or a bad thing."
    elsif rating == 4
        review_content = "Had some issues with the rules were a little unclear, but the game went alright."
    elsif rating == 3
        review_content = "Was surprised by other positive reviews. Didn't get much out of this one."
    elsif rating == 2
        review_content = "Poor experience and instructions."
    end
    rating = (rating / 2).ceil
    user = User.all.sample
    game = Game.all.sample
    Review.create!(user_id: user.id, game_id: game.id, num_stars: rating, content: review_content)
end



