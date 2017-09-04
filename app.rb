require 'pry' unless ['production'].include?(ENV['ENV'])

require 'sinatra/base'
require 'sinatra/activerecord'
require 'json'
require 'bunny'
require 'securerandom'
require 'require_all'

['helpers','models','controllers'].each do |path|
  require_all path
end

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  configure do
    conn = Bunny.new(:hostname => "nephren")
    conn.start
    
    set :app_file, __FILE__
    set :rabbitmq, conn
    set :app, {
      queue: 'test_file'
    }
  end

  configure :development do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :qa do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :production do
    set :raise_errors, false #false will show nicer error page
    set :show_exceptions, false #true will ignore raise_errors and display backtrace in browser
  end

  get '/' do
    '123'
  end

  run! if __FILE__ == $0
end