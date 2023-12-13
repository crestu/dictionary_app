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
    #   @word = Word.new(word_params)
    #   if @word.save
    #     redirect_to @word, notice: 'Word was successfully created.'
    #   else
    #     render :new
    #   end
        @list=  List.find(params[:list_id])
        @word = @list.words.build(word_params)
      if @word.save
        redirect_to lists_url, notice: 'Word was successfully created.'
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
      redirect_to lists_url, notice: 'Word was successfully deleted.'
    end


    def add_to_dictionary
      selected_word = params[:word]
      selected_definition = params[:selected_definition]
  
      @word = Word.new(word: selected_word, definition: selected_definition)
      @word.lists << List.find(params[:list][:id])

      puts "Selected Word: #{selected_word}"
      puts "Selected Definition: #{selected_definition}"

      if @word.save
        flash[:success] = "Word added to dictionary successfully!"
        redirect_to lists_url
      else
        flash[:error] = "Error adding word to dictionary"
        redirect_to root_path
      end
    end

  
    private
  
    def set_word
        @word = Word.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        # Handle the case where the record is not found
        redirect_to root_path, alert: 'Word not found'
    end
  
    def word_params
    params.require(:word).permit(:definition, :word_id, :list_id)
    end


end