(or 1 0)
(and 1 0)
(not 1)
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

(half-adder 1 1)
(half-adder 1 0)
(half-adder 0 1)
(half-adder 0 0)

(define (full-adder a b c-in)
  (let* ((h1 (half-adder a b))
         (h2 (half-adder c-in (first h1)))
         (s (first h2))
         (c-out (bit-or (second h1) (second h2))))
    (list s c-out)))

(full-adder 0 0 0)
(full-adder 0 0 1)
(full-adder 0 1 0)
(full-adder 0 1 1)
(full-adder 1 0 0)
(full-adder 1 0 1)
(full-adder 1 1 0)
(full-adder 1 1 1)

;; 4 bit adder
(define (four-bit-adder a b)
  (let* ((forth (full-adder (list-ref a 3) (list-ref b 3) 0))
         (third (full-adder (list-ref a 2) (list-ref b 2) (cadr forth)))
         (second (full-adder (list-ref a 1) (list-ref b 1) (cadr third)))
         (first (full-adder (list-ref a 0) (list-ref b 0) (cadr second))))
    (list (list (car first) (car second) (car third) (car forth)) (car first))))

(four-bit-adder (list 1 0 1 0) (list 0 1 0 1))

;; n bit adder
(define (bit-adder a b)
  (define (bit-adder-iter a b c)
    (if (= (length a) 0)
      (list)
      (let ([x (full-adder (car a) (car b) c)])
        (cons (car x) (bit-adder-iter (cdr a) (cdr b) (last x))))))
  (reverse (bit-adder-iter (reverse a) (reverse b) 0)))
(bit-adder (list 1 0 1 0 1) (list 0 1 0 1 0))

(bit-adder (list 0 1) (list 0 1))
(four-bit-adder (list 0 0 0 1) (list 0 0 0 1))
(bit-adder (list 0 0 0 1) (list 0 0 0 1))

