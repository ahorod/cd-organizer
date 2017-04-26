class Artist
  @@artists = []

  define_method(:initialize) do |name|
    @name = name
    @id = @@artists.length().+(1)
    @cd = []
  end

  define_method(:name) do
    @name
  end

  define_method(:id) do
    @id
  end

  define_method(:cd) do
    @cd
  end

  define_singleton_method(:all) do
    @@artists
  end

  define_method(:save) do
    @@artists.push(self)
  end

  define_singleton_method(:clear) do
    @@artists = []
  end

  define_singleton_method(:find) do |id|
    found_artist = nil
    @@artists.each() do |artist|
      if artist.id().eql?(id)
        found_artist = artist
      end
    end
    found_artist
  end

  define_method(:add_album) do |album|
  @cd.push(album)
  end

end
