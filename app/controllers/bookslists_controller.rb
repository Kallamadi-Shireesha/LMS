class BookslistsController < ApplicationController
  
  def index
    if session[:user_id]
      @user=User.find(session[:user_id])
      @bookslists=Bookslist.all
      @requested_book=Requestedbook.new
    else  
      redirect_to "/"
    end

  end

  def show
    @bookslist=Bookslist.find(params[:id])
    
  end

  def new
    
    @bookslist=Bookslist.new
    
  end

  def create
    @bookslist=Bookslist.new(blists_params)
    if @bookslist.save
      
      redirect_to bookslists_path
    else  
      render('new') #renders tmplates
    end
  end

  def edit
    @bookslist=Bookslist.find(params[:id])
  end

  def update
    @bookslist=Bookslist.find(params[:id])
    if @bookslist.update(blists_params)
      redirect_to bookslists_path 
    else  
      render 'edit'
    end
  end

  def delete
    @bookslist=Bookslist.find(params[:id])
  end

  def destroy
    @bookslist=Bookslist.find(params[:id])
    if @bookslist.destroy 
      redirect_to bookslists_path
    end

  end
 
  private 
  def blists_params 
    params.require(:bookslist).permit(:bookname,:description, :user_id)
  end
end
