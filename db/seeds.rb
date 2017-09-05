
User.create(username: "Guest", email: "guest@guest.com", password: "password", password_confirmation: "password", height: 72, height_unit: "inches", gender: "male")

guest_entries = {
  "2016-04-10" => 300.2,
  "2016-05-15" => 294.1,
  "2016-06-07" => 289.9,
  "2016-06-17" => 287.3,
  "2016-07-10" => 282.0,
  "2016-08-03" => 278.2,
  "2016-09-05" => 277.9,
  "2016-09-13" => 273.6,
  "2016-09-24" => 268.4,
  "2016-10-10" => 265.3,
  "2016-10-28" => 267.1,
  "2016-11-02" => 262.7,
  "2016-11-10" => 257.4,
  "2016-11-30" => 257.0,
  "2016-12-10" => 250.0,
  "2016-12-23" => 244.8,
  "2017-01-01" => 245.0,
  "2017-01-02" => 243.3,
  "2017-01-03" => 242.9,
  "2017-01-10" => 240.7,
  "2017-02-07" => 235.2,
  "2017-02-16" => 233.1,
  "2017-03-03" => 228.3,
  "2017-03-12" => 229.6,
  "2017-03-28" => 224.3,
  "2017-04-09" => 220.6,
  "2017-04-14" => 218.8,
  "2017-05-02" => 213.2,
  "2017-05-10" => 211.9,
  "2017-06-02" => 205.1,
  "2017-06-11" => 203.3,
  "2017-06-19" => 202.9,
  "2017-07-01" => 199.2,
  "2017-07-05" => 198.5,
  "2017-07-18" => 195.3,
  "2017-08-02" => 191.2,
  "2017-08-25" => 186.8,
  "2017-09-03" => 184.9
}

guest_entries.each do |date, weight|
  current_entry = Entry.create(user: User.find_by(username: "Guest"), weight: weight, weight_unit: "lbs.", entry_date: date)
  current_entry.average_weight = current_entry.calculate_average_weight
  current_entry.save
end

guest_heats = {
  "2016-04-10" => 10.0,
  "2016-07-10" => 10.5,
  "2016-08-03" => 11.5,
  "2016-09-05" => 11,
  "2016-09-24" => 12,
  "2016-10-10" => 13,
  "2016-11-02" => 13.5,
  "2016-11-10" => 12.5,
  "2016-12-23" => 14,
  "2017-01-03" => 14.5,
  "2017-02-07" => 14,
  "2017-03-03" => 16,
  "2017-03-12" => 16.5,
  "2017-04-14" => 18,
  "2017-05-02" => 18.5,
  "2017-06-11" => 19,
  "2017-07-01" => 18,
  "2017-07-05" => 19,
  "2017-08-02" => 20,
  "2017-09-03" => 23
}

guest_heats.each do |date, count|
  current_heat = Heat.create(user: User.find_by(username: "Guest"), pushup_type: "toe", length: 30, count: count, entry_date: date)
  current_heat.average_count = current_heat.calculate_average_count
  current_heat.save
end

guest_levels = [
  "2016-04-10",
  "2016-07-10",
  "2016-08-03",
  "2016-09-05",
  "2016-09-24",
  "2016-10-10",
  "2016-11-02",
  "2016-11-10",
  "2016-12-23",
  "2017-01-03",
  "2017-02-07",
  "2017-03-03",
  "2017-03-12",
  "2017-04-14",
  "2017-05-02",
  "2017-06-11",
  "2017-07-01",
  "2017-07-05",
  "2017-08-02",
  "2017-09-03"
]

guest_levels.each do |date|
  current_level = PowerLevel.new(user: User.find_by(username: "Guest"), entry_date: date)
  current_level.level = current_level.calculate_level
  current_level.save
  current_level.average_level = current_level.calculate_average_level
  current_level.save
end
