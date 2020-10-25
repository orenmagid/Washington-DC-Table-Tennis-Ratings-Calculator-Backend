# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tuesday_group = Group.create(name: "Tuesday Group")

session_one = Session.create(date: Time.new(2020, 10, 13, 19, 00, 00))
session_two = Session.create(date: Time.new(2020, 10, 20, 19, 00, 00))
session_three = Session.create(date: Time.new(2020, 10, 27, 19, 00, 00))

tuesday_group.sessions.push(session_one, session_two, session_three)

players = [
  oren = Player.create(name: "Oren Magid", email: "oren.michael.magid@gmail.com"),
  john = Player.create(name: "John Harrison", email: "harrison.john@plsystems.net"),
  ben = Player.create(name: "Ben Nix", email: "marlanix @hotmail.com"),
  moses = Player.create(name: "Moses Kitakule", email: "moseskitakule @gmail.com"),
  ted = Player.create(name: "Ted Udelson", email: "TedU @IntegrityComputing.com"),
  zack = Player.create(name: "Zack Lessner", email: "lessnerzachary @gmail.com"),
  wondu = Player.create(name: "Wondwosen Shiferaw", email: "wshiferaw82 @gmail.com"),
  jeremie = Player.create(name: "Jeremie Auboux", email: "jeremie.auboux @gmail.com"),
  abhi = Player.create(name: "Abhi Pabba", email: "abhipabba @yahoo.com"),
]

starting_ratings = [
  oren_rating = Rating.create(value: 1158, player_id: oren.id, session_id: nil),
  john_rating = Rating.create(value: 1128, player_id: john.id, session_id: nil),
  ben_rating = Rating.create(value: 800, player_id: ben.id, session_id: nil),
  moses_rating = Rating.create(value: 912, player_id: moses.id, session_id: nil),
  ted_rating = Rating.create(value: 736, player_id: ted.id, session_id: nil),
  zack_rating = Rating.create(value: 1100, player_id: zack.id, session_id: nil),
  wondu_rating = Rating.create(value: 1239, player_id: wondu.id, session_id: nil),
  jeremie_rating = Rating.create(value: 1300, player_id: jeremie.id, session_id: nil),
  abhi_rating = Rating.create(value: 1450, player_id: abhi.id, session_id: nil),
]

players.each_with_index do |player, index|
  tuesday_group.players.push(player)
end

# Session One Matches
oren_vs_zack_match = Match.create(session_id: session_one.id)
oren_vs_zack_match.players.push(oren, zack)
oren_vs_zack_match.winner_id = oren.id
oren_vs_zack_match.save

oren_vs_zack_match = Match.create(session_id: session_one.id)
oren_vs_zack_match.players.push(oren, zack)
oren_vs_zack_match.winner_id = oren.id
oren_vs_zack_match.save

oren_vs_wondu_match = Match.create(session_id: session_one.id)
oren_vs_wondu_match.players.push(oren, wondu)
oren_vs_wondu_match.winner_id = oren.id
oren_vs_wondu_match.save

oren_vs_wondu_match = Match.create(session_id: session_one.id)
oren_vs_wondu_match.players.push(oren, wondu)
oren_vs_wondu_match.winner_id = wondu.id
oren_vs_wondu_match.save

puts("\n" * 6)
puts("********************************** Session One: #{session_one.date.strftime("%d/%m/%Y, %I:%M %p")} **********************************")
puts("***************** Starting Ratings *****************")
tuesday_group.log_ratings
session_one.calculate_ratings
puts("\n" * 3)
puts("***************** Ending Ratings *****************")
session_one.log_ratings
puts("\n" * 3)

# Session Two Matches

oren_vs_john_match = Match.create(session_id: session_two.id)
oren_vs_john_match.players.push(oren, john)
oren_vs_john_match.winner_id = oren.id
oren_vs_john_match.save

oren_vs_ben_match = Match.create(session_id: session_two.id)
oren_vs_ben_match.players.push(oren, ben)
oren_vs_ben_match.winner_id = oren.id
oren_vs_ben_match.save

oren_vs_ted_match = Match.create(session_id: session_two.id)
oren_vs_ted_match.players.push(oren, ted)
oren_vs_ted_match.winner_id = oren.id
oren_vs_ted_match.save

oren_vs_wondu_match = Match.create(session_id: session_two.id)
oren_vs_wondu_match.players.push(oren, wondu)
oren_vs_wondu_match.winner_id = wondu.id
oren_vs_wondu_match.save

oren_vs_abhi_match = Match.create(session_id: session_two.id)
oren_vs_abhi_match.players.push(oren, abhi)
oren_vs_abhi_match.winner_id = oren.id
oren_vs_abhi_match.save

john_vs_ben_match = Match.create(session_id: session_two.id)
john_vs_ben_match.players.push(john, ben)
john_vs_ben_match.winner_id = ben.id
john_vs_ben_match.save

john_vs_ted_match = Match.create(session_id: session_two.id)
john_vs_ted_match.players.push(john, ted)
john_vs_ted_match.winner_id = john.id
john_vs_ted_match.save

john_vs_wondu_match = Match.create(session_id: session_two.id)
john_vs_wondu_match.players.push(john, wondu)
john_vs_wondu_match.winner_id = wondu.id
john_vs_wondu_match.save

john_vs_abhi_match = Match.create(session_id: session_two.id)
john_vs_abhi_match.players.push(john, abhi)
john_vs_abhi_match.winner_id = abhi.id
john_vs_abhi_match.save

ben_vs_ted_match = Match.create(session_id: session_two.id)
ben_vs_ted_match.players.push(ben, ted)
ben_vs_ted_match.winner_id = ben.id
ben_vs_ted_match.save

ben_vs_wondu_match = Match.create(session_id: session_two.id)
ben_vs_wondu_match.players.push(ben, wondu)
ben_vs_wondu_match.winner_id = wondu.id
ben_vs_wondu_match.save

ben_vs_abhi_match = Match.create(session_id: session_two.id)
ben_vs_abhi_match.players.push(ben, abhi)
ben_vs_abhi_match.winner_id = abhi.id
ben_vs_abhi_match.save

ted_vs_wondu_match = Match.create(session_id: session_two.id)
ted_vs_wondu_match.players.push(ted, wondu)
ted_vs_wondu_match.winner_id = wondu.id
ted_vs_wondu_match.save

ted_vs_abhi_match = Match.create(session_id: session_two.id)
ted_vs_abhi_match.players.push(ted, abhi)
ted_vs_abhi_match.winner_id = abhi.id
ted_vs_abhi_match.save

wondu_vs_abhi_match = Match.create(session_id: session_two.id)
wondu_vs_abhi_match.players.push(wondu, abhi)
wondu_vs_abhi_match.winner_id = abhi.id
wondu_vs_abhi_match.save

puts("********************************** Session Two: #{session_two.date.strftime("%m/%d/%Y, %I:%M %p")} **********************************")
puts("***************** Starting Ratings *****************")
tuesday_group.log_ratings
session_two.calculate_ratings
puts("\n" * 3)
puts("***************** Ending Ratings *****************")
session_two.log_ratings
puts("\n" * 6)

oren_vs_john_match = Match.create(session_id: session_three.id)
oren_vs_john_match.players.push(oren, john)
oren_vs_john_match.winner_id = oren.id
oren_vs_john_match.save

oren_vs_wondu_match = Match.create(session_id: session_three.id)
oren_vs_wondu_match.players.push(oren, wondu)
oren_vs_wondu_match.winner_id = oren.id
oren_vs_wondu_match.save

oren_vs_abhi_match = Match.create(session_id: session_three.id)
oren_vs_abhi_match.players.push(oren, abhi)
oren_vs_abhi_match.winner_id = oren.id
oren_vs_abhi_match.save

oren_vs_jeremie_match = Match.create(session_id: session_three.id)
oren_vs_jeremie_match.players.push(oren, jeremie)
oren_vs_jeremie_match.winner_id = oren.id
oren_vs_jeremie_match.save

oren_vs_zack_match = Match.create(session_id: session_three.id)
oren_vs_zack_match.players.push(oren, zack)
oren_vs_zack_match.winner_id = oren.id
oren_vs_zack_match.save

puts("********************************** Session Two: #{session_three.date.strftime("%m/%d/%Y, %I:%M %p")} **********************************")
puts("***************** Starting Ratings *****************")
tuesday_group.log_ratings
session_three.calculate_ratings
puts("\n" * 3)
puts("***************** Ending Ratings *****************")
session_three.log_ratings
puts("\n" * 6)
