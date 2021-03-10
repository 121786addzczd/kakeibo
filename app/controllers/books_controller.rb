class BooksController < ApplicationController
  before_action :set_book, only:[:show,:edit,:update,:destroy]
  before_action :redirect_to_signin

  def index
    @books = Book.where(user_id: session[:user_id])
    @books = @books.where(year: params[:year]) if params[:year].present?
    @books = @books.where(month: params[:month]) if params[:month].present?
  end

  def new
    @book = Book.new
  end

  def create
    book_params = params.require(:book).permit(:year,:month,:inout,:category,:amount)
    book_params[:user_id] = session[:user_id]
    @book = Book.new(book_params)
    if @book.save
      flash[:notice]="家計簿にデータを１件登録しました"
    redirect_to books_path
    else
      flash.now[:alert] = '※入力項目に不備があります。確認してください※'
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    book_params = params.require(:book).permit(:year,:month,:inout,:category,:amount)
    if @book.update(book_params)
      flash[:notice]= "家計簿にデータを１件更新しました"
      redirect_to books_path
    else
      flash.now[:alert]= "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "削除しました"
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.where(user_id: session[:user_id]).find(params[:id])
  end

  def redirect_to_signin
    redirect_to signin_path if session[:user_id].blank?
  end

end



