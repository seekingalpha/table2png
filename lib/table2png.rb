module Table2PNG 
  autoload :Converter, 'table2png/converter'

  def convert(html, width=nil)
    Converter.new(html, width).process
  end
end
