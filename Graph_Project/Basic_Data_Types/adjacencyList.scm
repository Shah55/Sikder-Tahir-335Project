;; Lets start creating the adjacency list representation of graphs
;; Similar to creating the regular graph representation, we have to make sure to keep the 
;; property of having graphs being a SET of edges and vertices

(load "../Basic-Data-Types/set.scm")

;; Define a vertex as an element in the set
(define (make-vertex name)
  name)

;; Define an edge as a pair of vertices
(define (make-edge v1 v2)
  (cons (make-vertex v1) (make-vertex v2)))

;; Define a graph as a pair of adjacency lists for vertices and edges
(define (make-graph vertex-list edge-list)
  (cons (make-adjacency-lists vertex-list edge-list)
        (make-set edge-list)))

;; Define an adjacency list as a pair of a vertex and a list of adjacent vertices
(define (make-adjacency-list vertex adjacent-vertices)
  (cons vertex adjacent-vertices))

;; Get all vertices in a graph
(define (graph-vertices graph)
  (map car (car graph)))

;; Get all edges in a graph
(define (graph-edges graph)
  (cdr graph))

;; Add a vertex to a graph
(define (add-vertex graph vertex)
  (cons (cons (make-vertex vertex) '())
        (graph-edges graph)))

;; Add an edge to a graph
(define (add-edge graph edge)
  (let ((v1 (car edge))
        (v2 (cdr edge)))
    (let ((adjacency-lists (car graph)))
      (let ((adjacency-list (assoc v1 adjacency-lists)))
        (if adjacency-list
            (cons (cons v1 (set-adjoin (cdr adjacency-list) v2))
                  (graph-edges graph))
            graph)))))

;; Check if a vertex is in a graph
(define (vertex-in-graph? graph vertex)
  (set-member? (map car (car graph)) (make-vertex vertex)))

;; Check if an edge is in a graph
(define (edge-in-graph? graph edge)
  (set-member? (graph-edges graph) edge))

;; Get the adjacency list for a vertex in a graph
(define (get-adjacency-list graph vertex)
  (let ((adjacency-lists (car graph)))
    (let ((adjacency-list (assoc (make-vertex vertex) adjacency-lists)))
      (if adjacency-list
          (cdr adjacency-list)
          '()))))

;; Check if two vertices are adjacent in a graph
(define (adjacent? graph v1 v2)
  (let ((adjacency-list (get-adjacency-list graph v1)))
    (set-member? adjacency-list (make-vertex v2))))

;; Sample usage:

;; Create a graph with vertices and edges
(define my-graph (make-graph '(a b c d) '((a . b) (b . c) (c . d) (d . a))))

;; Check if 'a' is a vertex in the graph
(vertex-in-graph? my-graph 'a)
;; Output: #t

;; Check if 'x' is a vertex in the graph
(vertex-in-graph? my-graph 'x)
;; Output: #f

;; Check if the edge '(a . b)' is in the graph
(edge-in-graph? my-graph '(a . b))
;; Output: #t

;; Check if the edge '(b . d)' is in the graph
(edge-in-graph? my-graph '(b . d))
;; Output: #f

;; Check if vertices 'a' and 'b' are adjacent in the graph
(adjacent? my-graph 'a 'b)
;; Output: #t

;; Check if vertices 'c' and 'd' are adjacent in the graph
(adjacent? my-graph 'c 'd)
;; Output: #t

;; Check if vertices 'a' and 'c' are adjacent in the graph
(adjacent? my-graph 'a 'c)
;; Output: #f

;; Get the adjacency list for vertex 'a' in the graph
(get-adjacency-list my-graph 'a)
;; Output: (b)

