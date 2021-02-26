class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        if params[:username].empty? || params[:password].empty?
            @error = "All fields must be filled to log in"
            erb :'sessions/login'
        else 
            if user = User.find_by(username: params[:username], password: params[:password])
               session[:user_id] = user.id
               redirect '/destinations'
            else
                @error = "This account does not exist"
                erb :'sessions/login'
            end
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end