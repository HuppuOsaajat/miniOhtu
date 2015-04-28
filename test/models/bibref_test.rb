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

  test 'shortnames are generated correctly' do
    book = Bibref.create(reftype: :book)
    book.set_field_value(:author, 'Anna Salo')
    book.set_field_value(:title, 'Rubyn perusteet')
    book.set_field_value(:publisher, 'WSOY')
    book.set_field_value(:year, 1994)

    article = Bibref.create(reftype: :article)
    article.set_field_value(:author, 'Anna')
    article.set_field_value(:title, 'Otsikko')
    article.set_field_value(:journal, 'Lehti')
    article.set_field_value(:year, 2000)
    article.set_field_value(:volume, 'syksy2015')

    shortname1 = book.generate_shortname
    shortname2 = article.generate_shortname

    assert shortname.must_be 'Salo1994Rubyn'
    assert shortname.must_be 'Anna2000Otsikko'
  end


  test 'search results are correct' do
    article = Bibref.create(shortname: 'artikkeli', reftype: :article)
    article.set_field_value(:author, 'Juho Lamminmäki')
    article.set_field_value(:title, 'Näin teet kotikaljaa')

    book = Bibref.create(shortname: 'kirja', reftype: :book)
    book.set_field_value(:author, 'Etunimi Sukunimi')
    book.set_field_value(:title, 'Otsikko')

    search1 = Bibref.search_results('Juho')
    assert search1.include? article
    assert !(search1.include? book)

    search2 = Bibref.search_results('kalja')
    assert search2.include? article
    assert !(search2.include? book)

    search3 = Bibref.search_results('ETUNIMI SUKUNIMI')
    assert search3.include? book
    assert !(search3.include? article)

    search4 = Bibref.search_results('Ei vastaa mitään')
    assert search4.empty?

    search5 = Bibref.search_results('kirj')
    assert search5.include? book
    assert !(search5.include? article)
  end
end
