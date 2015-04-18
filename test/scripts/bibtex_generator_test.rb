require 'test_helper'



class Bibtex_generator_test < ActiveSupport::TestCase

  include BibtexGenerator

  setup do
    @book = Bibref.new(shortname: 'shrt', reftype: :book)
    @book.save
    @book.set_field_value(:author, 'Testari Mestari')
    @book.set_field_value(:year, '1994')
    @book.set_field_value(:publisher, 'Testausoppaat')
    @book.set_field_value(:title, 'Näin väännät railsia')

  end

  test 'the_first_line_is_correct' do
    first_line = generate_first_line(@book)
    assert_equal "@#{@book.reftype}{#{@book.shortname},", first_line
    end

end