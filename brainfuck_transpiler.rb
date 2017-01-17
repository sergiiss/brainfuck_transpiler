class BrainfuckTtanspiler
  def initialize
    @numbers = []
    @brainfuck_code = []
  end
  
  def get_brainfuck_code
    read_input_file
    find_puts
    convert_text_to_numbers
    convert_numbers_to_brainfuck_code
    write_output_file
  end
  
  private
  
  attr_reader :file, :numbers, :text, :brainfuck_code

  def read_input_file
    File.open(ARGV[0]) do |review_file|
      @file = review_file.read
    end
  end
      
  def find_puts
    file =~ /^\s*puts\s["|']+?(.+)["|']+?\n/
    @text = $1.to_s.chars
  end
    
  def convert_text_to_numbers
    text.each do |word|
      @numbers << word.ord
    end    
  end
  
  def convert_numbers_to_brainfuck_code
    numbers.each do |number|
      @brainfuck_code << "+" * number + "."            
    end 
    
    @brainfuck_code = brainfuck_code.join
  end  
  
  def write_output_file      
    File.open(ARGV[1], "w") {|files| files.write brainfuck_code}    
  end
end

transpiler = BrainfuckTtanspiler.new
transpiler.get_brainfuck_code
