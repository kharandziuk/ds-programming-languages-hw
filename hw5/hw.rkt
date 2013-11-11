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
        [#t (let ([l (remainder n (length xs))])
              (car (list-tail xs l)))]))

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

(define (stream-add-zero stream)
  (let ([next (stream)])
    (lambda () 
      (cons (cons 0 (car next)) (stream-add-zero (cdr next))))))

(define (streamify full-xs)
  ; streamify list: '(1 2) -> (1 2 1 2 ..)
  ; don't work for empty lists
  (letrec ([aux (lambda (xs)
                  (cons (car xs) 
                        (lambda () (let ([cdr-xs (cdr xs)])
                                     (if (null? cdr-xs)
                                       (aux full-xs)
                                       (aux cdr-xs))
                                   ))))])
    (lambda () (aux full-xs))))

(define (cycle-lists xs ys)
  (letrec ([x-stream (streamify xs)]
           [y-stream (streamify ys)]
           [aux (lambda (l-stream r-stream)
            (let ([r-next (l-stream)]
                  [l-next (r-stream)])
            (cons 
              (cons (car r-next) (car l-next))
              (lambda () (aux (cdr r-next) (cdr l-next)))
              )))])
    (lambda () (aux x-stream y-stream))))

(define (vector-assoc v vec)
  (letrec ([len (vector-length vec)]
           [aux (lambda (n) (if (>= n len)
                    #f
                    (let ([cur (vector-ref vec n)])
                      (if (and (pair? cur) (equal? (car cur) v))
                        cur
                        (aux (+ 1 n))))
                    ))])
    (aux 0)))

(define (cached-assoc xs size)
  (letrec ([memo (make-vector size #f)]
           [pos 0]
           [f-set (lambda (x)
                    (begin
                           (vector-set! memo pos x)
                           (set! pos (if (= pos (- size 1)) 0 (+ pos 1)))
                           x))]
           [aux (lambda (x)
                  (let ([ans (vector-assoc x memo)])
                    (if ans
                      ans
                      (let ([ans (assoc x xs)])
                        (if ans (f-set ans) #f)))))])
    aux))

(define-syntax while-less
  (syntax-rules (do)
    [(while-less edge do body)
      (let ([t-edge edge])
        (letrec ([aux (lambda () (if (>= body t-edge) #t (aux)))])
          (aux)))]
  ))
