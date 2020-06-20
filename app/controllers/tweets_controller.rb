class TweetsController < ApplicationController
# before any blog action happens, it will authenticate the user
before_action :authenticate_user!
def index
@tweets = Tweet.all
end

    def index
        @tweets = Tweet.all
        end

        def destroy
            @tweet = Tweet.find(params[:id])
            @tweet.destroy
            redirect_to '/', :notice => "Your tweet has been deleted"
          end
       
        def new
            @tweet = Tweet.new
            end

            def create
                @tweet = Tweet.new(tweet_params)
                @tweet.user_id = current_user.id
                if @tweet.save
                    redirect_to '/tweets#index'
                else
                  render 'new'
                end
                end

                private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end

