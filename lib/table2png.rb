module Table2PNG 
  autoload :Converter, 'table2png/converter'

  def convert(html, width=nil)
    IMGKit.configure do |config|
      binary_path = '/usr/local/bin/wkhtmltoimage'
      config.wkhtmltoimage = File.join("", binary_path)
    end

    Converter.new(html, width).process
  end
end
