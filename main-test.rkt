#lang racket/base

(require "main.rkt")

(module+ test
         (require rackunit rackunit/text-ui)

         (define suite
           (test-suite
             "Boolean logic, basic circuits"

             (test-eqv? "bit-not-1" (bit-not 1) 0)
             (test-eqv? "bit-not-0" (bit-not 0) 1)

             (test-eqv? "bit-and-1-1" (bit-and 1 1) 1)
             (test-eqv? "bit-and-1-0" (bit-and 1 0) 0)
             (test-eqv? "bit-and-0-1" (bit-and 0 1) 0)
             (test-eqv? "bit-and-0-0" (bit-and 0 0) 0)

             (test-eqv? "bit-or-1-1" (bit-or 1 1) 1)
             (test-eqv? "bit-or-1-0" (bit-or 1 0) 1)
             (test-eqv? "bit-or-0-1" (bit-or 0 1) 1)
             (test-eqv? "bit-or-0-0" (bit-or 0 0) 0)

             (test-eqv? "nand-1-1" (nand 1 1) 0)
             (test-eqv? "nand-1-0" (nand 1 0) 1)
             (test-eqv? "nand-0-1" (nand 0 1) 1)
             (test-eqv? "nand-0-0" (nand 0 0) 1)

             (test-eqv? "xor-1-1" (xor 1 1) 0)
             (test-eqv? "xor-0-1" (xor 1 0) 1)
             (test-eqv? "xor-1-0" (xor 0 1) 1)
             (test-eqv? "xor-0-0" (xor 0 0) 0)

             (test-equal? "half-adder-1-1" (half-adder 1 1) '(0 1))
             (test-equal? "half-adder-1-0" (half-adder 1 0) '(1 0))
             (test-equal? "half-adder-0-1" (half-adder 0 1) '(1 0))
             (test-equal? "half-adder-0-0" (half-adder 0 0) '(0 0))

             (test-equal? "full-adder-1-1-1" (full-adder 1 1 1) '(1 1))
             (test-equal? "full-adder-1-1-0" (full-adder 1 1 0) '(0 1))
             (test-equal? "full-adder-1-0-1" (full-adder 1 0 1) '(0 1))
             (test-equal? "full-adder-0-1-1" (full-adder 0 1 1) '(0 1))
             (test-equal? "full-adder-1-0-0" (full-adder 1 0 0) '(1 0))
             (test-equal? "full-adder-0-0-1" (full-adder 0 0 1) '(1 0))
             (test-equal? "full-adder-0-1-0" (full-adder 0 1 0) '(1 0))
             (test-equal? "full-adder-0-0-0" (full-adder 0 0 0) '(0 0))

             (test-equal? "n-bit-adder" (n-bit-adder '(1 0 1 0 1) '(0 1 0 1 0)) '(1 1 1 1 1))
             (test-equal? "n-bit-adder" (n-bit-adder '(0 1) '(0 1)) '(1 0))
             (test-equal? "n-bit-adder" (n-bit-adder '(0 0 0 1) '(0 0 0 1)) '(1 0))
             (test-equal? "n-bit-adder" (n-bit-adder '(0 1 1 0 1 0 1) '(0 0 0 1 1 0 0))
                          '(1 0 0 0 0 0 1))
             (test-equal? "n-bit-adder" (n-bit-adder '(1 1 0 0 1 0 0) '(0 1 1 0 0 1 0))
                          '(1 0 0 1 0 1 1 0))
             (test-equal? "n-bit-adder" (n-bit-adder '(1 1 1 1 1 1 1) '(1 1 1 1 1 1 1))
                          '(1 1 1 1 1 1 1 0))
             (test-equal? "n-bit-adder" (n-bit-adder '(1) '(1 1)) '(1 0 0))
             (test-equal? "n-bit-adder" (n-bit-adder '(1 0 0 1) '(1 1)) '(1 1 0 0))
             (test-equal? "n-bit-adder" (n-bit-adder '(1 1 1 1 1 1 1 1) '(1))
                          '(1 0 0 0 0 0 0 0 0))))

         (run-tests suite))

