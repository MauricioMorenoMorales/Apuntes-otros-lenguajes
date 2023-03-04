;;01

(defrecord Person [first-name last-name])

(def foo (->Person "Aaron" "Bedra")); # 'user/foo
(:first-name foo); -> Aaron

