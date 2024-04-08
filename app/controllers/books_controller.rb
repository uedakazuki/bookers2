class BooksController < ApplicationController
    before_action :authenticate_user!
    
  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user=current_user
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to "/books/#{@book.id}"
    else
      render :index
    end
  end
    
  def edit
    is_matching_login_user
    @book = Book.find(params[:id])
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @booknew = Book.find(params[:id])
    @book = Book.new
    @book_comment = BookComment.new
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
    
    def is_matching_login_user
      book = Book.find(params[:id])
      user = book.user
      unless user.id == current_user.id
       redirect_to books_path
      end
    end
end
