require_relative 'printer/brainfuck_transpiler'

class Printer
  attr_reader :file

  def print
    read_input_file
    convert_code
    write_output_file
  end

  def read_input_file
    @file = File.open(ARGV[0]) { |review_file| review_file.read }
  end

  def convert_code
    brainfuck_transpiler = BrainfuckTranspiler.new(file)
    brainfuck_transpiler.get_brainfuck_code
  end

  def write_output_file
    File.open(ARGV[1], 'w') { |files| files.write convert_code }
  end
end