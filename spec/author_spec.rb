require 'rspec'
require './lib/book'
require './lib/author'
require 'pry'

RSpec.describe Author do

  it 'exists' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    
    expect(charlotte_bronte).to be_a(Author)
  end

  it 'has attributes' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    
    expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    expect(charlotte_bronte.books).to eq([])
  end

  it 'can write books' do
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    
    @jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1874")
    expect(@jane_eyre.class).to eq(Book)
    expect(@jane_eyre.title).to eq("Jane Eyre")

    @villette = charlotte_bronte.write("Villette", "1853")
    expect(charlotte_bronte.books).to eq([@jane_eyre, @villette])


  end
end