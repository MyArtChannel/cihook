require 'rubygems'
require 'sinatra'
require 'json'

get '/' do
  "Ready"
end

post '/' do
  push = JSON.parse(params[:payload])
  repository_name = push['repository']['name'].gsub(/[^a-z0-9\-\_\.]/i, '')
  branch_name = push['ref'].split("/").last
  `/home/ci/bin/update #{repository_name} #{branch_name}`
  "OK"
end
