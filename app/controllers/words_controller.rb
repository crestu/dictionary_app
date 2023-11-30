class WordsController < ApplicationController
    before_action :set_word, only: [:show, :edit, :update, :destroy]
  
    def index
      @words = Word.all
    end
  
    def show
        @word = Word.find(params[:id])
    end
  
    def new
      @word = Word.new
    end
  
    def create
      @word = Word.new(word_params)
      if @word.save
        redirect_to @word, notice: 'Word was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @word.update(word_params)
        redirect_to @word, notice: 'Word was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @word.destroy
      redirect_to words_url, notice: 'Word was successfully destroyed.'
    end
  
    private
  
    def set_word
        @word = Word.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        # Handle the case where the record is not found
        redirect_to root_path, alert: 'Word not found'
    end
  
    def word_params
      params.require(:word).permit(:definition, :word_id)
    end
end