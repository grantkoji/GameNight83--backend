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
game1 = Game.create!(title: "Chinese Poker", creator_id: User.all.sample.id, min_age: 12, min_num_players: 2, max_num_players: 4, image_url: "https://pnimg.net/w/articles/0/564/a36c0b4689.jpg", description: "A combination"\
" of Poker and Switch", link_to_game_website: "https://www.888poker.com/magazine/poker-world/intro-to-chinese-poker", category: "card", rules: "Every player is dealt 13 cards. The goal is to get rid of all of your cards"\
" first. The player holding the 3 of clubs will go first. The first player can play one card, a pair, or a five card hand. The next player can either pass their turn or play a matching hand (single card, pair, or five card hand) with a higher value. Values of the"\
" cards are 2 is the highest, then Ace, then King and down in order until you get to 3. Suits are also ranked with spade the highest, then heart, then diamond, then club. So a 7 of spades is higher than a 7 of hearts. Players continue"\
" to play a matching hand with a higher value until everyone else in the game has passed. If everyone else has passed, whoever played the last hand will start the next one.")


Photo.create!(likes: rand(0..100), game_id: game1.id, user_id: User.all.sample.id, caption: "Got a Royal Flush and still lost in C Poker", image_url: "data:image/jpeg;base64,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") 
Photo.create!(likes: rand(0..100), game_id: game1.id, user_id: User.all.sample.id, caption: "Needless to say, I did not win", image_url: "https://www.primedope.com/wp-content/uploads/Chinese-Poker-Cards.jpg")
Photo.create!(likes: rand(0..100), game_id: game1.id, user_id: User.all.sample.id, caption: "Unbeatable hand.", image_url: "https://66.media.tumblr.com/d24713a701999c00a7602543ff888238/tumblr_ne8h7vbM3J1tztf0no1_400.jpg")

game2 = Game.create!(title: "KanJam", creator_id: User.all.sample.id, min_age: 8, min_num_players: 4, max_num_players: 4, image_url: "https://img.grouponcdn.com/deal/2JQYQH6rRfgxeXXGN3GV5EkAdYFj/2J-2048x1229/v1/c700x420.jpg", 
description: "A flying disc game, played with a flying disc and two cans into which players deflect the disc.", link_to_game_website: "https://www.kanjam.com/kanjam-original-disc-game", category: "card", 
rules: "KanJam is a frisbee based 2 on 2 team game that involves throwing a frisbee at a trash can-like target. Points are earned when you hit the trash can with the frisbee, or when your partner deflects or 'jams' your frisbee into the can."\
" The first team to 21 wins - unless someone hits an "instant win" which is done when you throw the frisbee perfectly through the mail slot on the front of the can."\
"You have to throw from behind the can on one side or the other. If the frisbee hits the ground before being deflected or hitting the can you don't get any points."\
"You have to end on exactly 21. If you go over, like if you have 20 points and you score a 2 pointer, then your score is reduced by that amount as a penalty. So you'd have 18 points and continue playing."\
"You can't hit the disc twice, catch and throw, or use 2 hands to deflect."\
"Teams should get an equal number of turns. In other words, if the other team started and gets to 21 first then your team gets a chance to tie (or instant win). If you do tie it up, then you do one sudden death round and see which team scores more in that overtime round."\
"The ways to score in KanJam break down like this: ​1 Point - Partner Deflects And Hits Can. 2 Points - Disc Hits Can Without Deflection. 3 Points - Partner Jams Disc Inside of Can")


Photo.create!(likes: rand(0..100), game_id: game2.id, user_id: User.all.sample.id, caption: "Played a pro. Didn't have a chance.", image_url: "https://www.flaghouse.com/productImages/image.axd/i.80390/a.3/w.1000/h.1000/KanJam+Disc+Game+-+Class+Pack_XL.jpg")
Photo.create!(likes: rand(0..100), game_id: game2.id, user_id: User.all.sample.id, caption: "Long distance Kam Jam", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTATW0JSM4M_NHqCdq61ooigAVZgUabGX0KQA&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game2.id, user_id: User.all.sample.id, caption: "Getting up", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRPyFVwayCaa4oXhbQnqqpckPZOJPthbJs10w&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game2.id, user_id: User.all.sample.id, caption: "Four W's in a row", image_url: "https://bloximages.newyork1.vip.townnews.com/nny360.com/content/tncms/assets/v3/editorial/5/5e/55e7dd96-d76d-11e9-aa21-6bfa2a4137b8/5d7db75468553.image.jpg?resize=1200%2C800")

game3 = Game.create!(title: "Bocce", creator_id: User.all.sample.id, min_age: 12, min_num_players: 2, max_num_players: 8, image_url: "https://secure.img1-fg.wfcdn.com/im/98755378/resize-h600-w600%5Ecompr-r85/1218/121872657/100mm+Advanced+Bocce+with+Carrying+Case.jpg", description: "Italian bowling -"\
" a relaxed, underhand throwing game", link_to_game_website: "https://bocce.org", category: "outdoors", rules: "The object of the game is to roll your bocce balls closer to the pallino (jack) ball than your opponent"\
"One player per team = four balls per player. Two players per team = two balls per player. Four player per team = one ball per player. The game consists of several frames. A frame starts with tossing the pallino by a team toward the"\
" opposite end of the playing court. The game (frame) is complete after the balls have been thrown and points awarded. Balls are tossed or rolled underhand. Once the pallino is in position, the first team throws their bocce ball. Taking alternate turns, each "\
"team throws their balls toward the pallino to (A) get their ball closest to the pallino, (B) to move the pallino closer to their ball, or (C) move the opponent’s ball. The winning team begins the next frame. - Scoring: In each frame, only one team scores. One point is given for each bocce ball that is closer to the "\
"pallino than the opposing team’s bocce balls. The pallino distance marker can be used to determine which balls are closer. The game continues until 12 points have been scored or to pre-determined points set by the players before the game starts.")
Photo.create!(likes: rand(0..100), game_id: game3.id, user_id: User.all.sample.id, caption: "Unstoppable Nana", image_url: "https://www.packaworld.com/uploads/9/0/4/8/9048894/6570092_orig.jpg")
Photo.create!(likes: rand(0..100), game_id: game3.id, user_id: User.all.sample.id, caption: "So close...", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRAHUWvnOvwc-ilxVQOvVZBJwt-8-IZp4VRug&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game3.id, user_id: User.all.sample.id, caption: "Controvery", image_url: "https://i.ytimg.com/vi/D7oKgWCopUw/maxresdefault.jpg")
Photo.create!(likes: rand(0..100), game_id: game3.id, user_id: User.all.sample.id, caption: "Good to get outdoors!", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRy0bFohFEohZIFNIu0p2FnjJEQEx1P75mbPA&usqp=CAU")


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

caption_array = ["Team went on to win it all", "Can't believe we're playing this right now", "Eventually led to the result we wanted", "A for Effort", ]


