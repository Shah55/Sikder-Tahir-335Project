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

