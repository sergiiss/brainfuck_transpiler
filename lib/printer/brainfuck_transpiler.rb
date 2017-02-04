class BrainfuckTranspiler
  attr_reader :file

  def initialize(file)
    @file = file

    @numbers = []
    @brainfuck_code = []
  end

  def get_brainfuck_code
    find_puts
    convert_text_to_numbers
    convert_numbers_to_brainfuck_code
  end

  private

  attr_reader :text, :numbers, :brainfuck_code, :number, :difference_of_numbers

  def find_puts
    file =~ /^\s*puts\s["|']+?(.+)["|']+?$/
    @text = $1.to_s.chars
  end

  def convert_text_to_numbers
    text.each do |word|
      @numbers << word.ord
    end
  end

  def convert_numbers_to_brainfuck_code
    add_the_first_character
    add_the_rest_of_the_characters

    @brainfuck_code = brainfuck_code.join
  end

  def add_the_first_character
    @number = @numbers.shift
    @brainfuck_code << '+' * number + '.'
  end

  def add_the_rest_of_the_characters
    numbers.each do |num|
      @difference_of_numbers = number - num
      check_used_symbol
      @number = num
    end
  end

  def check_used_symbol
    if difference_of_numbers.to_s.chars.first == '-'
      @brainfuck_code << '-' * difference_of_numbers.abs + '.'
    else
      @brainfuck_code << '+' * difference_of_numbers + '.'
    end
  end
end
