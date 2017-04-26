class Album
  @@cd = []

  define_method(:initialize) do |album|
    @album = album
    @id = @@cd.length().+(1)
  end

  define_method(:album) do
    @album
  end

  define_singleton_method(:all) do
    @@cd
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@cd.push(self)
  end

  define_singleton_method(:clear) do
    @@cd = []
  end

  define_singleton_method(:find) do |id|
    found_album = nil
    @@cd.each() do |album|
      if album.id().eql?(id)
        found_album = album
      end
    end
    found_album
  end


end
