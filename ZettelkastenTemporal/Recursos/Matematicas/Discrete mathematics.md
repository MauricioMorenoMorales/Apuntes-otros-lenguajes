## Tautology contradiction contindency & satisfiability

> Tautologia: una preposicion compuesta que siempre es verdadera

> contradiccion: una proposicion compuesta que siempre es falsa

> Contingencia: una proposicion que es tanto cierta como falsa

> Una proposicion compuesta es:
> > Valida cuando es tautologia
> > Invalida cuando es contingencia o contradiccion
> > Satisfacible cuando puede producir resultados verdaderos
> > Insatisfacible cuando es contradiccion

## Logical equivalences
- Identity laws;              P & true == P,                        P or F == P
- Domination Laws       P || True == True,                   P & False == False
- Idempotent Laws       P or P == P,                            P & P == P
- Double negation law  !!P == P
- Commutative laws:     P || Q == Q || P,                     Q & P == P & Q
- Assosiative Laws        P || (Q || R) == (P || Q) || R,   (P & Q) & R == P & (Q & R)
- Distributive Laws:       P || (Q & R) == (P || Q) & (P || R), (P & Q) & R == (P & R)&(Q & R)
- De Morgan's Laws:     !(P & Q) === !P || Q!,           !(P or Q) == !P & !Q
- Absorption Laws:        P or (P & Q) == P,                P & (P or Q) === P

Descripcion
- Identity laws: cuando la existencia de un valor booleano no garantiza que algo sea cierto
- Domination Laws: cuando la existencia de un valor booleano garantiza que algo sea cierto
- Idepotent Laws: Cuando un mismo termino se repite
- Double negation: XD
- Commutative Laws: El orden no importa cuando se usa un and y un or
- Assosiative Laws: cuando hay varias operaciones iguales no importa el orden de los parentesis


# Rules of inference [25]

Para probar la validez de una inferencia tratamos de hacer la conclusión falsa y todas las premisas verdaderas, si no podemos entonces la inferencia es verdadera

1. Modus Ponens [(P -> Q) ^ P] -> Q
2. Modus Tollens [(P -> Q) ^ !Q] -> !P
3. Hypothetical Syllogism [(P -> Q) ^ (Q -> R)] -> (P -> R)
4. Disjunctive Syllogism [(P || Q) & ~P] -> Q
5. Addition P -> (P || Q)
6. Simplification (P ^ Q) -> P or (P ^ Q) -> Q
7. Conjunction [(P) ^ (Q)] -> (P ^ Q)
8. Resolution [(P || Q) ^ (!P || R)] -> (Q || R)

# First order Logic
## Predicates
Un predicado es como una funcion que recibe una variable, esa variable puede ser verdadera o falsa, y tienes que determinar si es verdadera o falsa por ejemplo

(defn example [students] (every? #(starts-with-h %) students))

> Una frase usada a la hora de evaluar es "What are the truth values of"

## Logical equivalences
$$\forall x(g(x)\triangle f(x)) $$
$$\forall x g(x) \triangle \forall x f(x) $$
## De morgan laws for quantities
$$ ¬\forall x P(X) \equiv \exists x ¬P(x) $$
$$ ¬\forall \exists y x P(X) \equiv \exists x ¬\exists yP(x) $$
$$ ¬\exists x P(x)  \equiv \forall x ¬P(x)$$
$$ \exists x ¬\exists y P(x)  \equiv \exists x \forall y ¬P(x)$$
## Nested Quantifiers
$$ \forall x \exists y Q(x, y) $$
When the operations are the same you the order doesn't matter, solamente importa cuando las operaciones son distintas como en el ejemplo anterior, los siguientes son equivalentes
$$ \forall x \forall y Q(x, y) \equiv \forall y \forall x Q(x, y) $$
$$ \exists x \exists y Q(x, y) \equiv \exists y \exists x Q(x, y) $$

## Pasos para definir frase con base a una frase en lenguaje
- Read and understand the statement
- Find the domain of discourse
- Finde the associated quantifiers
- Rewrite the statement
- Introduce variables

# Set theory
## Inclusion and membership
## Membership
$$x\in[x,y,z] = true \bigcirc [x]\in[x,y,z] = false$$
Recibe un valor y un set, determina si un elemento es parte de un set
### Inclusion
$$ [x, y]\subset[x,y,z] \therefore x \in [x,y,z] y \in [x,y,z]= true \bigcirc x \subset [x,y,z] = false $$
Recibe dos arrays y verifica si cada uno de los miembros de ese array es miembro de otro array
> Pero si el array es el mismo retorna falso, para que sea verdadero tienes que usar otro simbolo
$$ [x,y] \subset [x,y] = false \bigcirc [x,y] \subseteq[x,y] = true $$
> Todos los sets tienen un elemento vacio, como en las listas enlazadas de elixir , este elemento se denomina con la letra fi φ 

> (Non empty set Theorem): Todos los sets tienen garantizados tener dos elementos, el set vacio y si mismo

## Power sets
Un power set es un set que contiene todos los posibles subsets de un set, el tamaño de un power set se calcula con 2^n

$$ p([φ, [φ]]) \equiv [φ [φ], [[φ]], [φ, [φ]]] $$
## Cartesian Product and Cardinality
La cardinalidad es el tamaño de un set se calcula como en cualquier lenguaje de programacion {0, 1, 10} = 3

El producto cartesiano se obtiene con la siguiente formula
$$ AXB = [[a, b] | a \in A \space and \space b \in B] $$
$$ AXB=[1,2]X[a,b,c]=[1a,1b,1c,2a,2b,2c] $$
# Set operations
Intersection
$$ A \cap B = [x|[x \in A]\wedge[x\in B]] $$
Union
$$ A \cup B = [x|[x \in A]\vee[x\in B]] $$
Difference
$$ A-B = [x| x \in A \wedge x \notin B] $$
Complement
$$ A'=[x|x \notin A] $$

# Set Identities
Identity Laws
$$A\cupφ  = A$$
$$A\capφ  = A$$
Domination Laws
$$ A \cup U = U $$
$$ A \cap φ = φ $$
Idempotent Laws:
$$ A \cup A = A $$
$$ A \cap A = A $$
Complementation Laws:
$$ (A')' = A $$
Commutative Laws: 
$$ A \cap B = B \cap A $$
$$ A \cup B = B \cup A $$
Assosiative Laws:
$$ A \cup (B \cup C) = (A \cup B) \cup C $$
$$ A \cap (B \cap C) = (A \cap B) \cap C $$
Distributive Laws:
$$ A \cap (B \cup C) = (A \cap B) \cup (A \cap C) $$
$$ A \cup (B \cap C) = (A \cup B) \cap (A \cup C) $$
De morgan's Laws:
$$ (A \cup B)' = A' \cap B' $$
$$ (A \cap B)' = A' \cup B' $$
Absorption Laws:
$$ A \cup (A \cap B) = A $$
$$ A \cap (A \cup B) = A$$
Complement Laws:
$$ A \cup A' = U $$
$$ A \cap A' = φ$$
Negation of Member
$$ x \notin (A \cap B) $$
$$ ¬(x \in (A \cap B)) $$