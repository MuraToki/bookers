class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
       @books = Book.all
       flash[:notice] = "Book was not successfully created error."
       render :index
    end

  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book)
       flash[:notice] = "Book was successfully updated."
    else
       flash[:notice] = "Book was not successfully created error."
       render :edit
    end
    
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    
   if @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
   else
    @books = Book.all
    render :index
   end
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
