require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd')
require('./lib/artist')

get('/') do
  erb(:index)
end

get('/artists/new') do
   erb(:artist_form)
end

get('/artists') do
  @artists = Artist.all()
  erb(:artists)
end

post('/artists') do
  name = params.fetch('name')
  Artist.new(name).save()
  @artists = Artist.all()
  erb(:success)
end

get('/cds/:id') do
  @album = Album.find(params.fetch('id').to_i())
  erb(:album)
end

get('/artists/:id') do
  @artist = Artist.find(params.fetch('id').to_i())
  erb(:artist)
end

get('/artists/:id/cds/new') do
    @artist = Artist.find(params.fetch('id').to_i())
    erb(:artist_cd_form)
end

post('/new') do
  album = params.fetch('album')

  @album = Album.new(album)
  @album.save()
  @artist = Artist.find(params.fetch('artist_id').to_i())
  @artist.add_album(@album)
  erb(:success)
end

get('/cds/') do
  @cds = Album.all()
  erb(:cds)
end

get('/artist_cds_form/new') do
  erb(:artist_cd_form)
end
