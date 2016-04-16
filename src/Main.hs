module Main where

fizzBuzz [x] = x
fizzBuzz x:xs = x mod 3
    main = do
        print "Hello, world."
        print fizzBuzz [1..10]