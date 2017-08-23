require_relative'../models/student.rb'
require 'pry'

student1 = Student.new({
  'first_name' => "Harry",
  'second_name' => "Potter",
  'house' => "Gryffindor",
  'age' => 22,
  })

student2 = Student.new({
  'id' => 1,
  'first_name' => "Ron",
  'second_name' => "Weasley",
  'house' => "Gryffindor",
  'age' => 234,
  })

  student1.save
  student2.save

  students = Student.all

  binding.pry


  nil
