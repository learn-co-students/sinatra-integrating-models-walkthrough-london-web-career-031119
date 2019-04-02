class TextAnalyzer
  attr_reader :text
 
  def initialize(text)
    @text = text.downcase
  end
 
  def count_of_words
    text.split(" ").count
  end
 
  def count_of_vowels
    text.scan(/[aeiou]/).count
  end
 
  def count_of_consonants
    text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end
 
  def most_used_letter
    s1 = text.gsub(/[^a-z]/, '') # gets rid of spaces
    letters = s1.split('')
    uniq_letters = letters.uniq
    char_count_hash = {}
 
    uniq_letters.map do |c|
      char_count_hash[c] =  letters.count(c)
    end
 
    biggest = { char_count_hash.keys.first => char_count_hash.values.first }
 
    char_count_hash.each do |char, count|
      if count > biggest.values.first
        biggest = {}
        biggest[char] = count
      end
    end
 
    biggest
  end
end
