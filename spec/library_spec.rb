require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'
require 'pry'

RSpec.describe Library do

  it 'exists' do
    library = Library.new

    expect(library).to be_a(Library)
  end

  it 'can set author publication ranges' do
    library = Library.new
    
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")
    library.add_author(charlotte_bronte)

    expect(library.publication_time_frame(charlotte_bronte)).to eq({:start=>"1847", :end=>"1853"})

  end

  it 'can checkout books' do
    library = Library.new
    author = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = author.write("To Kill a Mockingbird", "July 11, 1960")
    library.add_author(author)

    expect(library.checkout(mockingbird)).to eq(true)
    expect(library.checked_out_books).to include(mockingbird)

  end

  it 'can track checked out books' do
    library = Library.new
    author = Author.new({first_name: "George", last_name: "Orwell"})
    book1 = author.write("1984", "June 8, 1949")
    book2 = author.write("Animal Farm", "1945")
    library.add_author(author)
    library.checkout(book1)
    library.checkout(book2)

    expect(library.checked_out_books).to include(book1, book2)

  end

  it 'can return books' do
    library = Library.new
    author = Author.new({first_name: "George", last_name: "Orwell"})
    book = author.write("1984", "June 8, 1949")
    library.add_author(author)

    library.checkout(book)
    expect(library.checked_out_books).to include(book)

    library.return(book)
    expect(library.checked_out_books).not_to include(book)

  end
end