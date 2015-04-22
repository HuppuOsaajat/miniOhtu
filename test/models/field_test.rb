require 'test_helper'

class FieldTest < ActiveSupport::TestCase

  setup do
    @book = Bibref.new(shortname: 'shrt', reftype: :book)
    @book.save
    @author_name = 'Testari'
    @book.set_field_value(:author, @author_name)
    @field = @book.get_field(:author)
  end

  test 'field is converted into bibtex correctly' do
    assert_equal "author = {#{@author_name}}," , @field.to_bibtex
  end

  test 'field with ä is converted correctly' do
    test_string = 'author = {ärinä},'
    assert_equal 'author = {\"{a}rin\"{a}},', @field.format_special_characters(test_string)
    end

  test 'field with ö is converted correctly' do
    test_string = 'author = {örinö},'
    assert_equal 'author = {\"{o}rin\"{o}},', @field.format_special_characters(test_string)
  end

  test 'field with ö and ä is converted correctly' do
    test_string = 'author = {örinä},'
    assert_equal 'author = {\"{o}rin\"{a}},', @field.format_special_characters(test_string)
    end

  test 'field with å is converted correctly' do
    test_string = 'author = {årinå},'
    assert_equal 'author = {\r{a}rin\r{a}},', @field.format_special_characters(test_string)
    end

  test 'field with å, ö, and ä is converted correctly' do
    test_string = 'author = {örinåä},'
    assert_equal 'author = {\"{o}rin\r{a}\"{a}},', @field.format_special_characters(test_string)
  end

  test 'field with Å, Ö and Ä is converted correctly' do
    test_string = 'author = {ÖrinÅÄ},'
    assert_equal 'author = {\"{O}rin\r{A}\"{A}},', @field.format_special_characters(test_string)
  end


end
