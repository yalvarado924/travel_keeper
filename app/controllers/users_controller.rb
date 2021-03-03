class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.name.blank? || user.username.blank? || user.password.blank?
            @error = "All fields must be filled to signup"
            erb :'users/signup'
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