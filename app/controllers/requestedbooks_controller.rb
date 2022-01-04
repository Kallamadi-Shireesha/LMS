class RequestedbooksController < ApplicationController
    def index 
    if session[:user_id]
        @user=User.find(session[:user_id])
        @requested_books=Requestedbook.all
    end
    end 
    
    def create 
        @requested_book=Requestedbook.new(required_params)
        if @requested_book.save
            session[:requested_book]=@requested_book.id
            
            redirect_to carts_path
        end
         
    end




    private 
    def required_params
        params.require(:requestedbook).permit(:bookslist_id,:user_id,:bookname,:description)
    end
end
