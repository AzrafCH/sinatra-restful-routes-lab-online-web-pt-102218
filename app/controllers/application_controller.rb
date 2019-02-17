class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id].to_i)
    erb :show
  end

  get '/recipes/new'do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.new(:name => params["name"], :ingredients => params["ingredients"], :cook_time => params["cook_time"])
    redirect "/recipes/#{Recipe.last.id}"
  end



end
