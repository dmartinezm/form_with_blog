class FriendsController < ApplicationController
    before_action :set_friend, only: [:show]
    def home
        render :welcome
    end

    def index
        if params[:first_name] == nil || params[:first_name] == ''
            @friends = Friend.all
            
        else
            # byebug
            session[:search_results] = request.url
            @friends = Friend.where('lower(first_name) = ?', params[:first_name].downcase).order("first_name")

        end
    end

    def show

    end

    def new
       
        @friend = Friend.new
    end

    def create
        friend = Friend.new(friend_params)
        friend.save
        redirect_to friends_path

    end

    def search

    end

    private

    def set_friend
        @friend = Friend.find(params[:id])
    end

    def friend_params
        params.require(:friend).permit(:first_name,:last_name,:favorite_color)
    end
end
