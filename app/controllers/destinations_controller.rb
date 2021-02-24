class DestinationsController < ApplicationController

    #RESTful routes

    #index
    get '/destinations' do
        @destinations = Destination.all
        erb :'destinations/index'
    end

    #new
    get '/destinations/new' do
        erb :new
    end

    #show
    get '/destinations/:id' do
        erb :show
    end

    #post view
    post '/destinations' do
    end

    #edit
    get '/destinations/:id/edit' do
        erb :edit
    end

    #patches edit
    patch '/destinations/:id' do
    end

    #delete
    delete '/destinations/:id' do
    end

end