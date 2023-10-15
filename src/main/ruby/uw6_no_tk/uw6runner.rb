# University of Washington, Programming Languages, Homework 6, hw6runner.rb

require_relative './uw6provided'
require_relative '../uw6/uw6assignment'

def runTetris
  Tetris.new 
  mainLoop
end

def runMyTetris
  MyTetris.new
  mainLoop
end

if ARGV.count == 0
  runMyTetris
elsif ARGV.count != 1
  puts "usage: uw6runner.rb [enhanced | original]"
elsif ARGV[0] == "enhanced"
  runMyTetris
elsif ARGV[0] == "original"
  runTetris
else
  puts "usage: uw6runner.rb [enhanced | original]"
end

