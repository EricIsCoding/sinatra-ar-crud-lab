
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :'index.html'
  end

  #new article
  get '/articles/new' do
    erb :'new.html'
  end

  #save article
  post '/articles' do
    @article = Article.create(:title => params[:title], :content => params[:content])
    redirect "/articles/#{@article.id}"
  end

  #show page
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :'show.html'
  end

  get "/articles" do
    @articles = Article.all
    erb :'index.html'
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :'edit.html'
  end

  #update
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    erb :'show.html'
  end

  #delete
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    erb :'index.html'
  end
end
