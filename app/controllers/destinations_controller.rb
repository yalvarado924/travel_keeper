class DestinationsController < ApplicationController

    #RESTful routes

    #index
    get '/destinations' do
        if logged_in?
            if current_user.destinations.empty?
                redirect '/destinations/new'
            else
                @destinations = current_user.destinations
                erb :'destinations/index'
            end
        else
            flash[:error] = "Log in to view destinations"
            redirect '/login'
        end
    end

    #new
    get '/destinations/new' do
        if current_user
            erb :'destinations/new'
        else
            flash[:error] = "Log in to add a new destination"
            redirect '/login'
        end
    end

    #show
    get '/destinations/:id' do
        if current_user
            get_destination
            if @destination
                erb :'/destinations/show'
            else
                redirect '/destinations'
            end
        else
            flash[:error] = "Log in to view destination"
            redirect '/login'
        end
    end

    #post view
    post '/destinations' do
        if current_user
            destination = current_user.destinations.build(params)
            if !destination.name.empty? && !destination.location.empty? && !destination.things_to_do.empty?
                destination.save
                redirect '/destinations'
            else
                @error = "Name, Location, Things To Do are required fields. Please try again."
                erb :'destinations/new'
            end
        end
    end

    #edit
    get '/destinations/:id/edit' do
        if current_user
            get_destination
            if @destination.user_id == session[:user_id]
                erb :'/destinations/edit'
            else
                flash[:error] = "Not authorized to make an edit"
                redirect '/destinations'
            end
        else
            flash[:error] = "Log in to edit one of your destinations"
            redirect '/login'
        end
    end

    #patches edit
    patch '/destinations/:id' do
        if current_user
            get_destination
            if !params["destination"]["name"].empty? && !params["destination"]["location"].empty? && !params["destination"]["things_to_do"].empty?
                @destination.update(params["destination"])
                redirect "/destinations/#{params[:id]}"
            else
                @error = "Name, Location, Things To Do are required fields. Please try again."
                erb :'/destinations/edit'
            end
        end
    end

    #delete
    delete '/destinations/:id' do
        if current_user
            get_destination
            @destination.destroy
            redirect '/destinations'
        end
    end

private

def get_destination
    @destination = Destination.find_by(id:params[:id])
end

end