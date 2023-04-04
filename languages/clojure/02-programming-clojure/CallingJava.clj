;; Instanciating a Java class
(new java.util.Random)
(java.util.Random.)

(. class-or-instance member-symbol & args)
(. class-or-instance (member-symbol & args))

(def rnd (new java.util.Random))
(. rnd nextInt)
(. rnd nextInt 10)

;; Instance field
(def p (java.awt.Point. 10 20)
  (. p x)); 10

;; Static method
(. System lineSeparator); "\n"

;; Static field
(.Math PI); 3.141592...

(import '(java.util Random Locale)
        '(java.text MessageFormat))

Locale; java.util.Locale
MessageFormat ;java.text

