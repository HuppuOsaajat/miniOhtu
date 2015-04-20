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
end
