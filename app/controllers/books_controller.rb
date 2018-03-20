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
        @book.user_name=current_user.name
        @book.user_id=current_user.id
        if @book.save
          redirect_to books_path
        end
      else
        flash[:notice]="You must sign in first"
        redirect_to new_user_session_path
      end
  end

  def edit
      @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    @book.user_name=current_user.name
    @book.user_id=current_user.id
    if(@book.update(params_book))
      redirect_to @book
    else
      render 'edit'
    end
  end

  def show
    @book=Book.find(params[:id])
  end

  def destroy
    @book=Book.find(params[:id])
		@book.destroy

		redirect_to books_path
  end
  private

  def params_book
    params.require(:book).permit(:title,:description,:author,:price)
  end

end
