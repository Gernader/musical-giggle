require 'rspec'
require './lib/book'
require './lib/author'
require 'pry'

class Library
  attr_reader :books, :authors, :checked_out_books

  def initialize
    @books = []
    @authors = []
    @checked_out_books = []

  end

  def add_author(author)
    @authors << author
    @books.concat(author.books)
  end

  def publication_time_frame(author)
    years = author.books.map(&:publication_year).sort
    {
      start: years.first,
      end:years.last
    }
  end
  
  
  def checkout(book)
    return false if !books.include?(book) || checked_out_books.include?(book)
  
    @checked_out_books << book
    true
  end
  
  def return(book)
      @checked_out_books.delete(book)
 end
end
  

