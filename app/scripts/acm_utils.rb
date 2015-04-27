require 'open-uri'
require 'nokogiri'

module ACMUtils

  def get_bibref_from_acm_url(acm_url)
    bibtex = get_acm_bibtex_by_url(acm_url)
    return bibtex_into_bibref_object(bibtex)
  end

  def get_acm_bibtex_by_url(acm_url)
    acm_id = acm_url_to_acm_id(acm_url)
    get_acm_bibtex_by_id(acm_id)
  end

  def acm_url_to_acm_id(acm_url)
    acm_url[/id=[0-9]*\.([0-9]*)/, 1]
  end

  def get_acm_bibtex_by_id(acm_id)
    page_source = Nokogiri::HTML(open("http://dl.acm.org/exportformats.cfm?id=#{acm_id}&expformat=bibtex"))

    bibtex_element = page_source.css("pre").first

    if bibtex_element == nil
      raise 'Invalid ID was entered'
    end

    return bibtex_element.text
  end

  def bibtex_into_bibref_object(bibtex)
    bibtex_hash = bibtex_field_values(bibtex)
    reftype = reftype_in_bibtex(bibtex)

    bibref = Bibref.create(:reftype => reftype)

    required_fields = bibref.get_required_field_symbols
    optional_fields = bibref.get_optional_field_symbols

    bibtex_hash.each do |field_name, field_value|
      if required_fields.include? field_name or optional_fields.include? field_name then
        bibref.set_field_value(field_name, field_value)
      end
    end

    return bibref

  end

  def bibtex_field_values(bibtex)
    lines = bibtex.lines
    return parse_fields(lines)
  end

  def parse_fields(lines)
    bibtex_data = {}
    lines.each do |line|


      field_type = parse_field_type(line)
      content = parse_content(line)

      if invalid_line(content, field_type) then
        next
      end

      bibtex_data[:"#{field_type}"] = content
    end
    return bibtex_data
  end

  def invalid_line(content, field_type)
    content.nil? or field_type.nil?
  end

  def parse_content(line)
    line[/ (.*) = {(.*)},/, 2]
  end

  def parse_field_type(line)
    field_type = line[/ (.*) = {(.*)},/, 1]
  end

  def reftype_in_bibtex(bibtex)
    bibtex[/@(.*?){/, 1]
  end




end