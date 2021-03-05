class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            flash[:message] = "You're already logged in. Here's your Travel Keeper!"
            redirect '/destinations'
        else
        erb :'users/signup'
        end
    end

    post '/signup' do
        @user = User.new(params)
        if @user.name.blank? || @user.username.blank? || @user.password.blank?
            @error = "All fields must be filled to signup"
            erb :'users/signup'
        elsif User.find_by(username: @user.username)
            @error = "This username already exists"
            erb :'users/signup'
        else
            @user.save
            session[:user_id] = @user.id
            redirect '/destinations'
        end
    end
end

