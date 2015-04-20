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

  test 'bibtex has correct syntax' do
    assert generate_bibtex(@book) =~ /^@[a-zA-Z]+ *\{ *[^,\{\}\n]+ *, *(\n* *[a-zA-Z]+ *= *\{[^\n]+\} *, *)*\n* *}/m
  end

  test 'bibtex contains fields and values' do
    bibtex = generate_bibtex(@book)
    assert bibtex.include? 'author = {Testari Mestari},'
    assert bibtex.include? 'year = {1994},'
    assert bibtex.include? 'publisher = {Testausoppaat},'
    assert bibtex.include? 'title = {Näin väännät railsia},'
  end

end