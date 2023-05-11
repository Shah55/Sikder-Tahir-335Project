(load "graph_datatype_computations.scm")

(define g (make-graph '(a b c) '((a . b) (b . c))))
(add-vertex g 'd)
;; Returns: ((d a b c) ((a . b) (b . c)))

(define f (make-graph '(1 2 3) '((1 . 2) (2 . 3))))
(add-vertex f '4)

(add-edge g '(a . d))
;; Returns: ((a b c) ((a . b) (b . c) (a . d)))

(vertex-in-graph? g 'b)
;; Returns: #t

(edge-in-graph? g '(b . d))
;; Returns: #f

(vertex-edges g 'b)
;; Should return: ((a . b) (b . c))

(connected-vertices g 'b)
;; Should return: (a c)

