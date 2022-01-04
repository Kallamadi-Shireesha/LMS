class CartsController < ApplicationController
    def index 
        
            @requested_books=Requestedbook.all
       
    
    end
    def delete 
        @requested_book=Requestedbook.find(params[:id])
    end 
    def destroy 
        @requested_book=Requestedbook.find(params[:id])
        if @requested_book.destroy 
            redirect_to carts_path
        end
    end

end
