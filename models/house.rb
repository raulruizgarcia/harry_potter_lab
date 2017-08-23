require 'pg'
require_relative '../db/sql_runner'


class House

  attr_accessor :name, :logo
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @logo = params['logo']
  end

  def save()
    sql='
      INSERT INTO houses(
      name, logo
      ) VALUES (
      $1, $2
      )
      RETURNING *;
    '
    values = [@name, @logo]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql='
      SELECT * FROM houses;
    '
    result = SqlRunner.run(sql)
    return result.map(){|house_hash| House.new(house_hash)}
  end

  def self.find(id)
    sql = '
      SELECT * FROM houses WHERE id = $1;
    '
    values = [id]
    result = SqlRunner.run(sql, values)
    return House.new(result[0])
  end

  def self.delete_all()
    sql = '
      DELETE FROM houses;
    '
    SqlRunner.run(sql)
  end


end
