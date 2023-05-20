;; We need a queue implented in terms of 2 stacks here

(load "../Basic-Data-Types/stack.scm")

;; This implementation is based on the Professors code for stacks

;; Note: this implementation of a queue using two stacks requires it to reverse the stack when dequeuing
;; which can prove to not be as efficient compared to other implementations.

    ;; q is a queue
    (define (enqueue-2 x q)
      (push x q))

    ;; q is a non-empty queue
    (define (dequeue-2 q)
      (let ((reversed (reverse-stack q)))
        (let ((x (top-stack reversed)))
          (cons (pop-stack reversed) x))))

    ;; q is a queue
    (define (empty-queue? q)
      (empty-stack? q))

    dispatch)

  (cond ((eq? m 'proc) (procedural-rep))
        ((eq? m 'list) (list-rep))))

;; Sample uses

(define make-empty-queue ((stack-reps 'proc) 'make-empty))
(define enqueue ((stack-reps 'proc) 'enqueue))
(define dequeue ((stack-reps 'proc) 'dequeue))
(define empty-queue? ((stack-reps 'proc) 'empty-queue?))

(define queue-1 (enqueue 'a make-empty-queue))
(define queue-2 (enqueue 'b queue-1))
(define queue-3 (dequeue queue-2))

(display (dequeue queue-3))        ; Output: a
(newline)

(display (dequeue queue-3))        ; Output: b
(newline)

(display (empty-queue? queue-3))   ; Output: #t (since the queue is empty)
(newline)
