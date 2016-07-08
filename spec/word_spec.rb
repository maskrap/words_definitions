require('rspec')
require('word')

describe('Words') do
  before() do
    Word.clear()
  end

  describe("#name") do
    it("returns the name of the word") do
      test_word = Word.new({:name=> "Vegetarian"})
      expect(test_word.name()).to(eq("Vegetarian"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Word.new({:name=> "Vegetarian"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words") do
      Word.new({:name=> "Vegetarian"})
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

end
