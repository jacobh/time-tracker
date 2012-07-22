require "sinatra"
require "erubis"
require "active_record"
require "sass"
Dir["./models/*.rb"].each { |m| require m }

CONFIG = YAML.load_file("config.yml")[Sinatra::Application.environment.to_s]
ActiveRecord::Base.establish_connection CONFIG["db"]

set :erb, :escape_html => true
enable :sessions

get "/" do
  erb :index
end

get "/login" do
  erb :'user/login'
end

post "/login" do
  user = User.find_by_email params[:email]
  if user and user.authenticate [:password]
    session[:user_id] = user.id
    "now logged in successfully"
  else
    "something went wrong while trying to log you in"
  end
end

get "/style.css" do
  scss :style
end