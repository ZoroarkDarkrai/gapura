class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, touch: true
  attr_accessor :file

  before_validation :populate_fields_from_file

  validate :image_size_limit

  private
    def populate_fields_from_file
      return if file.nil?
      self.data = file.open.read
      self.filename = file.original_filename
      self.mime_type = file.content_type
    end

    BYTES_PER_MEGABYTES = 1048576
    def image_size_limit
        if (data.size > (2 * BYTES_PER_MEGABYTES))
            errors[:base] << 'Size too big (MAX 2MB)'
        end
    end
end
