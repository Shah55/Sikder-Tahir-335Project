(load "../Basic_Data_Types/set.scm")
(load "../Basic_Data_Types/graph.scm")

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
