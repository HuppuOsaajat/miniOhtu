module BibtexGenerator
  def generate_bibtex(bibref)

    first_line = generate_first_line(bibref)
    required = bibref.get_required_fields
    optional = bibref.get_optional_fields

    all_fields = required + optional

    bibtex = first_line + "\n"
    all_fields.each do |field|
      if(field.content == '')
        next
      end
      bibtex += field.to_bibtex + "\n"
    end

    bibtex += '}'


  end

  def generate_all_bibtex
    bibrefs_bibtex = '';
    all_bibrefs = Bibref.all
    all_bibrefs.each do |bibref|
      bibrefs_bibtex += generate_bibtex(bibref)
      bibrefs_bibtex += "\n\n" unless bibref == all_bibrefs.last
    end

    bibrefs_bibtex
  end




  def generate_first_line(bibref)
    reftype = bibref.reftype
    shortname = bibref.shortname

    first_line = "@#{reftype}\{#{shortname},"
  end
end


