require 'test_helper'

class BibrefTest < ActiveSupport::TestCase

  setup do
    @bibref_article = Bibref.new(shortname: 'article', reftype: :article)
  end

  test 'get_required_fields should return fields' do
    req_fields = @bibref_article.get_required_field_symbols

    assert req_fields.include? :author
    assert req_fields.include? :title
    assert req_fields.include? :journal
    assert req_fields.include? :year
    assert req_fields.include? :volume
    assert !(req_fields.include? :number)
  end

  test 'get_optional_fields should return fields' do
    opt_fields = @bibref_article.get_optional_field_symbols

    assert opt_fields.include? :number
    assert opt_fields.include? :pages
    assert opt_fields.include? :month
    assert opt_fields.include? :note
    assert opt_fields.include? :key
  end
end
