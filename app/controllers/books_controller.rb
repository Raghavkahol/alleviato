class BooksController < ApplicationController
    def new
      @book=Book.new
    end

    def index
      @books=Book.all
    end

    def create
      if user_signed_in?
        @book=Book.new(params_book)
        @book.user_id=current_user.id
        if @book.save
          redirect_to books_path
        end
      else
        flash[:notice]="You must sign in first"
        redirect_to new_user_session_path
      end
  end

  private

  def params_book
    params.require(:book).permit(:title,:description,:author)
  end

end
