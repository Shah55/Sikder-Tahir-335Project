;(load "../Basic_Data_Types/set.scm")
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

;; Example:

;(define graph (make-graph '(A B C D E)
;                          '((A B) (A C) (B D) (B E) (C E) (D E))))

;(dijkstra graph 'A 'E) ; 6