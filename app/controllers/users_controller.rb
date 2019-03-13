class UsersController < ApplicationController

    get '/signup' do
      # binding.pry
        if !logged_in?
            erb :"/users/create_user"
        else
            redirect to '/tweets/tweets'
        end
    end

    post '/signup' do
        if params[:username] =="" || params[:email] =="" || params[:password] ==""
            redirect '/signup'
        else
            user=User.new(params)
            if user.save
            session[:user_id]=user.id
            redirect to '/tweets/tweets'
            else
                redirect '/signup'
            end
        end
    end

    get '/login' do
        if !logged_in?
        erb :"/users/login"
        else
            redirect '/tweets/tweets'
        end
    end

    post '/login' do
        @user=User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/tweets/tweets'
        else
            redirect '/signup'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
            redirect '/login'
        else
            redirect '/'
        end
    end
end
