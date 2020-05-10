class BooksController < ApplicationController  
        def create
          # ストロングパラメーターを使用
           @list = Book.new(list_params)
          # DBへ保存する
          if @list.save
             redirect_to book_path(@list.id)# 詳細画面へリダイレクト
             flash[:notice] = "Book was successfully created."
          else
            @lists = Book.all  
            render :index
          end
      end
      
      def index
        @lists = Book.all 
        @list = Book.new
      end
      
      def show
        @list = Book.find(params[:id])      
      end
      def edit
        @list = Book.find(params[:id])
        
      end
      def update
        @list = Book.find(params[:id])
        @list.update(list_params)
        if @list.save
          flash[:notice] = "Book was successfully updated."
          redirect_to book_path(@list.id)# 詳細画面へリダイレクト
        else
          render :edit
          end

      end
      def destroy
        @list = Book.find(params[:id]) #データ(レコード)を1件取得
        @list.destroy #データ（レコード）を削除
        redirect_to books_path   #List一覧画面へリダイレクト
        flash[:notice] = "Book was successfully destroyed."
      
      end
      private
      
      def list_params
          params.require(:book).permit(:title, :body)
      end      
end
