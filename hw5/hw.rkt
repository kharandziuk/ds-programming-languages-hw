#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

; problem 1
(define (sequence low high step)
  (if (> low high)
    null
    (cons low (sequence (+ low step) high step))))

; problem 2
(define (string-append-map xs suffix)
  (map (lambda (str) (string-append str suffix)) xs))

; problem 3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs n))]))

; problem 4
(define (stream-for-n-steps stream n)
  (if (= n 0)
    null
    (let ([next (stream)])
      (cons (car next) (stream-for-n-steps (cdr next) (- n 1))))
  )
)

(define funny-number-stream 
  (letrec ([prod (lambda (num)
              (if (= (remainder num 5) 0) (- num) num))]
           [result (lambda (x)
              (cons (prod x) (lambda () (result (+ x 1)))))])
    (lambda () (result 1))))

(define dan-then-dog
  (letrec ([dan (lambda () (cons "dan.jpg" dog))]
           [dog (lambda () (cons "dog.jpg" dan))])
    dan))


