; Code doesn't work properly, need to fix 

(load "../Basic-Data-Types/set.scm")
(load "../Basic-Data-Types/queue.scm")

(define (dijkstra graph start)
  ;; Create a set to store visited vertices
  (define visited (make-empty-set))
  
  ;; Create a queue to store vertices to visit
  (define queue (make-empty-queue))
  
  ;; Create a list to store distances from the start vertex
  (define distances (list (cons start 0)))
  
  ;; Helper function to get the distance for a vertex
  (define (get-distance vertex)
    (cdr (assoc vertex distances)))
  
  ;; Helper function to update the distance for a vertex
  (define (update-distance vertex distance)
    (set! distances (cons (cons vertex distance) (set-remove distances (assoc vertex distances)))))
  
  ;; Helper function to get the unvisited neighbor with the minimum distance
  (define (get-min-distance-neighbor neighbors)
    (if (empty? (cdr neighbors))
        (car neighbors)
        (let* ((min-rest (get-min-distance-neighbor (cdr neighbors)))
               (min-neighbor (car min-rest))
               (min-distance (get-distance min-neighbor))
               (current-neighbor (car neighbors))
               (current-distance (get-distance current-neighbor)))
          (if (< current-distance min-distance)
              (cons current-neighbor current-distance)
              min-rest))))
  
  ;; Add the start vertex to the queue
  (enqueue start queue)
  
  ;; Recursive helper function to visit vertices
  (define (visit-vertices)
    (if (empty-queue? queue)
        ;; No more vertices to visit, return the distances
        distances
        (let* ((current-vertex (dequeue queue))
               (current-distance (get-distance current-vertex)))
          (if (set-member? visited current-vertex)
              ;; Vertex already visited, continue to the next iteration
              (visit-vertices)
              (begin
                ;; Mark the current vertex as visited
                (set! visited (set-adjoin visited current-vertex))
                
                ;; Get the neighbors of the current vertex
                (let ((neighbors (get-neighbors graph current-vertex)))
                  ;; Update the distances for the neighbors
                  (let update-distances ((neighbors neighbors))
                    (if (not (null? neighbors))
                        (let* ((neighbor-vertex (car (car neighbors)))
                               (neighbor-distance (+ current-distance (edge-weight graph current-vertex neighbor-vertex))))
                          (if (or (not (set-member? visited neighbor-vertex))
                                  (< neighbor-distance (get-distance neighbor-vertex)))
                              (begin
                                (update-distance neighbor-vertex neighbor-distance)
                                (update-distances (cdr neighbors))))
                              (update-distances neighbors)))))
                  ;; Enqueue the unvisited neighbors
                  (let enqueue-neighbor ((neighbors neighbors))
                    (if (not (null? neighbors))
                        (let ((neighbor-vertex (car (car neighbors))))
                          (if (not (set-member? visited neighbor-vertex))
                              (begin
                                (enqueue neighbor-vertex queue)
                                (enqueue-neighbor (cdr neighbors)))))))
                  ;; Continue to the next iteration
                  (visit-vertices)))))))

;; Example usage

;; Define the graph
(define vertices '(A B C D E))
(define edges '((A B 1) (A C 4) (B D 6) (C D 3) (D E 2)))

;; Create a function to retrieve neighbors of a vertex
(define (get-neighbors graph vertex)
  (filter (lambda (edge)
            (let ((v1 (car edge))
                  (v2 (cadr edge))
                  (weight (caddr edge)))
              (if (eq? vertex v1)
                  v2
                  (if (eq? vertex v2)
                      v1
                      #f))))
          edges))

;; Create a function to retrieve the weight of an edge
(define (edge-weight graph v1 v2)
  (let ((edge (assoc v1 (assoc v2 graph))))
    (if edge
        (caddr edge)
        #f)))

;; Create the graph
(define graph (list->graph vertices edges))

;; Perform Dijkstra's algorithm
(dijkstra graph 'A)
