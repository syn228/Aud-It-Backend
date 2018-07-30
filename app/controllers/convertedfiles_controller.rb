class ConvertedfilesController < ApplicationController
    def index
        render json: Convertedfile.all
    end

    def create
        @convertedfile = Convertedfile.new

        @convertedfile.name = params[:name]
        @convertedfile.size = params[:size]
        @convertedfile.user_id = params[:user_id]
        @convertedfile.text = params[:text]
        @convertedfile.save
    end

end
