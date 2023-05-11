; Graph Data Type:

;; lets first make a graph datatype 

;; This defines a graph as a list of vertices and edges
(define (make-graph vertices edges)
  (list vertices edges))

;; Define an edge as a pair of vertices
(define (make-edge v1 v2)
  (cons v1 v2))

;; Get all vertices in a graph
(define (graph-vertices graph)
  (car graph))

;; Get all edges in a graph
(define (graph-edges graph)
  (cdr graph))

;; Add a vertex to a graph
(define (add-vertex graph vertex)
  (cons (cons vertex (graph-vertices graph)) (graph-edges graph)))

;; Add an edge to a graph
(define (add-edge graph edge)
  (cons (graph-vertices graph) (cons edge (graph-edges graph))))

; Defining member, which was taken from The Little Schemer as reference
(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
                (member? a (cdr lat)))))))

;; Check if a vertex is in a graph
(define (vertex-in-graph? graph vertex)
  (member? vertex (graph-vertices graph)))

;; Check if an edge is in a graph
(define (edge-in-graph? graph edge)
  (member? edge (graph-edges graph)))

; Cant get these last 2 functions to not just output empty lists. Need to work on this or figure something else out

(define (filter pred lst)
  (cond
    ((null? lst) '())
    ((pred (car lst)) (cons (car lst) (filter pred (cdr lst))))
    (else (filter pred (cdr lst)))))

;; Get all edges that connect a vertex to other vertices in a graph
(define (vertex-edges graph vertex)
  (filter (lambda (edge) (member vertex edge)) (graph-edges graph)))

;; Get all vertices that are connected to a vertex in a graph
(define (connected-vertices graph vertex)
  (map (lambda (edge) (if (eq? vertex (car edge)) (cdr edge) (car edge))) (vertex-edges graph vertex)))