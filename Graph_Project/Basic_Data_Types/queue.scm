; Queue Data Type:

; When thinking of implementing some of the algorithms such as BFS and DFS, it may be helpful to 
; implement a queue.

(define (make-empty-queue)
  '())

(define (first lst)
  (car lst))

(define (empty? lst)
  (null? lst))

(define (enqueue val lst)
  (if (null? lst) (list val)
      (cons (car lst) (enqueue val (cdr lst)))))

(define (dequeue lst)
  (cdr lst))

(define (size lst)
  (define (helper lst acc)
    (if (null? lst) acc
        (helper (cdr lst) (+ acc 1))))
  (helper lst 0))

(define q0 (make-empty-queue))
(define q1 (enqueue 'a q0))
(define q2 (enqueue 'b q1))
(define q3 (enqueue 'c q2))

(enqueue 'd q3)
; (a b c d)
(dequeue q3)
; (b c)
(first q3)
; a
(empty? q3)
; #f
(size q3)
; 3

(define (make-queue-2 start-node)
  (list start-node))