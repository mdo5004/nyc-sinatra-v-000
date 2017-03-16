require "pry"
class FiguresController < ApplicationController

    get '/figures/:id/edit' do
        @figure = Figure.find(params[:id])
        erb :'/figures/edit'
    end
    get '/figures/new' do

        erb :'/figures/new'
    end
    get '/figures/:id' do
        @figure = Figure.find(params[:id])
        erb :'/figures/show'
    end
    get '/figures' do

        erb :'/figures/index'
    end

    post '/figures/:id' do
        #edit
        figure = Figure.find(params[:id])
        figure.update(params[:figure])
        if !params[:title][:name].empty?
            figure.titles << Title.find_or_create_by(name: params[:title][:name])
        end
        if !params[:landmark][:name].empty?
            figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
        end
        redirect "/figures/#{params[:id]}"
    end
    post '/figures' do
        #new

        figure = Figure.find_by(name:params[:figure][:name])
        figure ||= Figure.create(params[:figure])

        if !params[:landmark].empty?
            figure.landmarks << Landmark.create(params[:landmark])
        end
        if !params[:title].empty?
            figure.titles << Title.create(params[:title])
        end

        redirect '/figures'
    end
end
