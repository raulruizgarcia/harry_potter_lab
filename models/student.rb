require 'pg'
require_relative '../db/sql_runner'

class Student

attr_reader :id
attr_accessor :first_name, :second_name, :house, :age

  def initialize( params )
    @id = params['id'].to_i if params['id']
    @first_name = params['first_name']
    @second_name = params['second_name']
    @house = params['house']
    @age = params['age'].to_i
  end

  def save()
    sql = '
      INSERT INTO students (
      first_name, second_name, house, age
      ) VALUES (
      $1, $2, $3, $4
      )
      RETURNING *;
    '
    values = [@first_name, @second_name, @house, @age]

    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql='
      SELECT * FROM students;
    '
    result = SqlRunner.run(sql)
    return result.map(){|student_hash| Student.new(student_hash)}
  end

  def self.find(id)
    sql = '
      SELECT * FROM students WHERE id = $1;
    '
    values = [id]
    result = SqlRunner.run(sql, values)
    return Student.new(result[0])
  end


end
