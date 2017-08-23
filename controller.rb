require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative './models/student'
require_relative './models/house'

also_reload 'models/student/*'

get '/hogwarts' do
  @students = Student.all
  erb(:index)
end

get '/hogwarts/new' do
  erb(:new)
end

get '/hogwarts/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

post '/hogwarts' do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

post '/hogwarts/:id/delete' do
  student = Student.find(params['id'])
  student.delete
  redirect to '/hogwarts'
end

get '/hogwarts/:id/edit' do
  @student = Student.find(params['id'])
  erb(:edit)
end

post '/hogwarts/:id' do
  @student = Student.new(params)
  @student.update()
  redirect to "/hogwarts/#{@student.id}"
end
