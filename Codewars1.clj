;;! Sums the square of an array [5, 3, 4] ==> 50

(defn square-sum
  [list]
  (->> list
      (map #(* % %))
      (apply +)))

(defn square-sum
  [list]
  (walk #(* % %) #(apply + %) list))

;;! Convert a string to a number
(defn string-to-number
  [str]
  (Integer. str))

(defn string-to-number
	[str]
	(Integer/parseInt str))

(defn string-to-number
	[str]
	(read-string str))

(defn string-to-number
	[str]
	(Integer/valueOf str))

;;! Transform numbers greather or equal than 5 in 1, or else return a 0

(defn fake-bin [x]
  (apply str
    (map (fn [c]
            (if ((set "01234") c) \0 \1))
        x)))

(defn fake-bin
	[x]
	(-> x
		(clojure.string/replace #"[0-4]" "0")
		(clojure.string/replace #"[5-9]" "1")))

(defn fake-bin
  [x]
  (->> x
    (map #(Character/digit % 10))
    (map #(if (< % 5) 0 1))
    (apply str)))

;;! Verifies if a number is odd or even

(defn even-or-odd [number]
  (if (= 0 (mod number 2)) "Even" "Odd"))

(defn even-or-odd [number]
	(if (even? number) "Even" "Odd"))

(defn even-or-odd [number]
	(condp = (mod number 2)
		0 "Even"
		1 "Odd"))
