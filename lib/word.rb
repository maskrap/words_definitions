class Word
  @@words = []
  attr_reader(:name, :id, :definitions)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = @@words.length().+(1)
    @definitions = attributes.fetch(:definitions)
  end

  define_singleton_method(:find) do |identification|
    found_word = nil
    @@words.each() do |word|
      if word.id() == identification
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

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end
end
