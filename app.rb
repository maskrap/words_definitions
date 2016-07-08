require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/word")
require("./lib/definition")

get("/") do
  erb(:index)
end

get('/definitions/new') do
   erb(:definitions_form)
end

get('/words/new') do
   erb(:words_form)
end

get('/definitions') do
  @definitions = Definition.all()
  erb(:definitions)
end

post('/definitions') do
  name = params.fetch('name')
  Definition.new(name).save()
  @definitions = Definition.all()
  erb(:success)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  erb(:definition)
end

get('/definitions/:id/words/new') do
    @definition = Definition.find(params.fetch('id').to_i())
    erb(:definition_words_form)
end

post('/words') do
  name = params.fetch('name')
  @word = Word.new(name)
  @word.save()
  @definition = Definition.find(params.fetch('definition_id').to_i())
  @definition.add_word(@word)
  erb(:success)
end
