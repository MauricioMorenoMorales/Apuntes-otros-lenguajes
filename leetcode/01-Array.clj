(defn replace-elements
  [arr]
  (letfn [(reducer [[head & tail] response previous-max]
                   (if (empty? head) response
                       (reducer
                         tail
                         (conj response previous-max)
                         (max previous-max head))))]
    (-> arr
       reverse
       (reducer [] -1))))