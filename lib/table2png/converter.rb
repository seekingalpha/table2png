module Table2PNG
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
      #sources = ['article','performance_layout','performance_layout_b']
      #css_files = Synthesis::AssetPackage.sources_from_targets("stylesheets", sources)
      css_files = ['article','performance_layout','performance_layout_b']
      @png ||= ChunkyPNG::Image.from_blob png_from_table css_files
    end


    def png_from_table css_files
      return @png_from_table if defined?(@png_from_table)

      image_from_table = IMGKit.new(html)

      css_files.each do |file_name|
        image_from_table.stylesheets << "#{Dir.pwd}/public/stylesheets/" + file_name + ".css"
      end

      @png_from_table = image_from_table.to_img(:png)
    end
  end
end
