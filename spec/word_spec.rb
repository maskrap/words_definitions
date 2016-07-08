require('rspec')
require('word')

describe('Words') do
  before() do
    Words.clear()
  end

  describe("#name") do
    it("returns the name of the word") do
      test_word = Words.new({:name=> "Vegetarian"})
      expect(test_word.make()).to(eq("Vegetarian"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Words.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Words.new({:name=> "Vegetarian"})
      test_word.save()
      expect(Words.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words") do
      Words.new({:name=> "Vegetarian"})
      Words.clear()
      expect(Words.all()).to(eq([]))
    end
  end

end
