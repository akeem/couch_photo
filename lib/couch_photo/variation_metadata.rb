module CouchPhoto
  module VariationMetadata
    def path
      if exists?
        "/#{@document.database.name}/#{@document.id}/#{attachment_name}"
      end
    end

    def extension
      if exists?
        @extension ||= File.extname(attachment_name).gsub(/\./, '')
      end
    end

    def mime_type
      if exists?
        @mime_type ||= @document["_attachments"][attachment_name]["content_type"]
      end
    end

    def data
      if exists?
        @data ||= @document.read_attachment attachment_name
      end
    end

    def width
      mini_magick[:width] 
    end

    def height
      mini_magick[:height]
    end

    def xmp_metadata
      tmp_image_uuid = `uuidgen`.strip
      tmp_image_file_name = "/tmp/#{tmp_image_uuid}.#{extension}" 
      tmp_xmp_file_name = "/tmp/#{tmp_image_uuid}.xmp" 
      mini_magick.write tmp_image_file_name 
      `convert #{tmp_image_file_name} #{tmp_xmp_file_name} 2> /dev/null` 
      Hash.from_xml File.read(tmp_xmp_file_name)
    end

    def url
      if exists?
        "#{@document.database.root}/#{@document.id}/#{attachment_name}"
      end
    end

    private
    def exists?
      !@document["_attachments"][attachment_name].nil?
    end

    def mini_magick
      if exists?
        @mini_magick ||= MiniMagick::Image.read(self.data)
      end
    end

    def attachment_name
      "variations/#{@variation_name}.#{@document.original.extension}"
    end
  end
end
