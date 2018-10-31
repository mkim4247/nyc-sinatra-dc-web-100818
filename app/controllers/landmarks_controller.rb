class LandmarksController < ApplicationController
  # add controller methods
  set :views, 'app/views/landmarks'

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/new' do
    erb :new
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    if !params["figure"]["name"].empty?
      @landmark.figure = Figure.create(name: params["figure"]["name"])
    end
    @landmark.save

    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

  patch '/landmarks/:id' do
    if !params[:landmark].keys.include?("figure_id")
      params[:landmark]["figure_id"] = ""
    end

    @landmark = Landmark.find(params[:id])
    @landmark.update(params["landmark"])
    if !params["figure"]["name"].empty?
      @landmark.figure = Figure.create(name: params["figure"]["name"])
    end
    @landmark.save
    redirect to "landmarks/#{@landmark.id}"
  end

end
