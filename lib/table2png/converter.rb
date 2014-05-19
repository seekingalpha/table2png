module Table2PNG
  IMGKit.configure do |config|
    binary_path = ENV['HEROKU'] ?
      'bin/wkhtmltoimage-amd64' :
      'bin/wkhtmltoimage'

    config.wkhtmltoimage = File.join(File.dirname(__FILE__), binary_path)
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
      @png ||= ChunkyPNG::Image.from_blob png_from_table
    end
    
    def png_from_table 
      return @png_from_table if defined?(@png_from_table)

      image_from_table = IMGKit.new(html)
      image_from_table.stylesheets << "#{Dir.pwd}/table.css"

      @png_from_table = image_from_table.to_img(:png)
    end
  end
end
