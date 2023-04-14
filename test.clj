(require '[clojure.string :refer [split]])

(defn ^String test-function
  [^String test]
  (->> (split test )))