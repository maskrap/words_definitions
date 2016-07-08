class Word
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:find) do |identification|
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(identification.to_i())
          found_word = word
      end
    end
    found_word
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save)  do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end

end
