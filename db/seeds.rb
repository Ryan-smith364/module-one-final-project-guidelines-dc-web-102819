Golfer.destroy_all
Course.destroy_all
Rating.destroy_all
Location.destroy_all

golfer1 = Golfer.create(name: 'Joe')
golfer2 = Golfer.create(name: 'Rebecca')
golfer3 = Golfer.create(name: 'Steven')
golfer4 = Golfer.create(name: 'Gary')
golfer5 = Golfer.create(name: 'Karen')
golfer6 = Golfer.create(name: 'Frank')
golfer7 = Golfer.create(name: 'Tiger')

course1 = Course.create(name: "Breton Bay", difficulty: 5)
course2 = Course.create(name: "Wicomico Shores", difficulty: 1)
course3 = Course.create(name: "White Plains", difficulty: 3)
course4 = Course.create(name: "Lake Presidential", difficulty: 6)
course5 = Course.create(name: "Swan Point", difficulty: 4)
course6 = Course.create(name: "Mellomar", difficulty: 2)

Rating.create(golfer_id: golfer2.id, course_id: course4.id, review: " Perfect course and, good service ", rating: 5)
Rating.create(golfer_id: golfer1.id, course_id: course1.id, review: " Could be better ", rating: 2)
Rating.create(golfer_id: golfer4.id, course_id: course2.id, review: " Pace was slow, experience could've been better ", rating: 3)
Rating.create(golfer_id: golfer5.id, course_id: course6.id, review: " Amazing Staff", rating: 5)
Rating.create(golfer_id: golfer3.id, course_id: course3.id, review: " meh ", rating: 2)
Rating.create(golfer_id: golfer1.id, course_id: course4.id, review: " I played good here ", rating: 4)
Rating.create(golfer_id: golfer7.id, course_id: course5.id, review: " Best course ive been to", rating: 5)

Location.create(city: "Leonard Town" ,zip: "20650" ,course_id: course1.id )
Location.create(city: "Mechanicsville" ,zip: "20659" ,course_id: course2.id)
Location.create(city: "White Plains" ,zip: "20695" ,course_id: course3.id)
Location.create(city: "Upper Marlboro" ,zip: "20774" ,course_id: course4.id)
Location.create(city: "Issue" ,zip: "20645" ,course_id: course5.id)
Location.create(city: "Owings" ,zip: "20736" ,course_id: course6.id)