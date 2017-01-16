class BrainfuckTtanspiler  
  
  def initialize
    @numbers = []
    @brainfuck_code = []
  end
  
  def get_brainfuck_code
    input
    find_a_conclusion
    get_the_numbers_to_ASCII
    convert_brainfuck_code
    output_to_file
  end
  
  private
  
  attr_reader :file, :numbers, :text, :brainfuck_code

  def input
    File.open(ARGV[0]) do |review_file|
      @file = review_file.read
    end
  end
      
  def find_a_conclusion
    file =~ /^\s*puts\s["|']+?(.+)["|']+?\n/
    @text = $1.to_s.chars
  end
    
  def get_the_numbers_to_ASCII
    text.each do |word|
      @numbers << word.ord
    end    
  end
  
  def convert_brainfuck_code
    numbers.each do |number|
      @brainfuck_code << "+" * number.to_i + "."            
    end 
    
    @brainfuck_code = brainfuck_code.join
  end  
  
  def output_to_file      
    File.open(ARGV[1], "w") {|files| files.write brainfuck_code}    
  end
end

BrainfuckTtanspiler.new.get_brainfuck_code
