; Stack Data Type:

; When thinking of implementing some of the algorithms such as BFS and DFS, it may be helpful to 
; implement a stack.

; This is provided by the professor:

(define (make-empty-stack)
  (lambda (x)
    'empty))


;; m is either 'top or 'pop
;; s is a stack
(define (push x s)
  (lambda (m)
    (cond ((eq? m 'top) x)
          ((eq? m 'pop) s))))

;; s is a stack
(define (top s)
  (s 'top))

;; s is a non-empty stack
(define (pop s)
  (s 'pop))


;; do you see how to use these?

;; first, set up some stacks 

(define stack-0 (make-empty-stack))

(define stack-1 (push 'a stack-0))

(define stack-2 (push 'b stack-1))

;; now some computations

(define stack-3 (push 'c (pop stack-2)))

(list (top stack-3) (top stack-2) (top stack-1))
