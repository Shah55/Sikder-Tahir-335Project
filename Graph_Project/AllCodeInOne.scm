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

; Queue as Two Stacks:

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


(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "../Basic-Data-Types/set.scm")

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

;; We have this representation but Professor Troeger mentioned that in actuality, graphs are defined as a SET of 
;; vertices and edges, rather than a list. So this is essentially wrong.

;; This defines a graph as a list of vertices and edges
; (define (make-graph vertices edges)
;   (list vertices edges))

; ;; Define an edge as a pair of vertices
; (define (make-edge v1 v2)
;   (cons v1 v2))

; ;; Get all vertices in a graph
; (define (graph-vertices graph)
;   (car graph))

; ;; Get all edges in a graph
; (define (graph-edges graph)
;   (cdr graph))

; ;; Add a vertex to a graph
; (define (add-vertex graph vertex)
;   (cons (cons vertex (graph-vertices graph)) (graph-edges graph)))

; ;; Add an edge to a graph
; (define (add-edge graph edge)
;   (cons (graph-vertices graph) (cons edge (graph-edges graph))))

; ; Defining member, which was taken from The Little Schemer as reference
; (define member?
;   (lambda (a lat)
;     (cond
;       ((null? lat) #f)
;       (else (or (eq? (car lat) a)
;                 (member? a (cdr lat)))))))

; ;; Check if a vertex is in a graph
; (define (vertex-in-graph? graph vertex)
;   (member? vertex (graph-vertices graph)))

; ;; Check if an edge is in a graph
; (define (edge-in-graph? graph edge)
;   (member? edge (graph-edges graph)))

; ; Cant get these last 2 functions to not just output empty lists. Need to work on this or figure something else out

; (define (filter pred lst)
;   (cond
;     ((null? lst) '())
;     ((pred (car lst)) (cons (car lst) (filter pred (cdr lst))))
;     (else (filter pred (cdr lst)))))

; ;; Get all edges that connect a vertex to other vertices in a graph
; (define (vertex-edges graph vertex)
;   (filter (lambda (edge) (member vertex edge)) (graph-edges graph)))

; ;; Get all vertices that are connected to a vertex in a graph
; (define (connected-vertices graph vertex)
;   (map (lambda (edge) (if (eq? vertex (car edge)) (cdr edge) (car edge))) (vertex-edges graph vertex)))



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Adjacency List:

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



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Adjacency Matrix:

;; This is my attempt at a adjacency matrix representation

; Create an empty adjacency matrix for a graph with num-nodes.
(define (make-adjacency-matrix num-nodes)
  (make-matrix num-nodes num-nodes 0))

; Add an edge between node1 and node2 in the adjacency matrix.
(define (add-edge adjacency-matrix node1 node2)
  (update-cell adjacency-matrix node1 node2 1))

; Remove the edge between node1 and node2 in the adjacency matrix.
(define (remove-edge adjacency-matrix node1 node2)
  (update-cell adjacency-matrix node1 node2 0))

; Update the value of the cell at row and col in the matrix.
(define (update-cell matrix row col value)
  (let ((new-row (update-list (matrix-ref matrix row) col value)))
    (update-list matrix row new-row)))

; Update the value at index in the list.
(define (update-list lst index value)
  (if (null? lst)
      '()
      (cons (if (= index 0) value (car lst))
            (update-list (cdr lst) (- index 1) value))))

; Get the row at the given index in the matrix.
(define (matrix-ref matrix row)
  (list-ref matrix row))

; Create a matrix with num-rows and num-cols, initialized with init-value.
(define (make-matrix num-rows num-cols init-value)
  (let ((row (make-row num-cols init-value)))
    (make-row num-rows row)))

; Create a row with size, initialized with value.
(define (make-row size value)
  (if (zero? size)
      '()
      (cons value (make-row (- size 1) value))))


;; Create an empty adjacency matrix for a graph with 4 nodes
(define adjacency-matrix (make-adjacency-matrix 4))
;; Output: '((0 0 0 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))

;; Add an edge between node 1 and node 2
(define adjacency-matrix (add-edge adjacency-matrix 1 2))
;; Output: '((0 1 0 0) (1 0 0 0) (0 0 0 0) (0 0 0 0))

;; Add an edge between node 2 and node 3
(define adjacency-matrix (add-edge adjacency-matrix 2 3))
;; Output: '((0 1 0 0) (1 0 1 0) (0 1 0 0) (0 0 0 0))

;; Remove the edge between node 1 and node 2
(define adjacency-matrix (remove-edge adjacency-matrix 1 2))
;; Output: '((0 0 0 0) (0 0 1 0) (0 1 0 0) (0 0 0 0))

(display adjacency-matrix)



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Breadth First Search:

(load "../Basic-Data-Types/set.scm")
(load "../Basic-Data-Types/graph.scm")
(load "../Basic-Data-Types/queue.scm")

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

  (bfs-helper (set-adjoin (make-empty-set) start-node) (make-queue start-node)))

(define graph (make-graph '(A B C D E)
                          '((A B) (A C) (B D) (B E) (C E) (D E))))

(bfs 'A graph)


; Depth First Search:

(load "../Basic-Data-Types/set.scm")
(load "../Basic-Data-Types/graph.scm")

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

;; (define graph (make-graph '(A B C D E F G)
;;                          '((A B) (A C) (B D) (B E) (C F) (C G) (E F))))

;; (display (dfs graph 'A))



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Dijkstra's (Shortest Path):

;(load "../Basic_Data_Types/set.scm")
;(load "../Basic-Data-Types/graph.scm")
;(load "../Basic_Data_Types/queue.scm")

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


  (let iter ((queue (list (make-node start 0)))
             (visited '())
             (distances (list (make-node start 0))))
    (if (null? queue) #f
        (let* ((queue (sort (lambda (x y) (< (node-weight x) (node-weight y))) queue))
               (current (car queue))
               (queue (cdr queue)))
          (cond ((equal? (node current) end) (node-weight current))
                ((member (node current) visited) (iter queue visited distances))
                (else (iter (append queue (update-distances-from-node current distances))
                            (cons (node current) visited)
                            (update-distances-from-node current distances))))))))


; (define graph (make-graph '(A B C D E)
;                          '((A B) (A C) (B D) (B E) (C E) (D E))))

; (dijkstra graph 'A 'E) ; 6



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; BFS Graph Computation:

(load "../Graph_Algorithms/BreadthFirstSearch.scm")

(define graph (make-graph '(A B C D E)
                          '((A B) (A C) (B D) (B E) (C E) (D E))))

(bfs 'A graph)



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; DFS Graph Computation:

(load "../Graph_Algorithms/DepthFirstSearch.scm")

(define graph (make-graph '(A B C D E F G)
                          '((A B) (A C) (B D) (B E) (C F) (C G) (E F))))

(display (dfs graph 'A))



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Dijkstra's Algorithm Computation:

(load "../Graph_Algorithms/Dijkstra's.scm")

(define graph (make-graph '(A B C D E)
                          '((A B) (A C) (B D) (B E) (C E) (D E))))

(dijkstra graph 'A 'E) ; 6



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; BFS Proof:

;; Working on implementing the bfs but the abstraction is making this exceptionally difficult. I hope to
;; get through it though

; Design Idea:

; The recursive BFS algorithm uses a helper function that takes two parameters: visited (the set of visited nodes) and queue (the queue of nodes to be processed).
; The base case is when the queue becomes empty, indicating that all nodes have been visited. In this case, the algorithm returns the set of visited nodes.
; In the recursive case, the algorithm processes the first node in the queue, checks if it has been visited, and updates the visited set accordingly.
; If the node has not been visited, its neighbors are obtained from the graph, and the algorithm enqueues the neighbors that have not been visited yet.
; The algorithm then recursively calls itself with the updated visited set and queue to continue the BFS process.

;; PROOF:

; Base Case: When the queue is empty, the algorithm correctly returns the set of visited nodes. 

; Inductive Hypothesis:

; Lets say that the recursive BFS algorithm correctly visits all nodes in a graph starting from any node n 
; and returns the set of visited nodes when the queue becomes empty.
; Assume it holds for all nodes that can be reached from n in k or fewer steps, where k is a positive integer.


; Inductive Step:

; We want to show that the IH holds for any node n in the graph, meaning the algorithm correctly visits all nodes 
; starting from n and returns the set of visited nodes when the queue becomes empty.

; In the recursive case of the algorithm, the first node node is dequeued from the queue, and if it has not been visited, 
; its neighbors are enqueued. Since all neighbors are reached from node in one step, they can be reached from n in k or 
; fewer steps. By the inductive hypothesis, the algorithm correctly visits all nodes starting from node and returns the set 
; of visited nodes when the queue becomes empty.



(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; DFS Proof:

;; Design Idea:

; The dfs function initializes an empty set called visited to keep track of the vertices that have been visited during the traversal. 
; It also creates an empty list called result to store the visited vertices in the order they are encountered.

; The DFS algorithm is implemented within the nested function dfs-visit. This function takes a vertex, the visited set, and the result list as parameters.

; dfs-visit:

; Marks the current vertex as visited by adding it to the visited set.
; Appends the current vertex to the result list, indicating that it has been visited.
; Retrieves the neighbors of the current vertex using the get-neighbors function.
; Iterates through each neighbor and recursively calls dfs-visit on unvisited neighbors, passing the updated visited and result values.
; This ensures that the algorithm explores all reachable vertices in a depth-first manner, following each path as far as possible before backtracking.
; The recursive calls continue until all reachable vertices from the current vertex have been visited.
; The dfs-visit function returns the updated result list.
; After defining dfs-visit, the dfs function invokes it with the starting vertex, the initial visited set, and the empty result list. 
; It then reverses the result list to obtain the vertices in the correct traversal order.

; The result is a list of visited vertices representing the DFS traversal order of the graph starting from the given vertex.

;; PROOF:

; Base Case: When the graph has only one vertex, the dfs function should return a list containing only that vertex. 

; Inductive Hypothesis: Assume that the dfs function correctly performs a depth-first search for any graph with k vertices, 
; where k <= n, and returns the expected list of visited vertices.

; Show that the dfs function correctly performs a depth-first search for a graph with n+1 vertices.

; The dfs-visit function is called for the starting vertex, marking it as visited and adding it to the result.
; The function recursively calls dfs-visit for each unvisited neighbor of the current vertex, accumulating the result.
; The final result is obtained by reversing the accumulated list.
; By the inductive hypothesis, we can conclude that the dfs function correctly performs a depth-first search for graphs 
; with k vertices, where k <= n. In the inductive step, we showed that the function correctly handles the case when the graph 
; has n+1 vertices based on the behavior of the dfs-visit function.


(display "-------------------")
(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Dijkstra's Algorithm Proof:

;; Design Idea:

; The function uses a recursive approach by defining a helper function that takes in three parameters (queu, visited, and distances). 
; The algorithm will select the node with the shortest distance from the queue by sorting the queue based on the weights of the nodes. 
; The selected node is checked to see if it is the destination node. If it is, the function returns the weight associated with the node,  
; representing the shortest path from the start node to the destination. If the selected node has already been visited, the function calls 
; itself again recursively. If the selected node has not been visied, the neighbors are then processed using the assoc function, which retrieves 
; the list of edges connected to the current node. For each neighbor, the function calculates the new distance by adding the current node's 
; distance and the weight of the connecting edge. If the neighbor has not been assigned a distance yet or if the new distance is shorter than 
; the existing one, a new node is created with the neighbor's vertex and the new distance. Otherwise, a node is created with the neighbor's 
; vertex and its existing distance. 


;; PROOF:

; Base Case: When the queue is empty, the function will return #f, which means no path exists from the start vertex to the end vertex.

; Inductive Hypothesis: Assume that for a graph of n vertices, the djikstra function will correctly find the shortest possible path 
; from the start vertex to any other vertex. 

; Show that the function correctly finds the shortest path between two vertices for a graph with n+1 vertices. 

; If the current vertex is in the 'iter' function is "end", the weight of the current node is returned, which is the base case. 
; If the current vertex is not the "end" vertex, the 'update-distances-from-node' function is utilized to calculate the new distance
; based on the current vertex and its neighbors. The dijkstra function explores all possible paths that exist in a given graph 
; and finds the shortest path from the start vertex to the end vertex.

