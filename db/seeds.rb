user_hash = [
   {
    :username => "csavi",
    :password => "xx",
    :email => "carrielane@flatiron.com"
  }
]

user_hash.each do |user|
  t = User.create(user)
end


trails_list = {
  {
    "Rock Creek Park" => {
      :location => "Washington, DC",
      :distance => "10",
      :date => "June",
      :notes => "Offers parking, metro-accessibility"
    },
    "C&O Canal" => {
      :location => "Washington, DC",
      :distance => "22",
      :date => "November",
      :notes => "Popular biking and camping trail; offers great river views"
    },
    "Bull Run Occoquan" => {
      :location => "Manassas, VA",
      :distance => "32",
      :date => "May",
      :notes => "Offers parking, waterfalls along trail"
    }
  }

# trail_1 = Trail.create(name: "Bull Run", location: "Washington, DC", user: "csavi", distance: "10")
# trail_1.save
# trail_2 = Trail.create(name: "C&O Canal", location: "Manassas, VA", user: "csavi", distance: "22")
# trail_2.save

trails_list.each do |name, trail_hash|
  t = Trail.new
  t.name = name
  trail_hash.each do |attribute, value|
      t[attribute] = value
  end
  t.save
end
