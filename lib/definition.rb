class Definition
  @@definitions = []
  attr_reader(:name, :id, :word_input)

  define_method(:initialize) do |name|
    @name = name
    @id = @@definitions.length().+(1)
    @word_input = []
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:find) do |id|
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id().eql?(id)
        found_definition = definition
      end
    end
    found_definition
  end

  define_method(:add_word) do |word|
    @word_input.push(word)
  end

end
