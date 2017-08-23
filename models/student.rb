require 'pg'
require_relative '../db/sql_runner'
require_relative './house'

class Student

attr_reader :id
attr_accessor :first_name, :second_name, :house_id, :age

  def initialize( params )
    @id = params['id'].to_i if params['id']
    @first_name = params['first_name']
    @second_name = params['second_name']
    @house_id = params['house_id'].to_i
    @age = params['age'].to_i
  end

  def save()
    sql = '
      INSERT INTO students (
      first_name, second_name, house_id, age
      ) VALUES (
      $1, $2, $3, $4
      )
      RETURNING *;
    '
    values = [@first_name, @second_name, @house_id, @age]

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

  def self.delete_all()
    sql = '
      DELETE FROM students;
    '
    SqlRunner.run(sql)
  end

  def house()
    sql ='
      SELECT * FROM houses WHERE id = $1;
    '
    values = [@house_id]
    result = SqlRunner.run(sql, values)
    return House.new(result[0])
  end

  def delete()
    sql= '
      DELETE FROM students
      WHERE id = $1;
    '
    SqlRunner.run(sql, [@id])
  end

  def update()
    sql='
      UPDATE students
      SET first_name = $1, second_name = $2, house_id = $3, age =$4
      WHERE id = $5;
    '
    values = [@first_name, @second_name, @house_id, @age, @id]
    SqlRunner.run(sql, values)
  end


end
