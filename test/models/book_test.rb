require 'test_helper'
require 'book'

module Helper
  def assert_diff_after_book_save(book, expected)
      book.save
      assert Book.where(author: book.author).count == expected
  end
end

class BookTest < ActiveSupport::TestCase
  include Helper

  setup do
    @book = Book.new(author: 'Testi', publisher: 'Testi', title: 'Testi', year: '2000')
  end

  test 'should save a book with correctly filled fields' do
    assert_diff_after_book_save(@book, 1)
  end

  test 'should not save a book with missing fields' do
    @book.title=nil
    assert_diff_after_book_save(@book, 0)
  end

  test 'should not save a book with a negative year' do
      @book.year = -2000
      assert_diff_after_book_save(@book, 0)
  end

  test 'should not save a book with a very large year' do
      @book.year = 20000
      assert_diff_after_book_save(@book, 0)
  end


end
