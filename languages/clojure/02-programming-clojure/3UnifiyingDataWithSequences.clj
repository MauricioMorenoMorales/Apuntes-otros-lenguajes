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

;;! for

(for [word ["The" "quick" "brown" "fox"]]
  (format "<p>%s</p>" word))

(take 10 (for [n whole-numbers :when (even? n)] n))

(take 10 (for [n whole-numbers :while (odd? n)] n))

(for [file "ABCDEFGH"
      rank (range 1 9)]
  (format "%c%d" file rank)); ("A1" "A2" ... "H7" "H8")

(for [rank (range 1 9)
      file "ABCDEFGH"]
  (format "%c%d" file rank)); ("A1" "B1" ... "G8" "H8")
