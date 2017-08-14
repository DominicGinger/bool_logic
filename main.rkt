#lang racket

(define (bit-not x)
  (cond ((= x 1) 0)
        ((= x 0) 1)))
(define (bit-and a b)
  (if (and (= a b) (= a 1)) 1 0))
(define (bit-or a b)
  (if (or (= a 1) (= b 1)) 1 0))

(define (nand a b)
  (bit-not (bit-and a b)))
(define (xor a b)
  (bit-and (bit-or a b) (nand a b)))

(define (half-adder a b)
  (list (xor a b) (bit-and a b)))

(define (full-adder a b c-in)
  (let* ((h1 (half-adder a b))
         (h2 (half-adder c-in (first h1)))
         (s (first h2))
         (c-out (bit-or (second h1) (second h2))))
    (list s c-out)))

(define (n-bit-adder a b)
  (define (pad x n)
    (if (< n 1)
      x 
      (append (build-list n (const 0)) x)))

  (define (pad-list a b)
    (let ([length-diff (- (length a) (length b))])
    (values (cons 0 (pad a (- length-diff)))
            (cons 0 (pad b length-diff)))))

  (define (bit-adder-iter a b c)
    (if (= (length a) 0)
      '()
      (let ([x (full-adder (car a) (car b) c)])
        (cons (car x) (bit-adder-iter (cdr a) (cdr b) (last x))))))

  (define (un-pad x)
    (if (= (car x) 0)
      (un-pad (cdr x))
      x))

  (let*-values ([(a b) (pad-list a b)]
                [(result) (reverse (bit-adder-iter (reverse a) (reverse b) 0))])
               (un-pad result)))

(provide 
  bit-not
  bit-and
  bit-or
  nand
  xor
  half-adder
  full-adder
  n-bit-adder)

