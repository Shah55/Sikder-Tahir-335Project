; Our code from all files. 

; Set Data Type:

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

;; Returns empty list to represent empty set
(define (make-empty-set)
  '())

;; Remove specific element from set
(define (set-remove set element)
  (cond ((null? set) '())
        ((eq? (car set) element) (cdr set))
        (else (cons (car set) (set-remove (cdr set) element)))))

;; Returns a new set that is the union of two sets.
(define (set-union set1 set2)
  (remove-duplicates (append set1 set2)))

;; Returns a new set that is the intersection of two sets.
(define (set-intersection set1 set2)
  (cond
    ((null? set1) '())              
    ((set-member? set2 (car set1)) 
     (cons (car set1) (set-intersection (cdr set1) set2)))
    (else (set-intersection (cdr set1) set2)))) 

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
  (cadr graph))

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


(display "-------------------")
(newline)

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


(display "-------------------")
(newline)

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

(define (make-queue-2 start-node)
  (list start-node))

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

(set-union (make-set '(a b b c)) (make-set '(a e c)))

(set-intersection (make-set '(a b b c)) (make-set '(a e c)))

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

;; do you see how to use these?

;; first, set up some stacks 

(define stack-0 (make-empty-stack))

(define stack-1 (push 'a stack-0))

(define stack-2 (push 'b stack-1))

;; now some computations

(define stack-3 (push 'c (pop stack-2)))

(list (top stack-3) (top stack-2) (top stack-1))


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


(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Graph Data Type:

;; lets first make a graph datatype, but acknowledge the fact that a graph G is a SET of vertices V and edges E. 
;; Thus G = (V, E)

;; Define a vertex
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
  (cadr graph))

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
;; This does not work as it should!
(define (edge-in-graph? graph edge)
  (let ((vertices (graph-vertices graph))
        (edge (make-edge (car edge) (cdr edge))))
    (or (set-member? (graph-edges graph) edge)
        (set-member? (graph-edges graph) (reverse edge)))))

;; Get the neighbors of a vertex in a graph
(define (get-neighbors graph vertex)
  (let ((edges (graph-edges graph)))
    (foldl (lambda (edge acc)
             (if (eq? (car edge) vertex)
                 (cons (cadr edge) acc)
                 (if (eq? (cadr edge) vertex)
                     (cons (car edge) acc)
                     acc)))
           '()
           edges)))

;; Foldl implementation
(define (foldl func acc lst)
  (if (null? lst)
      acc
      (foldl func (func (car lst) acc) (cdr lst))))


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

; -------------------------------------------------------------------------------------------------------------



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Breadth First Search:

(define (bfs start-node graph)
  (define (bfs-helper visited queue)
    (cond ((empty? queue) visited)
          (else
           (let ((node (first queue)))
             (if (set-member? visited node)
                 (bfs-helper visited (dequeue queue))
                 (let ((neighbors (get-neighbors node graph))
                       (visited (set-adjoin visited node)))
                   (bfs-helper visited (append (dequeue queue)
                                              (filter (lambda (neighbor)
                                                        (not (set-member? visited neighbor)))
                                                      (map make-vertex neighbors))))))))))

  (bfs-helper (set-adjoin (make-empty-set) start-node) (make-queue-2 start-node)))

(define graph (make-graph '(A B C D E)
                          '((A B) (A C) (B D) (B E) (C E) (D E))))

(bfs 'A graph)


; Depth First Search:

(define (dfs graph vertex)

  (let ((visited (make-empty-set))
        (result '()))

    (letrec
        ((dfs-visit
          (lambda (v visited result)
            (let ((new-visited (set-adjoin visited v))
                  (new-result (cons v result)))
              (let ((neighbors (get-neighbors graph v)))
                (foldl
                 (lambda (neighbor acc)
                   (if (set-member? new-visited neighbor)
                       acc
                       (dfs-visit neighbor new-visited acc)))
                 new-result
                 neighbors))))))

      (reverse (dfs-visit vertex visited result)))))

(define graph (make-graph '(A B C D E F G)
                         '((A B) (A C) (B D) (B E) (C F) (C G) (E F))))

(display (dfs graph 'A))



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Dijkstra's (Shortest Path):

(define (dijkstra graph start end)
  ;; takes a node and returns its weight
  (define (node-weight node)
    (cdr node))

  ;; takes a vertex and weight and constructs node
  (define (node vertex weight)
    (cons vertex weight))

  ;; creates a node
  (define (make-node vertex weight)
    (cons vertex weight))

  ;; returns a list representing the distances to the neighbors of the node  
  (define (update-distances-from-node current distances)
    (let ((current-distance (node-weight (assoc (node current) distances))))
      (map (lambda (edge)
             (let* ((neighbor-vertex (car edge))
                    (neighbor-distance (cdr (assoc neighbor-vertex distances)))
                    (new-distance (+ current-distance (cadr edge))))
               (if (or (not neighbor-distance) (< new-distance neighbor-distance))
                   (make-node neighbor-vertex new-distance)
                   (make-node neighbor-vertex neighbor-distance))))
           (assoc (node current) graph))))


  ;; Insertion sort function for the queue
  (define (insertion-sort queue)
    (define (insert node sorted-list)
      (if (null? sorted-list)
          (list node)
          (if (< (node-weight node) (node-weight (car sorted-list)))
              (cons node sorted-list)
              (cons (car sorted-list) (insert node (cdr sorted-list))))))
    (define (sort-list unsorted sorted)
      (if (null? unsorted)
          sorted
          (sort-list (cdr unsorted) (insert (car unsorted) sorted))))
    (sort-list (cdr queue) (list (car queue))))


  (let iter ((queue (list (make-node start 0)))
             (visited '())
             (distances (list (make-node start 0))))
    (if (null? queue) #f
        (let* ((queue (insertion-sort queue))
               (current (car queue))
               (queue (cdr queue)))
          (cond ((equal? (node current) end) (node-weight current))
                ((member (node current) visited) (iter queue visited distances))
                (else (iter (append queue (update-distances-from-node current distances))
                            (cons (node current) visited)
                            (update-distances-from-node current distances))))))))


; (define graph (make-graph '(A B C D E)
;                          '((A B) (A C) (B D) (B E) (C E) (D E))))

; (dijkstra graph 'A 'E)



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; BFS Graph Computation:

(define graph (make-graph '(A B C D E)
                          '((A B) (A C) (B D) (B E) (C E) (D E))))

(bfs 'A graph)



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; DFS Graph Computation:

(define graph (make-graph '(A B C D E F G)
                          '((A B) (A C) (B D) (B E) (C F) (C G) (E F))))

(display (dfs graph 'A))



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Dijkstra's Algorithm Computation:

(define graph (make-graph '(A B C D E)
                          '((A B) (A C) (B D) (B E) (C E) (D E))))

(dijkstra graph 'A 'E) ; 6



(display "-------------------")
(newline)

