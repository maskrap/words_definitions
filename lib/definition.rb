class Definition
  @@definitions = []
  attr_reader(:definitions, :id)

  define_method(:initialize) do |attributes|
    @definitions = attributes.fetch(:definitions)
    @id = @@definitions.length().+(1)
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

end
