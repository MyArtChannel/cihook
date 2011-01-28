require 'rubygems'
require 'sinatra'
require 'cihook.rb'

log = File.new("logs/sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

run Sinatra::Application

