require_relative'../models/student.rb'
require_relative'../models/house.rb'

require 'pry'

Student.delete_all
House.delete_all


  house1 = House.new({
    'name' => 'Gryffindor',
    'logo' => 'https://vignette3.wikia.nocookie.net/harrypotter/images/9/96/Gryffindor_crest_by_tuliipiie-d491bqc.jpg/revision/latest?cb=20130508231701'
  })

  house2 = House.new({
    'name' => 'Slytherin',
    'logo' => 'https://i.pinimg.com/736x/32/08/15/3208154ffc69c822738f721de789e830--slytherin-house-hogwarts-houses.jpg'
  })

  house3 = House.new({
    'name' => 'Ravenclaw',
    'logo' =>  'https://i.pinimg.com/736x/39/ff/53/39ff538ca68161bfcd6df3c2de9135a1--ravenclaw-logo-machine-embroidery-designs.jpg'
  })

  house4 = House.new({
    'name' => 'Hufflepuff',
    'logo' => 'http://vignette3.wikia.nocookie.net/es.harrypotter/images/3/30/Logo_Hufflepuff_2.png/revision/latest?cb=20160417160852'
  })



house1.save
house2.save
house3.save
house4.save


student1 = Student.new({
  'first_name' => "Harry",
  'second_name' => "Potter",
  'house_id' => house1.id,
  'age' => 22,
  })

student2 = Student.new({
  'first_name' => "Ron",
  'second_name' => "Weasley",
  'house_id' =>  house2.id,
  'age' => 234,
  })

  student1.save
  student2.save


  binding.pry


  nil
