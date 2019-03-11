class TweetsController < ApplicationController

    get '/tweets' do
        if !logged_in? 
            redirect '/login'
        end 
        @tweets = Tweet.all
        @user=current_user(session) 
        erb :'tweets/tweets'
    end  
        
    
    get '/tweets/new' do
        if !logged_in? 
            redirect '/login'
        end 
        erb :'tweets/new'
    
    end 

    post '/tweets' do
        @user=current_user(session)
        tweet = Tweet.create(content: params[:content])
    redirect "/tweets/#{tweet.id}"
    end  

    get '/tweets/:id' do 
        if !logged_in?(session) 
            redirect '/login'
        end 
        @tweet = Tweet.find_by(params[:id])
        erb :'/tweets/show_tweet'  
    end 

    get '/tweets/:id/edit' do
        if !logged_in?(session) 
            redirect '/login'
        end 
        @tweet = Tweet.find_by(params[:id])
        
        erb :'tweets/edit_tweet'
    end 

    patch '/tweets/:id' do
         
    
    redirect "/tweets/#{tweet.id}"
    end 
end 
