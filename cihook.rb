require 'rubygems'
require 'sinatra'
require 'json'

helpers do

  def partial(template, locals)
    erb "_#{template}".to_sym, {:layout => false}, locals
  end  
  
end

get '/' do
  @payload = {:ref => "refs/heads/master", :repository => {:name => "MyArtChannel/myartchannel.com"}}
  erb :index
end

post '/' do
  push = JSON.parse(params[:payload])
  repository_name = push['repository']['name'].gsub(/[^a-z0-9\-\_\.]/i, '')
  branch_name = push['ref'].split("/").last
  `/home/ci/bin/update #{repository_name} #{branch_name}`
  "OK"
end
