require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:words_form)
end

post('/words') do
  Word.new({:name=> params.fetch('word'), :definitions=> []}).save()
  @words = Word.all
  erb(:words)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/words/:id/definition/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:definitions_form)
end

post('/definitions') do
  @def = Definition.new({:def=> params.fetch('def')})
  @def.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@def)
  erb(:word)
end
