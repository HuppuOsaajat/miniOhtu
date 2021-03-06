require 'test_helper'



class Bibtex_generator_test < ActiveSupport::TestCase

  include ACMUtils

  setup do
  end

  test 'bibtex_is_correctly_fetched_from_acm' do
    bibtex = get_acm_bibtex_by_id('2380613')
    assert bibtex.include?('year = {2012},')
    assert bibtex.include?('title = {Three Years of Design-based Research to Reform a Software Engineering Curriculum},')
    assert bibtex.include?('author = {Luukkainen, Matti and Vihavainen, Arto and Vikberg, Thomas},')
    end

  test 'reftype of bibtex is correctly parsed' do
    bibtex = get_acm_bibtex_by_id('2380613')
    assert_equal 'inproceedings', reftype_in_bibtex(bibtex)
  end

  test 'ACM-URL is correctly converted into ACM-id' do
    url = 'http://dl.acm.org/citation.cfm?id=2380552.2380613&coll=DL&dl=GUIDE'
    assert_equal '2380613', acm_url_to_acm_id(url)
  end

  test 'incorrect ACM-ID raises an error' do
    incorrect_id = 3
    assert_raise RuntimeError do
      get_acm_bibtex_by_id(incorrect_id)
    end
  end

  test 'bibtex is correctly turned into a bibref' do
    bibtex = get_acm_bibtex_by_id('2380613')
    bibref = bibtex_into_bibref_object(bibtex)

    assert_equal "inproceedings", bibref.reftype
    assert_equal "Luukkainen, Matti and Vihavainen, Arto and Vikberg, Thomas", bibref.get_field(:author).content
    assert_equal "ACM", bibref.get_field(:publisher).content

    bibtex = get_acm_bibtex_by_id('2380614')
    bibref = bibtex_into_bibref_object(bibtex)

    assert_equal 'Proceedings of the 13th Annual Conference on Information Technology Education', bibref.get_field(:booktitle).content
  end


end