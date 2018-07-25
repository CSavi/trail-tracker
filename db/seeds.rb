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

Trail.create! [
   { name: "Rock Creek", location: "Washington, DC", distance: "10", date: "June", notes: "Offers parking, metro-accessibility"},
   { name: "C&O Canal", location: "Washington, DC", distance: "22", date: "November", notes: "Popular biking and camping trail; offers great river views"},
   { name: "Bull Run Occoquan", location: "Manassas, VA", distance: "32", date: "May", notes: "Offers parking, waterfalls along trail"}
 ]
