# Pasos arquitectura
  1. Seleccionas una region de conveniencia con los servicios adecuados
  2. Agregas multiples availability zones
    - Que resista caida de sistemas
  3. Generas una network entre cada availability zone
  4. Agregar la red en una red privada interna
  5. Agregas un elastic load balancer que distribuya la carga de requests
  6. Agregar security controls
  7. Agregar un object store
  8. Agregar un Route 53 Que guie las peticiones

# Amazon VPC
  - Es como tu red privada
  - Logically isolated network
    - Esto ayuda a que todo se mantenga seguro ya que no puede ser estimulada por un agente externo que no se haya especificado manualmente
  - Se crea por cuenta y por region 