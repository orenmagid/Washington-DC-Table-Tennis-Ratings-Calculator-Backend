# # # This file should contain all the record creation needed to seed the database with its default values.
# # # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# # #
# # # Examples:
# # #
# # #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# # #   Character.create(name: 'Luke', movie: movies.first)

# wednesday_group = Group.create(name: "Wednesday Group", day_of_week: 3)
# thursday_group = Group.create(name: "Thursday Group", day_of_week: 4)
# sunday_group = Group.create(name: "Sunday Group", day_of_week: 0)

# session_one = Session.create(date: Time.new(2020, 10, 13, 19, 00, 00))
# session_two = Session.create(date: Time.new(2020, 10, 20, 19, 00, 00))
# session_three = Session.create(date: Time.new(2020, 10, 27, 19, 00, 00))

# wednesday_group.sessions.push(session_one, session_two)

# khaleel = Player.create_with_rating_and_group(name: "Khaleel Asgarali", email: "asgarali.wdctt@gmail.com", rating: 2500, group_id: nil, admin: false, username: "khaleel", password: "khaleelpw1234", hide: true)
# # sunday_group.players.push(khaleel)
# # thursday_group.players.push(khaleel)

# oren = Player.create_with_rating_and_group(name: "Oren Magid", email: "oren.michael.magid@gmail.com", rating: 1098, group_id: wednesday_group.id, admin: true, username: "oren", password: "orenpw1234")
# sunday_group.players.push(oren)
# john = Player.create_with_rating_and_group(name: "John Harrison", email: "harrison.john@plsystems.net", rating: 1128, group_id: wednesday_group.id, admin: false, username: "john", password: "johnpw1234")
# ben = Player.create_with_rating_and_group(name: "Ben Nix", email: "marlanix@hotmail.com", rating: 800, group_id: wednesday_group.id, admin: false, username: "ben", password: "benpw1234")
# moses = Player.create_with_rating_and_group(name: "Moses Kitakule", email: "moseskitakule@gmail.com", rating: 902, group_id: wednesday_group.id, admin: false, username: "moses", password: "mosespw1234")
# ted = Player.create_with_rating_and_group(name: "Ted Udelson", email: "tedU@IntegrityComputing.com", rating: 1052, group_id: wednesday_group.id, admin: false, username: "ted", password: "tedpw1234")
# zack = Player.create_with_rating_and_group(name: "Zack Lessner", email: "lessnerzachary@gmail.com", rating: 1181, group_id: wednesday_group.id, admin: false, username: "zack", password: "zackpw1234")
# wondu = Player.create_with_rating_and_group(name: "Wondwosen Shiferaw", email: "wshiferaw82@gmail.com", rating: 1212, group_id: wednesday_group.id, admin: false, username: "wondu", password: "wondupw1234")
# jeremie = Player.create_with_rating_and_group(name: "Jeremie Auboux", email: "jeremie.aubou@gmail.com", rating: 1238, group_id: wednesday_group.id, admin: false, username: "jeremie", password: "jeremiepw1234")
# abhi = Player.create_with_rating_and_group(name: "Abhi Pabba", email: "abhipabba@yahoo.com", rating: 1428, group_id: wednesday_group.id, admin: false, username: "abhi", password: "abhipw1234")

# kodi = Player.create_with_rating_and_group(name: "Kodi Bhaskar Kottaidurai", email: "kodibhaskark@gmail.com", rating: 1272, group_id: sunday_group.id, admin: false, username: "kodi", password: "kodipw1234")
# michael = Player.create_with_rating_and_group(name: "Michael LaGiglia", email: "mal3rd@hotmail.com", rating: 1410, group_id: sunday_group.id, admin: false, username: "michael", password: "michaelpw1234")
# barry = Player.create_with_rating_and_group(name: "Barry Dancis", email: "dancishome@gmail.com", rating: 1398, group_id: sunday_group.id, admin: false, username: "barry", password: "barrypw1234")
# jason = Player.create_with_rating_and_group(name: "Jason Miranda", email: "jason.miranda102@gmail.com", rating: 1500, group_id: sunday_group.id, admin: false, username: "jason", password: "jasonpw1234")
# mike = Player.create_with_rating_and_group(name: "Mike Cohen", email: "mcohen@nas.edu", rating: 1578, group_id: sunday_group.id, admin: false, username: "mike", password: "mikepw1234")
# aaron_z = Player.create_with_rating_and_group(name: "Aaron Zhang", email: "zhangqy1@yahoo.com", rating: 1580, group_id: sunday_group.id, admin: false, username: "aaron", password: "aaronpw1234")
# chan = Player.create_with_rating_and_group(name: "Chandler Williamson", email: "chandler.williamson23@gmail.com", rating: 1600, group_id: sunday_group.id, admin: false, username: "chand", password: "chandpw1234")
# aaron_t = Player.create_with_rating_and_group(name: "Aaron Thaul", email: "aaron.thaul@gmail.com", rating: 1613, group_id: sunday_group.id, admin: false, username: "arron_t", password: "arron_tpw1234")
# emily = Player.create_with_rating_and_group(name: "Emily Wade", email: "wadesports@verizon.net", rating: 1300, group_id: sunday_group.id, admin: false, username: "emily", password: "emilypw1234")
# darryl = Player.create_with_rating_and_group(name: "Darryl Hill", email: "", rating: 1800, group_id: sunday_group.id, admin: false, username: "darryl", password: "darrylpw1234")

# franklin = Player.create_with_rating_and_group(name: "Franklin Cao", email: "frankcao121@yahoo.com", rating: 1570, group_id: thursday_group.id, admin: false, username: "franklinn", password: "franklinnpw1234")
# nick = Player.create_with_rating_and_group(name: "Nick Enz", email: "enz.nick@gmail.com", rating: 1767, group_id: thursday_group.id, admin: false, username: "nick", password: "nickpw1234")
# marsay = Player.create_with_rating_and_group(name: "Marsay Bach", email: "bachi88@gmail.com", rating: 1763, group_id: thursday_group.id, admin: false, username: "marsay", password: "marsaypw1234")
# mike_c = Player.create_with_rating_and_group(name: "Mike Clarke", email: "maicel@aol.com", rating: 1800, group_id: thursday_group.id, admin: false, username: "mike_c", password: "mike_cpw1234")
# aman = Player.create_with_rating_and_group(name: "Aman Rai", email: "amanrai0496@gmail.com", rating: 1906, group_id: thursday_group.id, admin: false, username: "aman", password: "amanpw1234")
# emin = Player.create_with_rating_and_group(name: "Emin Dinlersoz", email: "edinlersoz@gmail.com", rating: 1917, group_id: thursday_group.id, admin: false, username: "emin", password: "eminpw1234")
# wei = Player.create_with_rating_and_group(name: "Wei Zhang", email: "helloshallwetalk820@gmail.com", rating: 1968, group_id: thursday_group.id, admin: false, username: "wei", password: "weipw1234")

# club_ratings = [
#   ["Ray Xu", 2291],
#   ["Julien Borgne", 2205],
#   ["Thomas Sampson", 2031],
#   ["Thomas Olausson", 1974],
#   ["Danny Wan", 1966],
#   ["Chris St, Louis", 1939],
#   ["Ronald Yu", 1908],
#   ["Harshal Sharma", 1902],
#   ["Sebastian Simon", 1884],
#   ["Kent Wegner", 1864],
#   ["Mossa Barandao", 1855],
#   ["Gordon Smith", 1851],
#   ["Pourab Roy", 1840],
#   ["Arnd Plagge", 1837],
#   ["Daniel Medina", 1754],
#   ["Nate Dickstein", 1729],
#   ["Yunhu Wan", 1705],
#   ["Pedro Atekha", 1694],
#   ["Thierry Vilboux", 1693],
#   ["Ziggy Fish", 1675],
#   ["Kodi Vonderao", 1640],
#   ["Oscar Rodriguez", 1639],
#   ["Jon H", 1630],
#   ["Alex Lee", 1611],
#   ["Jozef Simkovic", 1606],
#   ["Derwin Mercer", 1601],
#   ["Naeem M", 1592],
#   ["Chris Lee", 1578],
#   ["Ian G", 1572],
#   ["Bennett Sherr", 1540],
#   ["Lorenzo Rodriquez", 1482],
#   ["Eyi Whan Yoon", 1482],
#   ["Jonathan Gehrkin", 1481],
#   ["Charles Gourdine", 1473],
#   ["Armen Kankanian", 1465],
#   ["Laura Boy", 1457],
#   ["Bernadette St. Clair", 1457],
#   ["Tom Carothers", 1437],
#   ["Richard Cho", 1420],
#   ["Amr Morsy", 1399],
#   ["Brett Hanna", 1392],
#   ["Chawisa Khankamsun", 1376],
#   ["Jason Hall", 1371],
#   ["Pelle Deinoff", 1340],
#   ["David Selman", 1329],
#   ["Long Ngauy", 1323],
#   ["Casey Harless", 1312],
#   ["Chris Smith", 1311],
#   ["Jim Wilson", 1306],
#   ["Lenny Becraft", 1303],
#   ["Chris Hanna", 1293],
#   ["Dejan Zivanavic", 1290],
#   ["Jasmine Lennert", 1275],
#   ["Andrew Twigg", 1271],
#   ["Larry JohnTonssaint", 1262],
#   ["MO Maraqa", 1250],
#   ["Priyent Sondes", 1246],
#   ["Yash Kapoor", 1211],
#   ["Trimane Goddard", 1210],
#   ["Peter Smith", 1197],
#   ["Peter Jin", 1183],
#   ["Joshua Doyle", 1171],
#   ["Ram Chidurala", 1149],
#   ["Vijay", 1145],
#   ["Stephanie Nelson", 1138],
#   ["JC Matos", 1133],
#   ["Alex Spancake", 1133],
#   ["Julian Cho", 1131],
#   ["Mike Baeilashak", 1128],
#   ["Satish Bommarajupef", 1126],
#   ["Charles Moreland", 1110],
#   ["Prince Junior", 1107],
#   ["Shalon Lason", 1100],
#   ["Wilbur Portalatia", 1096],
#   ["Jason Alexander", 1091],
#   ["Paul Newman", 1085],
#   ["Peter Willenburg", 1060],
#   ["Shahin S", 1051],
#   ["Gassan B", 1048],
#   ["Isaac Newman", 1045],
#   ["Sarah Jiang", 1042],
#   ["Steve Glick", 1032],
#   ["Mitchel Geer", 1029],
#   ["Mak Gadreg", 1021],
#   ["Caleb Driker", 1014],
#   ["Endri Mustafa", 1009],
#   ["Joshua O", 1008],
#   ["John Grunwell", 988],
#   ["Max Meyes", 979],
#   ["Boray Efecar", 964],
#   ["Myong Hee Yoon", 950],
#   ["Marit Vike", 945],
#   ["AJ Zamoni", 944],
#   ["Marina Temkin", 936],
#   ["Yupeng Yang", 936],
#   ["Jenny Yang", 929],
#   ["Parsa Heydopour", 899],
#   ["Kate Watkins", 886],
#   ["Bill Ballard", 885],
#   ["Taylor Durbin", 835],
#   ["Jorma Cavaleri", 831],
#   ["Victoria Lundy", 802],
#   ["Chris Elrod", 799],
#   ["Linda", 798],
#   ["Zoran Jakovac", 791],
#   ["JD Cavaleri", 776],
# ]

# club_ratings.each_with_index do |player, i|
#   Player.create_with_rating_and_group(name: player[0], rating: player[1], username: "wdctt_user_#{i}", password: "wdctt_user_#{player[1]}")
# end

# armen = Player.find_by(name: "Armen Kankanian")
# armen.email = "armen11@verizon.net"
# sunday_group = Group.find_by(name: "Sunday Group")
# armen.groups.push(sunday_group)
# armen.save

# jc = Player.find_by(name: "JC Matos")
# jc.email = "jancarlo.matos@gmail.com"
# sunday_group = Group.find_by(name: "Tuesday Group")
# jc.groups.push(sunday_group)
# jc.save

# Player.create_with_rating_and_group(name: "Chris Evans", rating: 1500, username: "chris_evans", password: "chris_evanspw1234", group_id: 1)

# Player.create_with_rating_and_group(name: "Fon", rating: 1350, username: "fon", password: "fonpw1234", group_id: 1)

# # Necessary for the refactoring
# Stage.create(description: "Indicate the days you would like to play. You may choose a maximum of two days for which your rating makes you elligible.")
# Stage.create(description: "Groups are being formed based on responses to this form. You will be notified of groups soon.")

# most_recent_signup_form = SignupForm.last

# sunday_above_1400_session = RecurringSession.find(3)
# tuesday_below_1500_session = RecurringSession.find(1)
# wednesday_1200_through_1600_session = RecurringSession.find(4)
# thursday_above_1500_session = RecurringSession.find(2)
# saturday_below_1300_session = RecurringSession.find(5)

# sunday_players = Player.joins(:ratings).where("ratings.value >= ?", 1400)
# tuesday_players = Player.joins(:ratings).where("ratings.value <= ?", 1500)
# wednesday_players = Player.joins(:ratings).where("ratings.value >= ?", 1200).where("ratings.value <= ?", 1600)
# thursday_players = Player.joins(:ratings).where("ratings.value >= ?", 1500)
# saturday_players = Player.joins(:ratings).where("ratings.value <= ?", 1300)


