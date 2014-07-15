module Table2PNG
  attr_accessor :css_files

  IMGKit.configure do |config|
    config.default_options = { quality: 100, "disable-javascript" => true }
  end

  Converter = Struct.new(:html, :new_width) do
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

    def process
      png.trim!
    end

    private
    def png
      css_files = @css_files || ['public/table.css']
      @png ||= ChunkyPNG::Image.from_blob png_from_table(css_files)
    end


    def png_from_table css_files
      return @png_from_table if defined?(@png_from_table)

      image_from_table = IMGKit.new(html)

      css_files.each do |file_name|
        image_from_table.stylesheets << "#{Dir.pwd}/#{file_name}"
      end

      @png_from_table = image_from_table.to_img(:png)
    end
  end
end
