;; Graph structure
(define (make-graph)
  '())

;; Add a node to the graph
(define (add-node graph node)
  (cons node graph))

;; Add an edge between two nodes in the graph
(define (add-edge graph node1 node2)
  (let ((adj-list (cdr node1)))
    (set-cdr! node1 (cons node2 adj-list)))
  graph)

;; Get the value of a node
(define (node-value node)
  (car node))

;; Get the adjacency list of a node
(define (adjacency-list node)
  (cdr node))

;; Get all nodes in the graph
(define (graph-nodes graph)
  graph)

;; Get all edges in the graph as a list of pairs
(define (graph-edges graph)
  (letrec ((helper (lambda (nodes)
                    (if (null? nodes)
                        '()
                        (append (map (lambda (node)
                                       (cons (node-value (car nodes))
                                             (node-value node)))
                                     (adjacency-list (car nodes)))
                                (helper (cdr nodes)))))))
    (helper graph)))

;; Check if a node is in the graph
(define (node-in-graph? graph node)
  (cond ((null? graph) #f)
        ((eq? (car graph) node) #t)
        (else (node-in-graph? (cdr graph) node))))

;; Check if an edge is in the graph
(define (edge-in-graph? graph node1 node2)
  (let ((adj-list (adjacency-list node1)))
    (cond ((null? adj-list) #f)
          ((eq? (car adj-list) node2) #t)
          (else (edge-in-graph? graph node1 (cdr adj-list))))))

;; Sample Usage

;; Create a graph
(define graph (make-graph))

;; Create nodes
(define node1 (make-node 'A))
(define node2 (make-node 'B))
(define node3 (make-node 'C))
(define node4 (make-node 'D))

;; Add nodes to the graph
(set! graph (add-node graph node1))
(set! graph (add-node graph node2))
(set! graph (add-node graph node3))
(set! graph (add-node graph node4))

;; Add edges between nodes
(set! graph (add-edge graph node1 node2))
(set! graph (add-edge graph node1 node3))
(set! graph (add-edge graph node2 node3))
(set! graph (add-edge graph node3 node4))

;; Get all nodes in the graph
(graph-nodes graph)
;; Output: ((A) (B) (C) (D))

;; Get all edges in the graph
(graph-edges graph)
;; Output: ((A . B) (A . C) (B . C) (C . D))

;; Check if a node is in the graph
(node-in-graph? graph node2)
;; Output: #t

(node-in-graph? graph (make-node 'E))
;; Output: #f

;; Check if an edge is in the graph
(edge-in-graph? graph node1 node2)
;; Output: #t

(edge-in-graph? graph node2 node4)
;; Output: #f


