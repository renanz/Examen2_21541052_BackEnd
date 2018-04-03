module Api::V1
    class TweetsController < ApplicationController
        def index
            @tweets = Tweet.order("created_at ASC")
            render json: @tweets
        end

        def create 
            @tweet = Tweet.create(tweets_params)
            render json: @tweet
        end

        def update
            @tweet = Tweet.find(params[:id])
            @tweet.update_attributes(tweets_params)
            render json: @tweet
          end

        private
            def tweets_params
                params.require(:tweet).permit(:username, :body)
            end
    end
end