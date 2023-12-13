class DictionaryController < ApplicationController
  def show
    dictionary_service = Dictionary.new
    @word = params[:word]
    @definition = dictionary_service.fetch_definition(@word) || {}
    @word_list = Word.all # Assuming Word model has a 'word' attribute
    @current_user = current_user
  end

  def search
    @word = params[:word]
    dictionary_service = Dictionary.new
    @definition = dictionary_service.fetch_definition(@word) || {}
    @word_list = Word.all
    render :show
  end

end
