class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.name.empty? || user.username.empty? || user.password.empty?
            @error = "All fields must be filled to signup"
        elsif User.find_by(username: user.username)
            @error = "This username already exists"
            erb :'users/signup'
        else
            user.save
            session[:user_id] = user.id
            redirect '/destinations'
        end
    end
end