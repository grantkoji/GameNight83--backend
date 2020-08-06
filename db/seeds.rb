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


games_title_array = ["Charades", "Codenames", "Words With Friends", "Settlers of Catan", "Dominion", "Pandemic", "Ticket To Ride", "KanJam", "Bocce", "Spikeball", "Cornhole", "Inflatable Bubble Soccer", "Wooden Lawn Bowling", "Bingo", "Scattegories", "Most Likely To...", "Trivia", "Pictionary", "Heads Up!"]

25.times do 
    User.create!(username: Faker::TvShows::SouthPark.unique.character, name: Faker::Name.unique.name, password: "1234", age: rand(18..65), fav_games: Faker::Game.unique.title)
end

this_user = User.create!(username: "Catanimal", name: "Grant", password: "1234", age: 75, fav_games: "Catan, Codenames, KanJam, Quiplash")

puts "Users created"

100.times do
    user1 = User.all.sample
    user2 = User.all.sample
    until user2 != user1 do 
        user2 = User.all.sample
    end
    Friendship.create!(user_id: user1.id, friend_id: user2.id)
end

puts "Friendships created"

game1 = Game.create!(title: "Chinese Poker", creator_id: User.all.sample.id, min_age: 12, min_num_players: 2, max_num_players: 4, image_url: "https://pnimg.net/w/articles/0/564/a36c0b4689.jpg", description: "A combination"\
" of Poker and Switch", link_to_game_website: "https://www.888poker.com/magazine/poker-world/intro-to-chinese-poker", category: "card", instructions_and_rules: "Every player is dealt 13 cards. The goal is to get rid of all of your cards"\
" first. The player holding the 3 of clubs will go first. The first player can play one card, a pair, or a five card hand. The next player can either pass their turn or play a matching hand (single card, pair, or five card hand) with a higher value. Values of the"\
" cards are 2 is the highest, then Ace, then King and down in order until you get to 3. Suits are also ranked with spade the highest, then heart, then diamond, then club. So a 7 of spades is higher than a 7 of hearts. Players continue"\
" to play a matching hand with a higher value until everyone else in the game has passed. If everyone else has passed, whoever played the last hand will start the next one.")


Photo.create!(likes: rand(0..100), game_id: game1.id, user_id: User.all.sample.id, caption: "Got a Royal Flush and still lost in C Poker", image_url: "data:image/jpeg;base64,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") 
Photo.create!(likes: rand(0..100), game_id: game1.id, user_id: User.all.sample.id, caption: "Needless to say, I did not win", image_url: "https://www.primedope.com/wp-content/uploads/Chinese-Poker-Cards.jpg")
Photo.create!(likes: rand(0..100), game_id: game1.id, user_id: User.all.sample.id, caption: "The unbeatable hand", image_url: "https://66.media.tumblr.com/d24713a701999c00a7602543ff888238/tumblr_ne8h7vbM3J1tztf0no1_400.jpg")

puts "Game 1 and photos created"

game2 = Game.create!(title: "KanJam", creator_id: this_user.id, min_age: 8, min_num_players: 4, max_num_players: 4, image_url: "https://img.grouponcdn.com/deal/2JQYQH6rRfgxeXXGN3GV5EkAdYFj/2J-2048x1229/v1/c700x420.jpg", 
description: "A flying disc game, played with a flying disc and two cans into which players deflect the disc.", link_to_game_website: "https://www.kanjam.com/kanjam-original-disc-game", category: "card", 
instructions_and_rules: "KanJam is a frisbee based 2 on 2 team game that involves throwing a frisbee at a trash can-like target. Points are earned when you hit the trash can with the frisbee, or when your partner deflects or 'jams' your frisbee into the can."\
" The first team to 21 wins - unless someone hits an "instant win" which is done when you throw the frisbee perfectly through the mail slot on the front of the can."\
"You have to throw from behind the can on one side or the other. If the frisbee hits the ground before being deflected or hitting the can you don't get any points."\
"You have to end on exactly 21. If you go over, like if you have 20 points and you score a 2 pointer, then your score is reduced by that amount as a penalty. So you'd have 18 points and continue playing."\
"You can't hit the disc twice, catch and throw, or use 2 hands to deflect."\
"Teams should get an equal number of turns. In other words, if the other team started and gets to 21 first then your team gets a chance to tie (or instant win). If you do tie it up, then you do one sudden death round and see which team scores more in that overtime round."\
"The ways to score in KanJam break down like this: ​1 Point - Partner Deflects And Hits Can. 2 Points - Disc Hits Can Without Deflection. 3 Points - Partner Jams Disc Inside of Can")


Photo.create!(likes: rand(0..100), game_id: game2.id, user_id: User.all.sample.id, caption: "Played a pro. Game was over the second he hopped out of his car", image_url: "https://www.flaghouse.com/productImages/image.axd/i.80390/a.3/w.1000/h.1000/KanJam+Disc+Game+-+Class+Pack_XL.jpg")
Photo.create!(likes: rand(0..100), game_id: game2.id, user_id: this_user.id, caption: "Long distance Kam Jam. Should've joined the Ultimate Frisbee team", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTATW0JSM4M_NHqCdq61ooigAVZgUabGX0KQA&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game2.id, user_id: User.all.sample.id, caption: "And that was just a warm up jump", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRPyFVwayCaa4oXhbQnqqpckPZOJPthbJs10w&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game2.id, user_id: User.all.sample.id, caption: "Four W's in a row", image_url: "https://bloximages.newyork1.vip.townnews.com/nny360.com/content/tncms/assets/v3/editorial/5/5e/55e7dd96-d76d-11e9-aa21-6bfa2a4137b8/5d7db75468553.image.jpg?resize=1200%2C800")

game3 = Game.create!(title: "Bocce", creator_id: User.all.sample.id, min_age: 12, min_num_players: 2, max_num_players: 8, image_url: "https://secure.img1-fg.wfcdn.com/im/98755378/resize-h600-w600%5Ecompr-r85/1218/121872657/100mm+Advanced+Bocce+with+Carrying+Case.jpg", description: "Italian bowling -"\
" a relaxed, underhand throwing game", link_to_game_website: "https://bocce.org", category: "outdoors", instructions_and_rules: "The object of the game is to roll your bocce balls closer to the pallino (jack) ball than your opponent"\
"One player per team = four balls per player. Two players per team = two balls per player. Four player per team = one ball per player. The game consists of several frames. A frame starts with tossing the pallino by a team toward the"\
" opposite end of the playing court. The game (frame) is complete after the balls have been thrown and points awarded. Balls are tossed or rolled underhand. Once the pallino is in position, the first team throws their bocce ball. Taking alternate turns, each "\
"team throws their balls toward the pallino to (A) get their ball closest to the pallino, (B) to move the pallino closer to their ball, or (C) move the opponent’s ball. The winning team begins the next frame. - Scoring: In each frame, only one team scores. One point is given for each bocce ball that is closer to the "\
"pallino than the opposing team’s bocce balls. The pallino distance marker can be used to determine which balls are closer. The game continues until 12 points have been scored or to pre-determined points set by the players before the game starts.")
Photo.create!(likes: rand(0..100), game_id: game3.id, user_id: User.all.sample.id, caption: "Unstoppable Nana, always making me feel like a slouch", image_url: "https://www.packaworld.com/uploads/9/0/4/8/9048894/6570092_orig.jpg")
Photo.create!(likes: rand(0..100), game_id: game3.id, user_id: User.all.sample.id, caption: "So close...", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRAHUWvnOvwc-ilxVQOvVZBJwt-8-IZp4VRug&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game3.id, user_id: this_user.id, caption: "Controversy! Gave the point to Black. Going to appeal to the 9 year old judge.", image_url: "https://i.ytimg.com/vi/D7oKgWCopUw/maxresdefault.jpg")
Photo.create!(likes: rand(0..100), game_id: game3.id, user_id: User.all.sample.id, caption: "Good to get outdoors!", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRy0bFohFEohZIFNIu0p2FnjJEQEx1P75mbPA&usqp=CAU")


game4 = Game.create!(title: "Spikeball", creator_id: User.all.sample.id, min_age: 8, min_num_players: 2, max_num_players: 6, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRsj_KL2hjqSOilzYdYUo-HpaPDRwnWIH3VYQ&usqp=CAU", 
description: "A version of volleyball, trying to hit a small, soft ball into a trampoline-like net", link_to_game_website: "https://spikeball.com/", category: "outdoors", instructions_and_rules: "Serving: 1) The server’s feet must be six feet away from the net when while serving."\
" 2) After serving, the ball must bounce cleanly off of the net. If the ball hits the rim or misses the net completely, the point is lost to the team being served. 3) If the serve is too high or hits both the net and rim (pocket) then the server  has committed a fault. Each serve is entitled to one fault."\
"4) If the server fails to complete a successful serve the second time, their team loses the point and serve to the opposition. 5) Only the defensive player opposite of the server may return the ball. 6) The server continues to serve until their team loses a point."\
" 7) Both soft and hard serves are allowed. 8) After each point scored, the serving team switches positions, the defensive team stays in the same position. - Contacting the Ball: 1) Each team gets up to three touches to return the ball off of the net."\
" 2) Touches must alternate between teammates. 3) You may use any part of your body as one “touch” except for two hands at once. 4) If the player touches the ball twice consecutively, their team loses the point.  - Scoring:"\
" Points are scored when: the ball bounces on the net twice , the ball hits the rim, the ball hits the ground."\
" Games are won when the winning team reaches a score of 21 points. The team must win by 2 points.")
Photo.create!(likes: rand(0..100), game_id: game4.id, user_id: this_user.id, caption: "Hide your kids, hide your wife from THE BIG SPIKE!", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR-l_7E_J3gP8SHiR6iEIurmrEXs7l0wru_vg&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game4.id, user_id: User.all.sample.id, caption: "All for one and one for all", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR23b9Dv8VHoG0aD9bnLQ2qYlQxswTC_D5nXQ&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game4.id, user_id: User.all.sample.id, caption: "Nice to be out", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSoH86ems-qptE4yxTmeFjgqLEY-cOBBDoaEg&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game4.id, user_id: User.all.sample.id, caption: "I immediately regret this decision.", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStprOJfL_FJap78B1VOuvYAMIj2oHvzNQdMg&usqp=CAU")


puts "Game 4 and photos created"
game5 = Game.create!(title: "Cornhole", creator_id: User.all.sample.id, min_age: 4, min_num_players: 2, max_num_players: 8, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTHpUe-WitJ-tGjJS4mpBLejCNfSGJ0U2LWxQ&usqp=CAU",
description: "An underhand bean bag tossing game, aiming throws at a hole inside a platform on the other side of the field.", link_to_game_website: "https://www.playcornhole.org/", category: "outdoors", instructions_and_rules: "CORNHOLE MATCHES: Each team will stay in their designated lane for the whole game."\
" Players at the headboard will alternate pitching bags until each player has pitched all four of his/her bags. Players at the footboard will take score and resume pitching back to the other board. The top of an inning is completed when both players pitching from the headboard pitch all four bags; the bottom of the inning is completed when the remaining players pitching from the footboard pitch all four bags."\
" SCORING: The approved method of scoring for the sport of cornhole is “cancellation” scoring. In cancellation scoring, the points of one player cancel out the points of their opponent. Using this method, only one player/team can score in each inning. Bag In-The-Count (Woody) : Any bag which comes to rest anywhere on top of the board. Each is worth one (1) point."\
" Bag In-The-Hole (Cornhole) : Any bag which is thrown through the hole or knocked through the hole by another bag. Each is worth three (3) points. Foul Bags – Refers to any bag that has not been determined as Bag In-The-Count or Bag In-The Hole or was designated a foul bag as the result of rules violation. PLAYER PITCHING ROTATION: "\
"The player or team who scored in the preceding inning has honor pitching first in the next inning. If neither player or team scores, the player or team who pitched first in the preceding frame shall retain first pitch in the next frame. POSITION OF PLAYERS DURING PITCHING: The pitcher must be within the pitcher’s box or behind the foul line at the time of release."\
"A player must pitch all four bags from their designated pitcher’s box. Players must pitch the bag with an under-hand release. DETERMINING WINNERS - TRADITIONAL 21: "\
"The game shall be played to the predetermined number of twenty-one points. The first player/team to reach (or exceed) that amount at the conclusion of an inning is the winner.")
Photo.create!(likes: rand(0..100), game_id: game5.id, user_id: User.all.sample.id, caption: "The ACL is back!", image_url: "https://specials-images.forbesimg.com/imageserve/5ec2b3a7be5e8b00064d7cdf/960x0.jpg?fit=scale")
Photo.create!(likes: rand(0..100), game_id: game5.id, user_id: this_user.id, caption: "Had to deduct a point for the illegal toss", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTpRvscsMJ4M5Xcmd0zriNSs34LLIG5t28yAA&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game5.id, user_id: User.all.sample.id, caption: "Is that hole regulation size or what!", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRx35NKHVMgY514WRysXe1embV1GGRXysHjbg&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game5.id, user_id: User.all.sample.id, caption: "Had no idea that gym would be the hardest class to homeschool", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTO-Im9sdDEvNRr4UrD-6-9D4-7OeoiQkvtHw&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game5.id, user_id: User.all.sample.id, caption: "Postponed wedding - NO PROBLEM", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS9mANLr6uoVC7V7HBk1-JvPs3Dof8DhPOI6A&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game5.id, user_id: User.all.sample.id, caption: "First on the court, last to leave", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTGR_Lzh5tbhiPCKi7l_lcI6x6UESxh6cwRrw&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game5.id, user_id: User.all.sample.id, caption: "So many regretful decisions culminated in this one moment...", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSCWRjXrNCt7P54dd2q-dIXHTBkqZQsfKqNhA&usqp=CAU")

game6 = Game.create!(title: "Inflatable Bubble Soccer", creator_id: User.all.sample.id, min_age: 10, min_num_players: 2, max_num_players: 12, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQJp9IlTVqQ3S7Xpb-2IJYqlQ8bO6GOelX_dikyOKLYXVyQfgOxxCkLtv4lNQ&usqp=CAc", 
description: "Soccer in an Inflatable bubble", link_to_game_website: "https://www.inflatable-zone.com/bubble-soccer/bubble-football.html", category: "outdoors contact", instructions_and_rules: "The game requires Bubble Balls, soccer ball, boundary markers & goals. Some people bring their own knee pads for extra comfort/protection and to make it easier to stand up without using their arms."\
"The game loosely follow traditional soccer rules. For example, there is no Off-Sides! You start the game with the soccer ball in the middle of the field. The players stand several feet away and when the ref blows the whistle everyone runs to the ball at the same time resulting in some Bubble Ballers rolling around on the ground! The real fun is just beginning because when you crash into another player, both of you will go flying in different directions. "\
"Each team typically has 5 players and at least 1 substitute. The game is exhilarating & exhausting so bring a sub if possible. Substitutions can be made during the game as needed. There are 4 periods lasting 10 minutes each with a few 2 minute breaks"\
" Each team can call a 2 minute timeout during a half. All play stops immediately when the referee blows the whistle. No kicking or bumping into a player when they are are down. No bumping a player when they are trying to stand back up. No knocking players over when the ball is out of bounds. Don't knock down someone who is not facing you. "\
"No fighting - ejections will happen. No launching into anybodys legs at any time. No kicking the equipment (Bubble Balls). If the Bubble Ball gets punctured please let the ref know. You must remain in the Bubble Ball when in play.")

Photo.create!(likes: rand(0..100), game_id: game6.id, user_id: User.all.sample.id, caption: "Defying gravity", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTrETzRXBHcQrfF5gUVvj1frn_nBbMrFHgPBA&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game6.id, user_id: User.all.sample.id, caption: "Glad to be playing again, no matter how unusual this is", image_url: "https://www.sadlersports.com/wp-content/uploads/Bubble-Soccer-1.jpeg")
Photo.create!(likes: rand(0..100), game_id: game6.id, user_id: User.all.sample.id, caption: "Warm ups. Something seems...off", image_url: "https://c1.neweggimages.com/NeweggImage/ProductImage/AEME_131498474038248953bNNdtWDpAu.jpg")
Photo.create!(likes: rand(0..100), game_id: game6.id, user_id: User.all.sample.id, caption: "If we must be inflated, the ball should as well", image_url: "https://images.squarespace-cdn.com/content/v1/5ca4e214840b16b65ca9dbdd/1557960035038-TVSSQQYUQJJ11XTAS5MY/ke17ZwdGBToddI8pDm48kMR1yAHb8bPoH1-OdajP2rZZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpya-Yv2-AUIrtyc_1d9d84jKAfrgH35AgL5HDK7jKFTEAbkVb2mHFRzAaMt_-j0ggg/Bubble+Soccer+in+Los+Angeles+%234.jpeg?format=500w")
Photo.create!(likes: rand(0..100), game_id: game6.id, user_id: this_user.id, caption: "Neither of them wound up with the ball", image_url: "https://i.pinimg.com/originals/5f/c6/7e/5fc67e55b2900aa1267e623a7817129c.jpg")

game7 = Game.create!(title: "Wooden Lawn Bowling", creator_id: User.all.sample.id, min_age: 7, min_num_players: 2, max_num_players: 12, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRZlnhEcVJ6HvpUmqveetUBZ6zHGCdGZUqfB7n9pMYINNo7HA0ASExREjHufYg&usqp=CAc", 
description: "Bowling set that can be played on a lawn", link_to_game_website: "https://www.amazon.com/Bowling-Skittle-Toddlers-Hey-Play/dp/B01ACYSSL6?tag=178918-outdoorgamesforadults-20", category: "outdoors", instructions_and_rules: "Rules are the same as bowling")

Photo.create!(likes: rand(0..100), game_id: game7.id, user_id: User.all.sample.id, caption: "Had to make some modifications for him", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS52MSwOukwiM7PbzaHChP8WY91Fc7LrVOgvQ&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game7.id, user_id: User.all.sample.id, caption: "Not sure I can salvage this frame", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRyQ29OyhbIOCu86QuA3RVbirjbT14DSXJVHA&usqp=CAU")

game8 = Game.create!(title: "Bingo on Zoom", creator_id: User.all.sample.id, min_age: 7, min_num_players: 2, max_num_players: 12, image_url: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fhamptonroadsmessenger.com%2Fwp-content%2Fuploads%2F2020%2F06%2FVirtual-Bingo.jpg&imgrefurl=https%3A%2F%2Fhamptonroadsmessenger.com%2Fposts%2Fnnpd-hosts-virtual-bingo%2F&tbnid=2Al4IRC9QhbzgM&vet=12ahUKEwik5_vg5YTrAhVTZt8KHds5Cx0QMygBegUIARC8AQ..i&docid=Z53OUgEALYKETM&w=842&h=529&q=virtual%20bingo&ved=2ahUKEwik5_vg5YTrAhVTZt8KHds5Cx0QMygBegUIARC8AQ", 
description: "Basic Bingo game, played through Zoom or another video platform", link_to_game_website: "https://myfreebingocards.com/virtual-bingo", category: "Zoom", instructions_and_rules: "Go to the website link to set up a Bingo game. Have all participants join via Zoom or another platform")

Photo.create!(likes: rand(0..100), game_id: game8.id, user_id: User.all.sample.id, caption: "BINGO!!!", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSIQ9i9o6SXFntBlZsH8K9KsWLMH436GQ1wHw&usqp=CAU")
Photo.create!(likes: rand(0..100), game_id: game8.id, user_id: this_user.id, caption: "Went to the beach...so he can play Bingo", image_url: "https://static8.depositphotos.com/1370441/975/i/450/depositphotos_9758096-Young-Attractive-Man-Celebrating-Success-Working-on-Computer-at.jpg")

puts "Game 8 and photos created"
game9 = Game.create!(title: "Scattegories on Zoom", creator_id: User.all.sample.id, min_age: 12, min_num_players: 2, max_num_players: 6, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTiYxClFryO1aXDBwm43J-PiI4c2zChd2R9Ug&usqp=CAU",
description: "Scattegories played through Zoom or another video platform", link_to_game_website: "https://scattergoriesonline.net/", category: "Zoom", instructions_and_rules: "Go to the website link to generate a free game. Send each person a link to the game. "\
"The rules are simple: there is one letter and five categories (things like 'school supplies,' 'book title,' and 'girl's name'). You have 60 seconds to come up with a word that fits in each category and starts with the chosen letter. The more unique your answer is compared to your friends' answers, the more points you get.")

Photo.create!(likes: rand(0..100), game_id: game9.id, user_id: User.all.sample.id, caption: "P for the win!", image_url: "https://www.ultraboardgames.com/scattergories/gfx/game6.jpg")

game10 = Game.create!(title: "Most Likely To...", creator_id: User.all.sample.id, min_age: 21, min_num_players: 4, max_num_players: 20, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRlONzra0R68ygqEfoD6RGcTsfNbX-fLg4SMw&usqp=CAU",
description: "A fun way to get to know your friends. Drinking is optional", link_to_game_website: "https://www.tagquestions.net/most-likely-to-questions-tag/", category: "Zoom Drinking", instructions_and_rules: "Pose different 'most likely to' scenarios — for example,"\ 
" 'most likely to go skydiving' or 'most likely to own a zoo' — and decide which friend would be most likely to do that thing. Whoever it is has to drink. Click the link to find a big list of questions.")

Photo.create!(likes: rand(0..100), game_id: game10.id, user_id: User.all.sample.id, caption: "Most Likely To win the Oscar...", image_url: "https://www.etonline.com/sites/default/files/styles/max_970x546/public/images/2020-04/streep.jpg?h=884b70cc&itok=LhjepvxK")
Photo.create!(likes: rand(0..100), game_id: game10.id, user_id: User.all.sample.id, caption: "Voted Most Likely To become a bestselling author. Bottoms up, then back to typing...", image_url: "https://static01.nyt.com/images/2020/03/27/multimedia/20happy-hour-coronavirus/20happy-hour-coronavirus-mobileMasterAt3x.jpg")
Photo.create!(likes: rand(0..100), game_id: game10.id, user_id: User.all.sample.id, caption: "Most Likely To hoard toilet paper. Guess who won?", image_url: "https://i.dailymail.co.uk/1s/2020/03/06/08/25614960-8081859-image-a-48_1583482874060.jpg")
Photo.create!(likes: rand(0..100), game_id: game10.id, user_id: this_user.id, caption: "Most Likely To games keep ending in a TIE!!!", image_url: "https://i.ytimg.com/vi/w5-n290V_Z4/hqdefault.jpg")

game11 = Game.create!(title: "Trivia", creator_id: User.all.sample.id, min_age: 10, min_num_players: 4, max_num_players: 20, image_url: "https://www.griswoldhomecare.com/wp-content/uploads/2020/06/bigstock-Trivia-Contest-Quiz-Game-Night-325315975.jpg",
description: "Play Trivia online", link_to_game_website: "https://www.randomtriviagenerator.com", category: "Zoom or indoors", instructions_and_rules: "To play trivia on Zoom, click the link to open a random trivia generator and start asking questions. Have each person send their answer in the Zoom chat at the same time (or just use the honors system).")

Photo.create!(likes: rand(0..100), game_id: game11.id, user_id: User.all.sample.id, caption: "Trivia Night!!!", image_url: "https://s.hdnux.com/photos/01/11/25/64/19225904/3/480x480.png")
Photo.create!(likes: rand(0..100), game_id: game11.id, user_id: User.all.sample.id, caption: "Stumping us all!", image_url: "https://bloximages.newyork1.vip.townnews.com/stltoday.com/content/tncms/assets/v3/editorial/c/ae/cae53719-c3d0-56af-a710-baf85d0d9198/5e8f8159861bf.image.jpg?resize=1200%2C671")
Photo.create!(likes: rand(0..100), game_id: game11.id, user_id: this_user.id, caption: "Forgot my European sandwich names...", image_url: "https://kilowatt.beer/wp-content/uploads/2019/10/zoom-trivia-845x321.jpg")
Photo.create!(likes: rand(0..100), game_id: game11.id, user_id: User.all.sample.id, caption: "Final round and Sarah's baby's in the lead!", image_url: "https://bloximages.newyork1.vip.townnews.com/stltoday.com/content/tncms/assets/v3/editorial/8/57/8572a92d-3ba6-5464-a108-9d6c26c90e51/5e8f815998334.image.jpg?resize=1200%2C803")

game12 = Game.create!(title: "Pictionary", creator_id: User.all.sample.id, min_age: 8, min_num_players: 2, max_num_players: 6, image_url: "https://d2e111jq13me73.cloudfront.net/sites/default/files/styles/product_image_aspect_switcher_170w/public/product-images/csm-app/pictionary.png?itok=5nk2d9jE",
description: "Play Pictionary online", link_to_game_website: "https://randomwordgenerator.com/pictionary.php", category: "Zoom or indoors", instructions_and_rules: "Can be played while on Zoom or any other video sharing platform. To play, divide your group into teams. Click the link to open the Pictionary word generator and choose a team to play first, as well as a designated drawer on that team. The drawer generates a word and has one minute to draw that word for their team to guess. If the team guesses the card correctly, they get a point.")

Photo.create!(likes: rand(0..100), game_id: game12.id, user_id: User.all.sample.id, caption: "Been practicing for tonight's game!", image_url: "https://miro.medium.com/max/6724/1*_G9C8CpXLCBY8w3QNpDREA.jpeg")
Photo.create!(likes: rand(0..100), game_id: game12.id, user_id: this_user.id, caption: "Tough start to the round", image_url: "https://assets.zoom.us/images/en-us/zoom-rooms/zoom-rooms-for-touch/free-form-drawing-example.png")
Photo.create!(likes: rand(0..100), game_id: game12.id, user_id: User.all.sample.id, caption: "In one minute? Overachiever", image_url: "https://improveyourdrawings.com/wp-content/uploads/2019/01/Step-5-Mask-opening-1024x1024.jpg")

puts "Game 12 and photos created"
game13 = Game.create!(title: "Heads Up!", creator_id: User.all.sample.id, min_age: 8, min_num_players: 4, max_num_players: 30, image_url: "https://irs.www.warnerbros.com/hero-banner-v2-tablet-jpeg/game/media/browser/heads_up_mobile_app_uber_4320x1080jpg.jpg",
description: "Use the Heads Up! phone app while on zoom", link_to_game_website: "https://apps.apple.com/us/app/heads-up/id623592465", category: "Zoom or indoors", instructions_and_rules: "A classic word game where players have to describe the word on the screen to the person holding the screen to their head. You can choose from a range of categories and play with as many people as you can fit in your room or Zoom."\
" Click on the link to download Heads Up! on the Game Host's phone. To play on Zoom, have the Game Host show the phone running Heads Up!, while the person who is 'Up' must not look at their Zoom screen. Game is the same otherwise.")

Photo.create!(likes: rand(0..100), game_id: game13.id, user_id: User.all.sample.id, caption: "Ready to go, but forgot to install the app", image_url: "https://happymomhacks.com/wp-content/uploads/2020/04/heads-up-768x644.jpg")
Photo.create!(likes: rand(0..100), game_id: game13.id, user_id: User.all.sample.id, caption: "Yeah, he doesn't know how to do that...", image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.scoopnest.com%2Fuser%2Fbillboard%2F705509329777070081-we-played-heads-up-with-zedd-today-and-you-can-watch-the-fun-right-here&psig=AOvVaw04dMAGr1NIjIaMdHcTSlw7&ust=1596765091083000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCOjZ5dS8hesCFQAAAAAdAAAAABAE")
Photo.create!(likes: rand(0..100), game_id: game13.id, user_id: this_user.id, caption: "Your child may read at the 8th Grade level, but mine got 7 right on this round", image_url: "https://gretapunch.files.wordpress.com/2014/03/heads-up.png")
Photo.create!(likes: rand(0..100), game_id: game13.id, user_id: this_user.id, caption: "Jeff refuses to turn around to start his turn! Meanwhile, Rachel's just holding her phone...", image_url: "https://i.insider.com/5ea30c63a34b3c67b324de14?width=1100&format=jpeg&auto=webp")

game14 = Game.create!(title: "Charades", creator_id: User.all.sample.id, min_age: 8, min_num_players: 4, max_num_players: 12, image_url: "https://ecdn.teacherspayteachers.com/thumbitem/Charades-Virtual-Distance-Learning-Game-Zoom--5650742/original-5650742-1.jpg",
description: "Charades while on zoom", link_to_game_website: "http://www.getcharadesideas.com/", category: "Zoom or indoors", instructions_and_rules: "Split your group into two teams and click the link to use the charades idea generator to choose your words and phrases. The person who's acting out the charade uses the Zoom 'spotlight' feature, and their team has one minute to figure out the phrase.")

Photo.create!(likes: rand(0..100), game_id: game14.id, user_id: this_user.id, caption: "It was high five. How did they not get high five!?!?!", image_url: "https://imgix.bustle.com/uploads/getty/2020/3/27/ed8cc558-7510-49c4-a5d9-c5e06dda90df-getty-1214101407.jpg?w=1200&h=630&q=70&fit=crop&crop=faces&fm=jpg")
Photo.create!(likes: rand(0..100), game_id: game14.id, user_id: User.all.sample.id, caption: "Four words...", image_url: "https://pbs.twimg.com/media/EUDnnzsWAAQ1HJ-.jpg")
Photo.create!(likes: rand(0..100), game_id: game14.id, user_id: User.all.sample.id, caption: "Locked in and ready to go. Future Gamer!", image_url: "https://lh3.googleusercontent.com/proxy/uyQQdDc_XyO_nDRAlQGlXHxg8S6YvYDkuaf7pEfmzUVOD2o0O8184I0BxEfVPlXvLNzD6Vu8TtmORTMtDqGU0UWUBmbHj_Ov-gZAqeyqwNIr7_2OkW_i6rgDtA")

game15 = Game.create!(title: "Codenames", creator_id: this_user.id, min_age: 12, min_num_players: 4, max_num_players: 14, image_url: "https://cf.geekdo-images.com/opengraph/img/KvWkw6TGLr4arA4E1lwnJocdy8E=/fit-in/1200x630/pic2582929.jpg",
description: "Codenames while on zoom", link_to_game_website: "https://codenames.game/", category: "Zoom boardgame", instructions_and_rules: "What you need to play: Zoom, either click the link to get the online version or use the regular Codenames card game and an extra camera to stream the board with some creative rigging equipment."\
" In Codenames, two teams — red and blue — race to correctly guess all their assigned cards in a grid of 25."\
" Every card has a word/codename, like “ghost,” and each team elects a spymaster who will provide one-word hints for their teammates to guess which words/code names belong to their team. "\
"For example, a spymaster might say “specter” to hint to their team that “ghost” is in fact an allied agent. If your team correctly guesses a card, you get to continue playing. "\
"The round stops when your team finds all your agents, stumbles upon a card belonging to the other team or finds a neutral card, dubbed a “bystander.” Spymasters can associate a number with their clue word to try to get their teammates to select more cards in one turn, increasing the difficulty but allowing for a bigger reward. "\
"The entire game is a tabletop version of a minefield. Spymasters provide hints that are usually synonyms to the code names in play but it can be easy to question whether one hint is referring to two or three different cards. Maybe the hint is “city” but Paris, Berlin and Moscow are all on the table. On top of all this, one card is designated as the assassin and, if you select it, your team automatically loses. "\
"For a game of Codenames on Zoom, you’re going to need an extra camera to display the board of cards to the entire group, like this. Whether you have a fancy rig with a webcam or a broomstick and phone with duct tape is entirely your call — so long as the entire group can read the names on all the cards. There’s also an unofficial workaround that alleviates the need for the second camera that you can find online, if you’d prefer to go that route. "\
"After that, you’ll need to figure out how to send the spymasters their keys at the start of every game. The quickest way may just be to message a picture to both players. Once you’ve solved those technical riddles, playing the game becomes pretty simple. You can even use the annotation tools in Zoom to tally up the “red” or “blue” agents as the game progresses.")

Photo.create!(likes: rand(0..100), game_id: game15.id, user_id: this.user_.id, caption: "Down to the wire!", image_url: "https://compote.slate.com/images/1ac25e00-3d2d-4ad9-aac5-2a2d7aa53d9a.jpeg?width=780&height=520&rect=1560x1040&offset=0x0")
Photo.create!(likes: rand(0..100), game_id: game15.id, user_id: User.all.sample.id, caption: "Rigging it up", image_url: "https://www.wikihow.com/images/thumb/e/e8/CodenamesZoomPhone1.jpg/460px-CodenamesZoomPhone1.jpg")
Photo.create!(likes: rand(0..100), game_id: game15.id, user_id: User.all.sample.id, caption: "Comeback starts now!", image_url: "https://miro.medium.com/max/5120/1*0wkDJmDBY40bGuCjky1ZLA.png")

game16 = Game.create!(title: "Pandemic", creator_id: User.all.sample.id, min_age: 8, min_num_players: 2, max_num_players: 4, image_url: "https://target.scene7.com/is/image/Target/GUEST_0313f621-d762-4e1d-9855-e32163314488?wid=488&hei=488&fmt=pjpeg",
description: "Pandemic online or on Zoom", link_to_game_website: "https://www.asmodee-digital.com/en/pandemic/", category: "Zoom or online boardgame", instructions_and_rules: "What you need to play: Zoom, either click the link to get the online version or use the regular Pandemic game and an extra camera to stream the board with some creative rigging equipment.")

Photo.create!(likes: rand(0..100), game_id: game16.id, user_id: User.all.sample.id, caption: "Thanks to Tom, made it work and saved the world!", image_url: "https://compote.slate.com/images/97b8a754-4c8c-4bba-86d8-92c43cad6bd6.jpeg?width=780&height=520&rect=1728x1152&offset=115x0")
Photo.create!(likes: rand(0..100), game_id: game16.id, user_id: User.all.sample.id, caption: "Just as good online as in person", image_url: "https://images.nintendolife.com/screenshots/98402/large.jpg")

puts "Game 16 and photos created"
game17 = Game.create!(title: "Ticket To Ride", creator_id: User.all.sample.id, min_age: 8, min_num_players: 2, max_num_players: 5, image_url: "https://images-na.ssl-images-amazon.com/images/I/81bLWZK-RNL._AC_SX679_.jpg",
description: "Ticket To Ride online or while on Zoom", link_to_game_website: "https://www.daysofwonder.com/online/en/t2r/", category: "Zoom or online boardgame", instructions_and_rules: "What you need to play: Zoom, either click the link to get the online version or use the regular Ticket To Ride game and an extra camera to stream the board with some creative rigging equipment.")

Photo.create!(likes: rand(0..100), game_id: game17.id, user_id: this_user.id, caption: "Losing our focus, but we got this!", image_url: "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/jjfi1r0p7bnzpn24li1z.jpg")
Photo.create!(likes: rand(0..100), game_id: game17.id, user_id: User.all.sample.id, caption: "Northern roads for the win!", image_url: "https://phandroid.com/wp-content/uploads/2013/06/ticket-to-ride-640x400.png")

game18 = Game.create!(title: "Words With Friends", creator_id: User.all.sample.id, min_age: 13, min_num_players: 2, max_num_players: 4, image_url: "https://i.ytimg.com/vi/V5d5rl1k_bw/hqdefault.jpg",
description: "Words With Friends through Facebook", link_to_game_website: "https://www.facebook.com/WordsWithFriends/", category: "Facebook boardgame", instructions_and_rules: "What you need to play: a Facebook account. Click the link to get started")

Photo.create!(likes: rand(0..100), game_id: game18.id, user_id: User.all.sample.id, caption: "Game on!", image_url: "https://cnet4.cbsistatic.com/img/3T0MUC3UKeA5FRpxsgvOHAigsmo=/940x0/2018/12/13/15fdb167-674f-4b6e-87a3-d7aa1ff192bb/portalplus-wwf-121218.jpg")

game19 = Game.create!(title: "Dominion", creator_id: User.all.sample.id, min_age: 13, min_num_players: 2, max_num_players: 4, image_url: "https://images-na.ssl-images-amazon.com/images/I/9152Ik8HZ5L._AC_SL1500_.jpg"
description: "Dominion online or on Zoom", link_to_game_website: "https://dominion.games/", category: "Zoom or online boardgame", instructions_and_rules: "What you need to play: Zoom, either click the link to get the online version or use the regular Dominion game and an extra camera to stream the board with some creative rigging equipment.")

Photo.create!(likes: rand(0..100), game_id: game19.id, user_id: User.all.sample.id, caption: "Siskel and Ebert gave me two thumbs up!", image_url: "https://masilotti.com/images/zoom-and-dominion.png")

game20 = Game.create!(title: "Settlers of Catan", creator_id: this.user.id, min_age: 10, min_num_players: 3, max_num_players: 4, image_url: "https://upload.wikimedia.org/wikipedia/en/a/a3/Catan-2015-boxart.jpg",
description: "Settlers of Catan online", link_to_game_website: "https://www.catanuniverse.com/", category: "Online boardgame", instructions_and_rules: "Click the link to get the online version. Can Zoom or Facetime your friends on a separate device to negotiate trades. It's easy to use once set up, but a pain to get started. To purchase the game, create an account."\
" Logging in will take you to the home page. To purchase the online game, click the icon on the top right corner. You will have to first buy 'Gold', then use that Gold to buy 'Expansions'")

Photo.create!(likes: rand(0..100), game_id: game20.id, user_id: User.all.sample.id, caption: "The game was over before it even begun, they just didn't now it yet", image_url: "https://i.insider.com/5e7a5261671de0466d70d443")
Photo.create!(likes: rand(0..100), game_id: game20.id, user_id: User.all.sample.id, caption: "Got wheat, looking for brick...how about sheep?", image_url: "https://i.insider.com/5e7a43f62d41c108fa457e61?width=1100&format=jpeg&auto=webp")
Photo.create!(likes: rand(0..100), game_id: game20.id, user_id: this_user.id, caption: "Get that ish off me!", image_url: "https://i.ytimg.com/vi/Yek6OXhCCg4/maxresdefault.jpg")
Photo.create!(likes: rand(0..100), game_id: game20.id, user_id: this_user.id, caption: "All of those 7's!", image_url: "https://i.imgur.com/4vvoXcd.jpg")
puts "All games and photos created"
100.times do 
    rating = rand(1..10)
    review_content = "This game had no redeeming qualities. I want my time back."
    if rating == 10 
        review_content = "Love this game. Want to play it again and again and again."
    elsif rating == 9
        review_content = "Was a big hit with my friends!"
    elsif rating == 8
        review_content = "Great experience for everyone. Highly recommend."
    elsif rating == 7
        review_content = "Had a lot of fun playing this game. Everyone was engaged, although we were a little confused by the instructions."
    elsif rating == 6
        review_content = "We liked playing this game. Wish there were more rounds."
    elsif rating == 5
        review_content = "Made friends into enemies. Not sure if that's a good or a bad thing."
    elsif rating == 4
        review_content = "Had some issues with the rules being a little unclear, but the game went alright."
    elsif rating == 3
        review_content = "Not sure. Didn't get much out of this one."
    elsif rating == 2
        review_content = "Meh..."
    end
    rating = (rating / 2).ceil
    user = User.all.sample
    game = Game.all.sample
    Review.create!(user_id: user.id, game_id: game.id, num_stars: rating, content: review_content)
end

puts "Reviews created. All set"



