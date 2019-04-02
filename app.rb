require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    txt = TextAnalyzer.new(params[:user_text])
    @count = txt.count_of_words
    @vowels = txt.count_of_vowels
    @const = txt.count_of_consonants
    @common = txt.most_used_letter
    erb :results
  end
end
