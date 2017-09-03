
User.create(username: "Guest", email: "guest@guest.com", password: "password", password_confirmation: "password", height: 72, height_unit: "inches")

Entry.create(user: User.find_by(username: "Guest"), weight: 300.0, weight_unit: "lbs.", entry_date: "2017-03-10")





team = Team.create(name: "The Maddi Monsters", captain: User.find_by(username: "izzlebeast"))

team.members << User.find_by(username: "izzlebeast")
team.members << User.find_by(username: "AmandaH")
team.save