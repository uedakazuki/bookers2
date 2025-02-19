class BookCommentsController < ApplicationController
  def create
    @book = Book.find_by(params[:book_id])
    @booknew = Book.find_by(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
   
    comment.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    BookComment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
