class DestinationsController < ApplicationController

    get '/destinations' do
        if logged_in?
            if current_user.destinations.empty?
                flash[:message] = "Your Travel Keeper is empty. Add your first destination!"
                redirect '/destinations/new'
            else
                @destinations = current_user.destinations
                erb :'destinations/index'
            end
        else
            flash[:error] = "Log in to view your destinations."
            redirect '/login'
        end
    end

    get '/destinations/new' do
        if logged_in?
            erb :'destinations/new'
        else
            flash[:error] = "Log in to add a new destination."
            redirect '/login'
        end
    end

    get '/destinations/:id' do
        if logged_in?
           if @destination = current_user.destinations.find_by(id: params[:id])
                erb :'/destinations/show'
            else
                flash[:error] = "You can only view your own destinations."
                redirect '/destinations'
            end
        else
            flash[:error] = "Log in to view your destinations."
            redirect '/login'
        end
    end

    post '/destinations' do
        if current_user
            filtered_params = params.reject {|key, value| key == "image" && value.empty?}
            destination = current_user.destinations.build(filtered_params)
            if !destination.name.empty? && !destination.location.empty? && !destination.things_to_do.empty?
                destination.save
                redirect '/destinations'
            else
                @error = "Name, Location, Things To Do are required fields. Please try again."
                erb :'destinations/new'
            end
        end
    end

    get '/destinations/:id/edit' do
        if logged_in?
            get_destination
            if @destination.user_id == session[:user_id]
                erb :'/destinations/edit'
            else
                flash[:error] = "Not authorized to make an edit on this destination."
                redirect '/destinations'
            end
        else
            flash[:error] = "Log in to edit one of your destinations."
            redirect '/login'
        end
    end

    patch '/destinations/:id' do
        if logged_in?
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

    delete '/destinations/:id' do
        if logged_in?
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