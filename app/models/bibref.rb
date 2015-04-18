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
          required: [:author, :title, :booktitle, :publisher, :year],
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
    field = Field.find_by(name: field)
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

  private

    # Creates empty Fields for this Bibref if they don't exist already
    def generate_empty_fields
      all_fields = get_required_field_symbols + get_optional_field_symbols
      all_fields.each do |r|
        fields.create(name: r, content: '') unless fields.exists?(name: r)
      end
    end

    def check_reftype_set
      raise "Reftype can't be empty!" if reftype.nil?
    end
end
