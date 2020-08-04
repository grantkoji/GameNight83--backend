# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GameHost.delete_all
Game.delete_all
User.delete_all
Friendship.delete_all

user1 = User.create(name: "Joe")
user2 = User.create(name: "Kevin")
f1 = Friendship.create(user_id: 1, friend_id: 2)
Game.create(title: "C Poker", creator_id: 1)
gh1 = GameHost.create(host_id: 2, game_id: 1)