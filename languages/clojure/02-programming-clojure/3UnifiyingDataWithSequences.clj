(requre '[clojure.string :refer [join]])

;;! Creating Sequences

(range start? end? step?); Si no especificas final entonces sera infinito

(range 10)

(range 10 20)

(range 1 25 2)

; Repeat

(repeat 5 1)
(repeat 10 "x")

(iterate f x)
(take 10 (iterate inc 1))

;;! Lazy sequences

(def whole-numbers (iterate inc 1)); Returns lazy sequence

(repeat x)

(take 20 (repeat 1))
(take 10 (cycle (range 3)))

(interleave whole-numbers ["A" "B" "C" "D"])

(join \, ["Apples" "Bananas" "Grapes"])

(set [1 2 3])
(hash-set 1 2 3)

;;! Filtering sequences