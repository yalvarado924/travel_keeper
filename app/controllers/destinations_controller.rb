class DestinationsController < ApplicationController

    #RESTful routes

    #index
    get '/destinations' do
        @destinations = Destination.all
        erb :'destinations/index'
    end

    #new
    get '/destinations/new' do
        erb :'destinations/new'
    end

    #show
    get '/destinations/:id' do
        @destination = Destination.find_by(id: params[:id])
        erb :'destinations/show'
    end

    #post view
    post '/destinations' do
        destination = Destination.new(params)
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
        @destination = Destination.find_by(id:params[:id])
        erb :'destinations/edit'
    end

    #patches edit
    patch '/destinations/:id' do
        @destination = Destination.find_by(id:params[:id])
    end

    #delete
    delete '/destinations/:id' do
        destination = Destination.find_by(id:params[:id])
        destination.destroy
        redirect '/destinations'
    end

end