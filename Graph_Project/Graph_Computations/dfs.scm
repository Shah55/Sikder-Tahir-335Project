(load "../Graph_Algorithms/DepthFirstSearch.scm")

(define graph (make-graph '(A B C D E F G)
                          '((A B) (A C) (B D) (B E) (C F) (C G) (E F))))

(display (dfs graph 'A))