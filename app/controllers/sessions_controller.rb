class SessionsController < ApplicationController

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        if params[:username].empty? || params[:password].empty?
            @error = "All fields must be filled to log in."
            erb :'users/login'
        else 
            user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
               session[:user_id] = user.id
               redirect '/destinations'
            else
                @error = "Invalid Credentials. Please try again."
                erb :'users/login'
            end
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end