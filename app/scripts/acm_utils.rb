require 'open-uri'
require 'nokogiri'

module ACMUtils

  def get_acm_bibtex_by_url(acm_url)
    acm_id = acm_url_to_acm_id(acm_url)
    get_acm_bibtex_by_id(acm_id)
  end

  def acm_url_to_acm_id(acm_url)
    acm_url[/id=[0-9]*\.([0-9]*)/, 1]
  end

  def get_acm_bibtex_by_id(acm_id)
    page_source = Nokogiri::HTML(open("http://dl.acm.org/exportformats.cfm?id=#{acm_id}&expformat=bibtex"))
    page_source.css("pre").first.text
  end

  def bibtex_into_bibref_object(bibtex, shortname)
    reftype = reftype_in_bibtex(bibtex)

    bibref = Bibref.new(reftype: reftype, shortname: shortname)
    bibref.save

    #TODO: the rest of this function
  end

  def reftype_in_bibtex(bibtex)
    bibtex[/@(.*?){/, 1]
  end




end