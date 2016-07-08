require('rspec')
require('definition')
require('word')

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe('#name') do
    it("returns the name of the definition") do
      test_definition = Definition.new("A bad hunter")
      expect(test_definition.name()).to(eq("A bad hunter"))
    end
  end

  describe('#id') do
    it("returns the id of the definition") do
      test_definition = Definition.new("A bad hunter")
      expect(test_definition.id()).to(eq(1))
    end
  end

  describe('#word_input') do
    it("initially returns an empty array of word_input for the definition") do
      test_definition = Definition.new("A bad hunter")
      expect(test_definition.word_input()).to(eq([]))
    end
  end

  describe('#save') do
    it("adds a definition to the array of saved definitions") do
      test_definition = Definition.new("A bad hunter")
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved definitions") do
      Definition.new("A bad hunter").save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a definition by its id number") do
      test_definition = Definition.new("A bad hunter")
      test_definition.save()
      test_definition2 = Definition.new("A secret underground society that takes pleasure in torturing fruits and vegetables.")
      test_definition2.save()
      expect(Definition.find(test_definition.id())).to(eq(test_definition))
    end
  end
  describe('#add_word') do
    it("adds a new word to a definition") do
      test_definition = Definition.new("A bad hunter")
      test_word = Word.new({:name=> "Vegetarian"})
      test_definition.add_word(test_word)
      expect(test_definition.word_input()).to(eq([test_word]))
    end
  end
end
