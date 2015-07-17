require 'sinatra'
require 'data_mapper'
load 'datamapper_setup.rb'

class Todo
  include DataMapper::Resource

  property :id,         Serial  # An auto-increment integer key
  property :title,      String
  property :description,String
  property :complete,   Boolean
end

class MindTheCodeApp < Sinatra::Application

  set :partial_template_engine, :erb
  set :static, true

  #Display all todos
  get '/todo' do
    @todos = Todo.all
    erb :'todos/index'
  end

  #Make a new todo
  get '/todo/new' do
    erb :'todos/new'
  end

  #Show each to do
  get '/todo/:id' do |id|
    @todo = Todo.get!(id)
    erb :'todos/show'
  end

  #Edit each to do
  get '/todo/:id/edit' do |id|
    @todo = Todo.get!(id)
    erb :'todos/edit'
  end
  # POST = how a client tells a server to add an entity as a child of the object
  #identified by the URI.
  #The entity that the client expects the server to add is transmitted in the request body.
  post '/todo' do
    todo = Todo.new(params[:todo])

    if todo.save
      redirect '/todo'
    else
      redirect '/todo/new'
    end
  end

  # Changes boolean complete.

  put '/todo/:id/complete' do |id|
    #raise 'something'
    todo = Todo.get!(id)
    todo.complete = true
    todo.save

    if todo.save
      redirect "/todo"
    else
      redirect "/todo/#{id}/edit"

    end
  end

  # PUT is used for updating records in the DB
  # A request using the PUT HTTP verb should act upon a single resource within the collection;
  put '/todo/:id' do |id|
    todo = Todo.get!(id)
    success = todo.update!(params[:todo])
    if success
      redirect "/todo/#{id}"
    else
      redirect "/todo/#{id}/edit"
    end
  end

  #delete verb to delete record in the db
  delete '/todo/:id' do |id|
    todo = Todo.get!(id)
    todo.destroy!
    redirect "/todo"
  end
end
