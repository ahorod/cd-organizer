require('rspec')
require('artist')

describe(Artist) do
  before() do
    Artist.clear()
  end

  describe('#name') do
    it("returns the name of the artist") do
      test_artist = Artist.new("Bob's Used Cars")
      expect(test_artist.name()).to(eq("Bob's Used Cars"))
    end
  end

  describe('#id') do
    it("returns the id of the artist") do
      test_artist = Artist.new("Bob's Used Cars")
      expect(test_artist.id()).to(eq(1))
    end
  end

  describe('#cd') do
    it("initially returns an empty array of cd for the artist") do
      test_artist = Artist.new("Bob's Used Cars")
      expect(test_artist.cd()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a artist to the array of saved artists") do
      test_artist = Artist.new("Bob's Used Cars")
      test_artist.save()
      expect(Artist.all()).to(eq([test_artist]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Artist.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved artists") do
      Artist.new("Bob's Used Cars").save()
      Artist.clear()
      expect(Artist.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a artist by its id number") do
      test_artist = Artist.new("Bob's Used Cars")
      test_artist.save()
      test_artist2 = Artist.new("Jane's Cars")
      test_artist2.save()
      expect(Artist.find(test_artist.id())).to(eq(test_artist))
    end
  end

  describe('#add_album') do
    it("adds a new vehicle to a artist") do
      test_artist = Artist.new("Bob's Used Cars")
      test_album = Album.new("BBQ")
      test_artist.add_album(test_album)
      expect(test_artist.cd()).to(eq([test_album]))
    end
  end
end
