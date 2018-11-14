import math
import random
import times
import commandeer

# returns a random nucliotide char
proc random_nucliotide(): char =
  let nucliotides = ['G', 'A', 'T', 'C']
  return(nucliotides[rand(3)])

# generates and returns a block of DNA of "size" number of chars with a width of "width"
proc dnablock(size, width: int): string =
  var blk = ""
  for x in 0..<size div width:
    for x in 0..<width - 1: # subtrack 1 to account for the \n to keep size exact
      blk &= random_nucliotide()
    blk &= "\n"
  return(blk)

proc main() =
  commandline:
    option block_size, int, "block-size", "s", 1024
    option blocks, int, "block-count", "c", 1
    option width, int, "width", "w", 64
    option full_random, bool, "full-random", "r", false
    option benchmark, bool, "benchmark", "b", false
    exitoption "help", "h",
               "Usage: dnaspew [ --block-size=<int> (default: 1024)\n" &
               "                 --block-count=<int> (default: 1)\n" &
               "                 --width=<int> (default: 64)\n" &
               "                 --full-random (default: false)\n" &
               "                 --benchmark (default: false)\n" &
               "                 --help ]"
    errormsg "Error: please use --help for usage information"

  if width >= block_size:
    width = block_size - 1
  
  randomize(int(times.epochTime()))
  let start = epochTime()
  let dnablock = dnablock(block_size, width)
  for x in 1..blocks:
    if not full_random:
      stdout.write(dnablock)
    else:
      stdout.write(dnablock(block_size, width))
  
  if benchmark:
    let elapsed = epochTime() - start
    let total = block_size * blocks
    let rate = (total.float / elapsed) / 1024 / 1024
    stderr.write("\nElapsed time: " & $elapsed.round(4) & " seconds\n")
    stderr.write("Total data generated: " & $(total / 1024 / 1024).round(4) & " MiB\n")
    stderr.write("Rate: " & $rate.round(2) & " MiB/s\n")

when isMainModule:
  main()
