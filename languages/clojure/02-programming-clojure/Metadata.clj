(meta #'str)

(defn ^{:tag String} shout [^{:tag String} s]
  (clojure.string/upper-case s))

(defn ^String shout [^String s]
  (clojure.string/upper-case s))

(defn shout
  ([s] (clojure.string/upper-case s))
  {:tag String})

