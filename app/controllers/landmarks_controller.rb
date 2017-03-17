class LandmarksController < ApplicationController
    get '/landmarks/:id/edit' do
        @landmark = Landmark.find(params[:id])
        erb :'/landmarks/edit'
    end
    get '/landmarks/new' do
        
        erb :'/landmarks/new'
    end
    get '/landmarks/:id' do
        @landmark = Landmark.find(params[:id])
        erb :'/landmarks/show'
    end
    get '/landmarks' do
        
        erb :'/landmarks/index'
    end
    
    post '/landmarks/:id' do
        #edit
        
        redirect "/landmarks/#{landmark.id}"
    end
    post '/landmarks' do
        #new
        landmark = Landmark.find_by(name: params[:landmark][:name])
        landmark ||= Landmark.create(params[:landmark])
        
        if !params[:figure][:name].empty?
                
        end
        
        redirect '/landmarks'
    end
end
