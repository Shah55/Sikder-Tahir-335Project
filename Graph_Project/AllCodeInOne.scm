;; Check if an element is in a set
(define (set-member? set element)
  (cond ((null? set) #f)
        ((eq? (car set) element) #t)
        (else (set-member? (cdr set) element))))

;; Add an element to a set
(define (set-adjoin set element)
  (if (set-member? set element)
      set
      (cons element set)))

;; remove-duplicates implementation. Used ChatGPT for reference and assistance
(define (remove-duplicates lst)
  (define (helper lst seen)
    (cond ((null? lst) '())
          ((set-member? seen (car lst))
           (helper (cdr lst) seen))
          (else
           (cons (car lst)
                 (helper (cdr lst) (set-adjoin seen (car lst)))))))
  (helper lst '()))

;; Define a set as a list of unique elements
(define (make-set lst)
  (let ((unique-lst (remove-duplicates lst)))
    (if (null? unique-lst)
        '()
        (cons (car unique-lst) (make-set (cdr unique-lst))))))

;; Define a vertex as a symbol
(define (make-vertex name)
  name)

;; Define an edge as a pair of vertices
(define (make-edge v1 v2)
  (list (make-vertex v1) (make-vertex v2)))

;; Define a graph as a pair of sets of vertices and edges
(define (make-graph vertices edges)
  (list (make-set vertices) (make-set edges)))

;; Get all vertices in a graph
(define (graph-vertices graph)
  (car graph))

;; Get all edges in a graph
(define (graph-edges graph)
  (cdr graph))

;; Add a vertex to a graph
(define (add-vertex graph vertex)
  (list (set-adjoin (graph-vertices graph) (make-vertex vertex))
        (graph-edges graph)))

;; Add an edge to a graph
(define (add-edge graph edge)
  (list (graph-vertices graph)
        (set-adjoin (graph-edges graph) (make-edge (car edge) (cdr edge)))))

;; Check if a vertex is in a graph
(define (vertex-in-graph? graph vertex)
  (set-member? (graph-vertices graph) (make-vertex vertex)))

;; Check if an edge is in a graph
(define (edge-in-graph? graph edge)
  (let ((vertices (graph-vertices graph))
        (edge (make-edge (car edge) (cdr edge))))
    (or (set-member? (graph-edges graph) edge)
        (set-member? (graph-edges graph) (reverse edge)))))


;; Sample Usage

(set-member? '(a b c) 'd)
; #f
(set-member? '(a b c) 'c)
; #t

(set-adjoin '(1 2 4) 4)
; (1 2 4)
(set-adjoin '(1 2 4) 5)
; (5 1 2 4)

(make-set '(a b b c))
; (a b c)

(make-edge '(a b) '(c d))
; ((a b) (c d))

(define graph (make-graph '(a b c d) '((a b) (b c) (c d) (a c))))
(display graph)
(newline)
; '((a b c d) ((a b) (b c) (c d) (a c)))

(graph-vertices graph)
; (a b c d)

(graph-edges graph)
; (((a b) (b c) (c d) (a c)))

(vertex-in-graph? graph 'a)
;=> #t

(vertex-in-graph? graph 'e)
;=> #f

(add-vertex graph 'e)
;=> '((a b c d e) ((a b) (b c) (c d) (a c)))

(add-edge graph '(d e))
;=> '((a b c d e) ((a b) (b c) (c d) (a c) (d e)))

; This one is outputting wrong, need to fix this
(edge-in-graph? graph '(a b))
;=> #t

(edge-in-graph? graph '(a d))
;=> #f

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Queue Data Type:

; When thinking of implementing some of the algorithms such as BFS and DFS, it may be helpful to 
; implement a queue.

(define (make-empty-queue)
  '())

(define (enqueue val lst)
  (if (null? lst) (list val)
      (cons (car lst) (enqueue val (cdr lst)))))

(define (dequeue lst)
  (cdr lst))

(define (first lst)
  (car lst))

(define (empty? lst)
  (null? lst))

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



