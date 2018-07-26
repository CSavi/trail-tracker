csavi = User.create(username: "csavi", email: "carrielane@flatiron.com", password: "xx")
trail = Trail.create(name: "C&O Canal", location: "Washington, DC", distance: "22", date: "November", notes: "Popular biking and camping trail; offers great river views")
trail.user = csavi


joejoe = User.create(username: "joejoe", email: "joejoe@test.com", password: "xx")
trail = Trail.create(name: "Rock Creek Trail", location: "Largo, MD", distance: "10", date: "June", notes: "Metro-accessibility")
trail.user = joejoe
