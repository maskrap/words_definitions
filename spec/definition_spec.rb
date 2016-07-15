require('rspec')
require('word')
require('definition')


describe('Definition') do
  before() do
    Definition.clear()
  end

  describe("#name") do
    it("returns the string of the definition") do
      test_definition = Definition.new({:name=> "Vegetarian", :definitions=> "A hungry person"})
      expect(test_definition.definitions()).to(eq("A hungry person"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a definition to the array of saved definitions") do
      test_definition = Definition.new({:definitions=> "A bad hunter"})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved definitions") do
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end


end
