require "zlib"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/flash"
require "active_support"

require_relative "models/witness"

DEFAULT_DB = "postgres://localhost/deepjshah"
set :database, DEFAULT_DB
ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"] || DEFAULT_DB)

enable :sessions

Time.zone = "UTC"

get "/" do
  @witnesses = Witness.order(:witnessed_at).last(10)

  if @witnesses.any?
    @last_seen = (
      (Time.now.in_time_zone("Eastern Time (US & Canada)").beginning_of_day -
        @witnesses.last.witnessed_at.in_time_zone("Eastern Time (US & Canada)").beginning_of_day) /
        1.day
      ).round
  end

  erb :index
end

post "/witness" do
  Time.zone = "UTC"

  name = params[:name]
  if name.nil? || name == ""
    flash[:error] = "PLEASE SELECT A NAME"
    redirect to("/")
    return
  end

  flash[:notice] = "Thanks for reporting #{name}!"
  Witness.create!(name: name, witnessed_at: Time.zone.now)
  redirect to("/")
end
