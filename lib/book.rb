class Book
  attr_reader :title, :author, :publication_year, :publication_date

  def initialize(attributes)
    @title = attributes[:title]
    first_name = attributes[:author_first_name]
    last_name = attributes[:author_last_name]
    @author = "#{first_name} #{last_name}"
    @publication_date = attributes[:publication_date]
    @publication_year = @publication_date[-4, 4]
  end
end