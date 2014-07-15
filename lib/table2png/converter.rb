module Table2PNG

  IMGKit.configure do |config|
    config.default_options = { quality: 100, "disable-javascript" => true }
  end

  Converter = Struct.new(:html, :new_width, :css_files) do

    def save path
      process
      png.save path
    end

    def width
      png.width
    end

    def height
      png.height
    end

    def process css_files = nil
      raise 'Please pass list of css path i.e [\'/public/file.css\',\'/public/file2.css\']' if css_files && !css_files.is_a?(Array)
      @css_files = css_files || ['public/table.css']
      png.trim!
    end

    private
    def png
      @png ||= ChunkyPNG::Image.from_blob png_from_table
    end


    def png_from_table
      return @png_from_table if defined?(@png_from_table)

      image_from_table = IMGKit.new(html)

      @css_files.each do |file_name|
        image_from_table.stylesheets << "#{Dir.pwd}/#{file_name}"
      end

      @png_from_table = image_from_table.to_img(:png)
    end
  end
end
