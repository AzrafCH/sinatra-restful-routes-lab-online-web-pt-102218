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

     get '/recipes/new' do
      erb :new
    end

     post '/recipes' do
      @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
      redirect "/recipes/#{Recipe.last.id}"
    end

     get '/recipes/:id' do
      @recipe = Recipe.find(params[:id].to_i)
      erb :show
    end

     delete '/recipes/:id' do
      @recipe = Recipe.find(params[:id].to_i)
      @recipe.destroy
      redirect '/recipes'
    end


     get '/recipes/:id/edit' do
      @recipe = Recipe.find_by_id(params[:id].to_i)
      erb :edit
    end

     patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id].to_i)
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
    end
end
