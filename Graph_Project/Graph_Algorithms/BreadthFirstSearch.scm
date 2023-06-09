(load "../Basic_Data_Types/set.scm")
(load "../Basic_Data_Types/graph.scm")
(load "../Basic_Data_Types/queue.scm")

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



