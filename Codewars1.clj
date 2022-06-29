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

;;! Receives a number and returns the number reversed as type list

(defn digitize
  [parameter]
  (->> parameter
    str
    reverse
    (map #(Character/digit % 10))))

(defn digitize
  [parameter]
  (->> (str parameter)
    reverse
    (map str)
    (map read-string)))

(defn parse
  [parameter]
  (Integer/parseInt (str parameter)))
(defn digitize
  [parameter]
  (->> parameter
    str
    to-array
    reverse
    (map parse)))

;;? Complex ############
(defn digitize
  ([parameter] (digitize parameter []))
  ([parameter list]
    (if (< parameter 10)
      (concat list [parameter])
      (recur (quot parameter 10)
      (concat list [(mod parameter 10)])))))

(defn digitize
  [parameter]
  (let [q (quot parameter 10) m (mod parameter 10)]
    (if (= q 0) [m] (into [m] (digitize q)))))

(defn digitize
  [parameter]
  (loop [ digits parameter
          result []]
    (let [digit (mod digits 10)
          digits' (long (/ digits 10))
          result' (conj result digit)]
      (if (> digits' 0)
        (recur digits' result')
        result'))))

;;! Conditionals with objects

(defn chromosome-check
  [parameter]
  (if (= parameter "XY")
    "Congratulations! You're going to have a son."
    "Congratulations! You're going to have a daughter."))

(defn chromosome-check
  [parameter]
  ({"XY" "Congratulations! You're going to have a son."
    "XX" "Congratulations! You're going to have a daughter."} parameter))

(defn chromosome-check
  [parameter]
  (case parameter
    "XY" "Congratulations! You're going to have a son."
    "XX" "Congratulations! You're going to have a daughter."))

;;! Xor, create a function that returns a cor

(defn xor
  [a, b]
  (case a
    true (if (= b true) false true)
    false (if (= b false) false true)))

;; We give this an alias
(defn xor not=)
(defn xor [a,b]
  (not= a b))

(defn xor [a, b]
  (and (or a b) (not (and a b))))

(defn xor
  [a, b]
  (= (true? a) (false? b)))


;;! Sorts an array in diferent directions
(defn flip1
  [direction array]
  (if (= direction \R)
    (-> array
      sort
      reverse)
    (sort array)))

(defn flip2
  [direction array]
  (case direction
    \R (sort < array)
    \L (sort > array)))

(defn flip3
  [direction array]
  (sort (case direction \R < \L >) array))

;;! Takes the first element of a string and parses it
(defn how-old
  [her-old]
  (-> her-old
    (clojure.string/split #"\s")
    first
    Integer.))

(defn how-old2
  [her-old]
  (Integer. (re-find #"\d" her-old)))


;;! reverses a word string

(defn reverse-words
  [string-parameter]
  (->> (clojure.string/split string-parameter)
    reverse
    (clojure.string/join " ")))

(defn testing-reverse
  [string-parameter]
  (-> string-parameter
    (clojure.string/split #" ")
    (->> reverse
      (clojure.string/join " "))))


;;! Sums only positive numbers
(defn positive-sum
  [number-array]
  (->> number-array
    (filter #(< 0 %))
    (reduce +)))

(defn positive-sum
  [number-array]
  (->> number-array
    (filter pos?)
    (reduce +)))

;;! Divisibility test x and y of another number

(defn is-divisible
  [number x y]
  (= 0
    (mod number x)
    (mod number y)))

;;! Trims the "!" symbols of a string and only left the last one

(defn remove-bang
  [string-parameter]
  (->> string-parameter
    (filter #(not= \! %))
    reverse
    (cons \!)
    reverse
    (apply str)))

(defn remove-bang
  [string-parameter]
  (-> string-parameter
    (.replace "!" "")
    (.concat "!")))

;;! Converts a number to string
(defn number-to-string
  [number-parameter]
  (str number-parameter))

;;! Obtains the digital root of a number and continue doing it until
;;! The number is smaller than 100
(defn sum-digits-bellow-hundred
  [number-parameter]
  (let [
  number-sum (-> number-parameter
                  str
                  (clojure.string/split #"")
                  (->> (map #(Integer. %))
                  (reduce +)))
  result (- number-parameter number-sum)]
    (if (<= result 100)
      result
      (sum-digits-bellow-hundred result))))
