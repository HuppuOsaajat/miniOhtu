class Bibref < ActiveRecord::Base

  has_many :fields, dependent: :destroy
  accepts_nested_attributes_for :fields

  after_save :generate_empty_fields

  @@reference_types = {
      article: {
          required: [:author, :title, :journal, :year, :volume],
          optional: [:number, :pages, :month, :note, :key]
      },
      book: {
          required: [:author, :title, :publisher, :year],
          optional: [:volume, :series, :address, :edition, :month, :note, :key]
      },
      inproceedings: {
          required: [:author, :title, :booktitle, :year],
          optional: [:editor, :volume, :series, :pages, :address, :month, :organization, :publisher, :note, :key]
      },
      misc: {
          required: [],
          optional: [:author, :title, :howpublished, :month, :year, :note, :key]
      },
      mastersthesis: {
          required: [:author, :title, :school, :year],
          optional: [:type, :address, :month, :note, :key]
      },
      phdthesis: {
          required: [:author, :title, :school, :year],
          optional: [:type, :address, :month, :note, :key]
      },
      unpublished: {
          required: [:author, :title, :note],
          optional: [:month, :year, :key]
      },
      proceedings: {
          required: [:title, :year],
          optional: [:editor, :volume, :series, :address, :month, :publisher, :organization, :key]
      },
      techreport: {
          required: [:author, :title, :institution, :year],
          optional: [:type, :number, :address, :month, :note, :key]
      },
      booklet: {
          required: [:title],
          optional: [:author, :howpublished, :address, :month, :year, :note, :key]
      }
  }

  #Sets the field specified in @field to @value
  def set_field_value(field, value)
    field = get_field(field)
    field.update(content: value)
  end

  #Returns the field specified in @field
  def get_field(field)
    fields.find_by(name: field)
  end

  def get_required_fields
    required_field_symbols = get_required_field_symbols
    fields.where(name: required_field_symbols)
  end

  def get_optional_fields
    optional_field_symbols = get_optional_field_symbols
    fields.where(name: optional_field_symbols)
  end

  def get_required_field_symbols
    check_reftype_set
    @@reference_types[reftype.to_sym][:required]
  end

  def get_optional_field_symbols
    check_reftype_set
    @@reference_types[reftype.to_sym][:optional]
  end

  def update_all(attributes, fields_attributes)
    update(attributes) && update_fields(fields_attributes)
  end


  private

  # Creates empty and optional Fields for this Bibref if they don't exist already
  def generate_empty_fields
    all_fields = get_required_field_symbols + get_optional_field_symbols
    all_fields.each do |r|
      fields.create(name: r, content: '') unless fields.exists?(name: r)
    end
  end


  def check_reftype_set
    raise "Reftype can't be empty!" if reftype.nil?
  end


  # Updates all nested fields with the given values
  def update_fields(fields_attributes)
    all_fields = get_required_field_symbols + get_optional_field_symbols
    success = true

    fields_attributes.each do |field|
      field_type = all_fields[field[0].to_i]
      field_value = field[1][:content]

      if validate_field(field_type, field_value)
        set_field_value(field_type, field_value)
      else
        success = false
      end
    end

    return success
  end

  # Checks that field_value is a valid value for field_type.
  # Should return true if valid, false if invalid and also set
  # appropriate error messages.
  def validate_field(field_type, field_value)

    # Required field not empty?
    if (get_required_field_symbols.include? field_type)
      if field_value.empty?
        @errors.add(field_type, "can't be blank")
        return false
      end
    end

    return true
  end

end
