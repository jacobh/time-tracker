require "sinatra"
require "erubis"
require "active_record"
require "sass"
Dir["./models/*.rb"].each { |m| require m }

CONFIG = YAML.load_file("config.yml")[Sinatra::Application.environment.to_s]
ActiveRecord::Base.establish_connection CONFIG["db"]

set :erb, :escape_html => true
enable :sessions

before do
  if session[:user_id]
    @current_user = User.find(session[:user_id])
  end
end

get "/" do
  erb :index
end

get "/login" do
  erb :'user/login'
end

post "/login" do
  @user = User.find_by_email params[:email]
  if @user and user.authenticate [:password]
    session[:user_id] = @user.id
    "now logged in successfully"
  else
    "something went wrong while trying to log you in"
  end
end

get "/signup" do
  erb :'user/signup'
end

post "/signup" do
  @user = User.new params
  if @user.save
    session[:user_id] = @user.id
    "successfully signed you up!"
  else
    "uh oh stuff went wrong"
  end
end

get "/style.css" do
  scss :style
end