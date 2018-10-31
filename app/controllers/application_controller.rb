class ApplicationController < Sinatra::Base
  set :views, proc { File.join(root, '../views/') }
  # set :method_override, true 
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
    erb :"application/index"
  end
end
