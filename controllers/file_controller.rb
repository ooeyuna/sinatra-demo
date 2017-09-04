class App < Sinatra::Base

  def send(msg)
    ch = settings.rabbitmq.create_channel
    q = ch.queue(settings.app['queue'])
    ch.default_exchange.publish(msg, :routing_key => q.name)
  end

  # create new file object and generate token
  post '/file/httpupload' do
    request.body.rewind
    data = JSON.parse request.body.readÎ
    user_id = 1
    mf = MusilimFile.new_file(data.merge('user_id': user_id))
    json mf.as_json
  end

  # generate token
  post '/file/bitorrent' do

  end

  # 
  post '/file/emule' do

  end

  post '/callback/upload' do
  end

  post '/callback/persistent' do
  end

  get '/t' do
    msg = params['msg']
    ch = settings.rabbitmq.create_channel
    q = ch.queue("hello")    
    ch.default_exchange.publish(msg, :routing_key => q.name)
    msg
  end
  
end