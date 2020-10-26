# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tuesday_group = Group.create(name: "Tuesday Group", day_of_week: 2)
thursday_group = Group.create(name: "Thursday Group", day_of_week: 4)
sunday_group = Group.create(name: "Sunday Group", day_of_week: 0)

session_one = Session.create(date: Time.new(2020, 10, 13, 19, 00, 00))
session_two = Session.create(date: Time.new(2020, 10, 20, 19, 00, 00))
session_three = Session.create(date: Time.new(2020, 10, 27, 19, 00, 00))

tuesday_group.sessions.push(session_one, session_two, session_three)

khaleel = Player.create_with_rating_and_group(name: "Khaleel Asgarali", email: "asgarali.wdctt@gmail.com", rating: 2500, group_id: tuesday_group.id, admin: true, username: "khaleel", password: "khaleelpw1234")
sunday_group.players.push(khaleel)
thursday_group.players.push(khaleel)

oren = Player.create_with_rating_and_group(name: "Oren Magid", email: "oren.michael.magid@gmail.com", rating: 1158, group_id: tuesday_group.id, admin: true, username: "oren", password: "orenpw1234")
sunday_group.players.push(oren)
john = Player.create_with_rating_and_group(name: "John Harrison", email: "harrison.john@plsystems.net", rating: 1128, group_id: tuesday_group.id, admin: true, username: "john", password: "johnpw1234")
ben = Player.create_with_rating_and_group(name: "Ben Nix", email: "marlanix@hotmail.com", rating: 800, group_id: tuesday_group.id, admin: true, username: "ben", password: "benpw1234")
moses = Player.create_with_rating_and_group(name: "Moses Kitakule", email: "moseskitakule@gmail.com", rating: 912, group_id: tuesday_group.id, admin: true, username: "moses", password: "mosespw1234")
ted = Player.create_with_rating_and_group(name: "Ted Udelson", email: "tedU@IntegrityComputing.com", rating: 736, group_id: tuesday_group.id, admin: true, username: "ted", password: "tedpw1234")
zack = Player.create_with_rating_and_group(name: "Zack Lessner", email: "lessnerzachary@gmail.com", rating: 1100, group_id: tuesday_group.id, admin: true, username: "zack", password: "zackpw1234")
wondu = Player.create_with_rating_and_group(name: "Wondwosen Shiferaw", email: "wshiferaw82@gmail.com", rating: 1239, group_id: tuesday_group.id, admin: true, username: "wondu", password: "wondupw1234")
jeremie = Player.create_with_rating_and_group(name: "Jeremie Auboux", email: "jeremie.aubou@gmail.com", rating: 1300, group_id: tuesday_group.id, admin: true, username: "jeremie", password: "jeremiepw1234")
abhi = Player.create_with_rating_and_group(name: "Abhi Pabba", email: "abhipabba@yahoo.com", rating: 1450, group_id: tuesday_group.id, admin: true, username: "abhi", password: "abhipw1234")

kodi = Player.create_with_rating_and_group(name: "Kodi Bhaskar Kottaidurai", email: "kodibhaskark@gmail.com", rating: 1330, group_id: sunday_group.id, admin: true, username: "kodi", password: "kodipw1234")
michael = Player.create_with_rating_and_group(name: "Michael LaGiglia", email: "mal3rd@hotmail.com", rating: 1375, group_id: sunday_group.id, admin: true, username: "michael", password: "michaelpw1234")
barry = Player.create_with_rating_and_group(name: "Barry Dancisa", email: "dancishome@gmail.com", rating: 1375, group_id: sunday_group.id, admin: true, username: "barry", password: "barrypw1234")
jason = Player.create_with_rating_and_group(name: "Jason Miranda", email: "jason.miranda102@gmail.com", rating: 1500, group_id: sunday_group.id, admin: true, username: "jason", password: "jasonpw1234")
mike = Player.create_with_rating_and_group(name: "Mike Cohen", email: "mcohen@nas.edu", rating: 1500, group_id: sunday_group.id, admin: true, username: "mike", password: "mikepw1234")
aaron_z = Player.create_with_rating_and_group(name: "Aaron Zhang", email: "zhangqy1@yahoo.com", rating: 1580, group_id: sunday_group.id, admin: true, username: "aaron", password: "aaronpw1234")
chan = Player.create_with_rating_and_group(name: "Chandler Williamson", email: "chandler.williamson23@gmail.com", rating: 1600, group_id: sunday_group.id, admin: true, username: "chand", password: "chandpw1234")
aaron_t = Player.create_with_rating_and_group(name: "Aaron Thaul", email: "aaron.thaul@gmail.com", rating: 1650, group_id: sunday_group.id, admin: true, username: "arron_t", password: "arron_tpw1234")

franklin = Player.create_with_rating_and_group(name: "Franklin Cao", email: "frankcao121@yahoo.com", rating: 1700, group_id: thursday_group.id, admin: true, username: "franklinn", password: "franklinnpw1234")
nick = Player.create_with_rating_and_group(name: "Nick Enz", email: "enz.nick@gmail.com", rating: 1750, group_id: thursday_group.id, admin: true, username: "nick", password: "nickpw1234")
marsay = Player.create_with_rating_and_group(name: "Marsay Bach", email: "bachi88@gmail.com", rating: 1750, group_id: thursday_group.id, admin: true, username: "marsay", password: "marsaypw1234")
mike_c = Player.create_with_rating_and_group(name: "Mike Clarke", email: "maicel@aol.com", rating: 1800, group_id: thursday_group.id, admin: true, username: "mike_c", password: "mike_cpw1234")
aman = Player.create_with_rating_and_group(name: "Aman Rai", email: "amanrai0496@gmail.com", rating: 1850, group_id: thursday_group.id, admin: true, username: "aman", password: "amanpw1234")
emin = Player.create_with_rating_and_group(name: "Emin Dinlersoz", email: "edinlersoz@gmail.com", rating: 1970, group_id: thursday_group.id, admin: true, username: "emin", password: "eminpw1234")
wei = Player.create_with_rating_and_group(name: "Wei Zhang", email: "helloshallwetalk820@gmail.com", rating: 2087, group_id: thursday_group.id, admin: true, username: "wei", password: "weipw1234")

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

# puts("********************************** Session Three: #{session_three.date.strftime("%m/%d/%Y, %I:%M %p")} **********************************")
# puts("***************** Starting Ratings *****************")
# tuesday_group.log_ratings
# session_three.calculate_ratings
# puts("\n" * 3)
# puts("***************** Ending Ratings *****************")
# session_three.log_ratings
# puts("\n" * 6)
