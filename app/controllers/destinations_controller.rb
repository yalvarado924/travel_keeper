class DestinationsController < ApplicationController

    #RESTful routes

    #index
    get '/destinations' do
        require_login
        @destinations = Destination.all
        erb :'destinations/index'
    end

    #new
    get '/destinations/new' do
        require_login
        erb :'destinations/new'
    end

    #show
    get '/destinations/:id' do
        require_login
        @destination = Destination.find_by(id: params[:id])
        if @destination
            erb :'destinations/show'
        else
            redirect '/destinations'
        end
    end

    #post view
    post '/destinations' do
        destination = current_user.destinations.build(params)
        if !destination.name.empty? && !destination.location.empty? && !destination.things_to_do.empty?
            destination.save
            redirect '/destinations'
        else
            @error = "Name, Location, Things To Do are required fields. Please try again."
            erb :'destinations/new'
        end
    end

    #edit
    get '/destinations/:id/edit' do
        require_login
        @destination = Destination.find_by(id:params[:id])
        erb :'destinations/edit'
    end

    #patches edit
    patch '/destinations/:id' do
        #require_login
        @destination = Destination.find_by(id:params[:id])
        if !params["destination"]["name"].empty? && !params["destination"]["location"].empty? && !params["destination"]["things_to_do"].empty?
        #@destination.update(name: params[:name], image: params[:image], location: params[:location], things_to_do: params[:things_to_do], ideal_time_to_visit: params[:ideal_time_to_visit], current_user: params[:currency])
            @destination.update(params["destination"])
            redirect "/destinations/#{params[:id]}"
        else
            @error = "Data Invalid, try again"
            erb :'/destinations/edit'
        end
    end

    #delete
    delete '/destinations/:id' do
        destination = Destination.find_by(id:params[:id])
        destination.destroy
        redirect '/destinations'
    end

end