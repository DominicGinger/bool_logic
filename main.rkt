(or #t #f)
(and #t #f)
(not #t)

(define (nand a b)
  (not (and (and a b) (and a #t))))
(define (xor a b)
  (and (or a b) (nand a b)))

(define (half-adder a b)
  (list (xor a b) (and a b)))

(half-adder #t #t)
(half-adder #t #f)
(half-adder #f #t)
(half-adder #f #f)

(define (full-adder a b c-in)
  (let* ((h1 (half-adder a b))
         (h2 (half-adder c-in (first h1)))
         (s (first h2))
         (c-out (or (second h1) (second h2))))
    (list s c-out)))

(full-adder #f #f #f)
(full-adder #f #f #t)
(full-adder #f #t #f)
(full-adder #f #t #t)
(full-adder #t #f #f)
(full-adder #t #f #t)
(full-adder #t #t #f)
(full-adder #t #t #t)


;; 4 bit adder
(define (four-bit-adder a b)
  (let* ((forth (full-adder (list-ref a 3) (list-ref b 3) #f))
         (third (full-adder (list-ref a 2) (list-ref b 2) (cadr forth)))
         (second (full-adder (list-ref a 1) (list-ref b 1) (cadr third)))
         (first (full-adder (list-ref a 0) (list-ref b 0) (cadr second))))
    (list (list (car first) (car second) (car third) (car forth)) (car first))))

(four-bit-adder (list #t #f #t #f) (list #f #t #f #t))

;; n bit adder
(define (bit-adder a b)
  (define (bit-adder-iter a b c)
    (if (= (length a) 0)
      (list)
      (let ([x (full-adder (car a) (car b) c)])
        (cons (car x)
              (bit-adder-iter (cdr a) (cdr b) (last x))))))
  (bit-adder-iter (reverse a) (reverse b) #f))
(bit-adder (list #t #f #t #f #t) (list #f #t #f #t #f))

