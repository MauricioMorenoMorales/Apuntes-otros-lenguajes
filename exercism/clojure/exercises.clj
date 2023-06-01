(require '[clojure.string :as string :refer [trim join split includes?]])

(defn do? [function values]
  (every? function values))

(defn translate [sentence]
  (let [is-vowel? #(includes? "aeiouxy" (str %))
        is-consonant? #(not (is-vowel? %))
        swap (fn [letters-to-swap string]
               (str (->> string (drop letters-to-swap) (apply str))
                    (->> string (take letters-to-swap) (apply str))))
        translate (fn [^String x]
                      (let [[first second third] x]
                        (cond
                          (do? is-consonant? [first second third])               (swap 3 x)
                          (and (is-consonant? first) (= \q second) (= \u third)) (swap 3 x)
                          (and (is-consonant? first) (= \y second))              (swap 1 x)
                          (and (= \x first) (is-vowel? second))                  (swap 1 x)
                          (and (= \y first) (is-vowel? second))                  (swap 1 x)
                          (and (= \q first) (= \u second))                       (swap 2 x)
                          (do? is-consonant? [first second])                     (swap 2 x)
                          (is-consonant? first)                                  (swap 1 x)
                          (is-vowel? first)                                      x)))]
    (->> (split sentence #" ")
         (map #(translate %))
         (map #(str % "ay"))
         (join #" ")
         (trim))))
