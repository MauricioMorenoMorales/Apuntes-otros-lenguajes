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