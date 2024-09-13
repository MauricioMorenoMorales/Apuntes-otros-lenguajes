const readline = require('readline')

const readLine = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

const pasosPareja = [
  '>>>> Inicia <<<<',
  'Giro arriba Hombre',
  'Giro arriba Mujer',
  'Giro arriba Hombre',
  'Doble Giro Mujer',
  'Cross 6',
  'Lateral',
  'Diagonal directo giro',
  'Cross 3',
  'Giro Yo',
  'Doble giro ella',
  'Manita de puerco / Cruce brazos frontal',
  'Tras-nuca con giro',
  'Cross 6',
  'Giro abajo / Escuadra mujer',
  'Pluma giro con abdomen y espalda',
  'Cross 6 cerrado con giro empezando rondas',
  'Rondas',
  '>>>> Terminado <<<<',
]

const pasosIndividuales = [
  '>>>> Inicia <<<<',
  'Base',
  'Vuelta Reloj',
  'Lateral', //!
  'Doble lateral',
  'En su lugar', //!
  'Base Atras',
  'Suzie Q', //!
  'Cross Lateral',
  'Vuelta contra reloj',
  'Cross mujer',
  'Cross mujer',
  'Avance diagonal / lateral diagonal',
  'Punta talon punta / Patada',
  'Lateral con giro / Regreso rapido',
  'Pau Pau con inclinación',
  'Avance Lateral Cruzado',
  'Salto ocon giro',
  'Giro basketball',
  'Giro con pies cruzados',
  '>>>> Terminado <<<<',
] // 120

const examen = [
  'cross de 3',
  'giro 男 | giro 女 izquierda',
  'cambio brazo abajo R | doble giro 女 peine',
  'Cross del 5 con brazo en espalda - Cierre cercano - Cruce pie', //!
  'Cross del 3',
  'Cross del 7 con giro mano izquierda (es como el cross de 3 pero con giro)',
  'Cambio brazo abajo R | doble giro touch and go sin soltar derecha',
  'Cross del 3 final mariposa, cruze de pies por tras',
  'Mariposa > doble giro con mano derecha', //!
  'peine con derecha base',
  'Cross 270 grados con mano izquierda codo',
  'Giro mano abajo R | Escuadra 女',
  'Cross 3 manos cruzadas',
  'Giro hombre manos cruzadas > Peine / peine lateral§',
  'Cross abrazo entrada izquierda abrazo derecho - Pierna cruzada', //!
  'Lateral Pau, con cross del 3',
  'Doble pluma con peine',
  'Cross con giro CR',
  'Cross del 3',
  'Pluma izquierda agarre derecho giro 女 R',
  '>>>> Terminado <<<<',
]

// Los estados se aplican a el hombre
type Position = 'Mano derecha -> Mano derecha' | 'Escuadra' | 'Base' | 'Base cerrada' | 'Ronda mano de puerco' | 'Mano derecha tras nuca mujer' | 'Mano cruzada derecha arriba' | 'Mano cruzada izquierda arriba' | 'Tras Giro' | 'Mano Izquierda Suelta' | 'Ronda Mujer' | 'Base Diagonal'
  | 'Reversa Mano del hombre en espalda de la mujer' | 'Pluma ambas manos' | 'Mano Derecha en mano espalda mujer' | 'Mano Izquierda en mano espalda mujer' | 'Pluma Mujer Hombre Perpendicular' | 'Ronda mujer Estomago' | 'Mano costado izquierdo' | 'Manita de puerco' | 'Mano derecha mano derecha'
  | 'Doble escuadra' | 'Mano derecha mano derecha agarre boca abajo'
interface Step {nombre: string, estadoInicial: Position[], estadoFinal: Position[], duracion: number, acento?: number, coreografico?: boolean, }
type DanceSteps = Array<Step>

const salsaSteps: DanceSteps = [
  {nombre: 'Base', estadoInicial: ['Base'], estadoFinal: ['Base'], duracion: 8},
  {nombre: 'Giro Hombre', estadoInicial: ['Base'], estadoFinal: ['Base'], duracion: 4},
  {nombre: 'Cambio brazo', estadoInicial: ['Base'], estadoFinal: ['Mano derecha -> Mano derecha'], duracion: 4},
  {nombre: 'Escuadra', estadoInicial: ['Base'], estadoFinal: ['Escuadra'], duracion: 4},
  {nombre: 'Tras Nuca', estadoInicial: ['Escuadra'], estadoFinal: ['Base', 'Ronda Mujer'], duracion: 8},
  {nombre: 'Vuelta Mujer', estadoInicial: ['Base'], estadoFinal: ['Base'], duracion: 8},
  {nombre: 'Axilazo', estadoInicial: ['Base'], estadoFinal: ['Mano derecha tras nuca mujer'], duracion: 8},
  {nombre: 'Pavo Real', estadoInicial: ['Mano cruzada derecha arriba'], estadoFinal: ['Base'], duracion: 16, acento: 9}, //?
  {nombre: 'Cross 3 caida', estadoInicial: ['Tras Giro'], estadoFinal: ['Base'], duracion: 8, acento: 1},
  {nombre: 'Vuelta al mundo', estadoInicial: ['Base'], estadoFinal: ['Base'], duracion: 8},
  {nombre: 'Touch and go', estadoInicial: ['Mano cruzada derecha arriba', 'Mano costado izquierdo'], estadoFinal: ['Mano cruzada derecha arriba'], duracion: 8},
  {nombre: 'Giro 160 Hombre Ronda', estadoInicial: ['Ronda Mujer'], estadoFinal: ['Base'], duracion: 4},
  {nombre: 'Pluma Izquierda Espalda', estadoInicial: ['Escuadra'], estadoFinal: ['Reversa Mano del hombre en espalda de la mujer'], duracion: 8},
  {nombre: 'Reversa', estadoInicial: ['Reversa Mano del hombre en espalda de la mujer'], estadoFinal: ['Mano cruzada derecha arriba'], duracion: 8},
  {nombre: '360', estadoInicial: ['Mano cruzada derecha arriba'], estadoFinal: ['Base'], duracion: 16},
  {nombre: 'Giro Mujer Arriba Abajo', estadoInicial: ['Base'], estadoFinal: ['Mano Derecha en mano espalda mujer', 'Mano Izquierda en mano espalda mujer'], duracion: 16},
  {nombre: 'In and out', estadoInicial: ['Mano Izquierda en mano espalda mujer'], estadoFinal: ['Mano cruzada derecha arriba'], duracion: 8},
  {nombre: 'Doble Peine mujer', estadoInicial: ['Mano cruzada derecha arriba'], estadoFinal: ['Base'], duracion: 8},
  {nombre: 'Giro Pre Ronda Mujer', estadoInicial: ['Mano Derecha en mano espalda mujer'], estadoFinal: ['Ronda Mujer'], duracion: 8},
  // 26 Agosto
  {nombre: 'Pluma Pistola', estadoInicial: ['Base'], estadoFinal: ['Mano Izquierda Suelta'], duracion: 16},
  {nombre: 'Inicio Ronda Solo Mano Derecha', estadoInicial: ['Mano Izquierda Suelta'], estadoFinal: ['Ronda Mujer'], duracion: 8},
  {nombre: 'Ronda Hombre Diagonal', estadoInicial: ['Ronda Mujer'], estadoFinal: ['Base Diagonal'], duracion: 4},
  {nombre: 'Cross Reverse Cuello Mujer', estadoInicial: ['Base Diagonal'], estadoFinal: ['Escuadra'], duracion: 16},
  // TODO 5 Septiembre 2024
  {nombre: 'Medio giro hombre -> Giro ambos', estadoInicial: ['Base'], estadoFinal: ['Base', 'Base Diagonal'], duracion: 8},
  {nombre: 'Cross de 3 con giros', estadoInicial: ['Base'], estadoFinal: ['Base', 'Mano costado izquierdo'], duracion: 8},
  {nombre: 'Manita de puerco giro mujer reloj mano izquierda arriba', estadoInicial: ['Base'], estadoFinal: ['Manita de puerco'], duracion: 8},
  {nombre: 'Cross manita de puerco', estadoInicial: ['Manita de puerco'], estadoFinal: ['Base cerrada', 'Base'], duracion: 8},
  //? Cross de 5
  {nombre: 'PauPapa', estadoInicial: ['Base cerrada'], estadoFinal: ['Base cerrada'], duracion: 16},
  {nombre: 'Diagonal', estadoInicial: ['Base cerrada'], estadoFinal: ['Base', 'Mano costado izquierdo'], duracion: 8},
  {nombre: 'Cross 5', estadoInicial: ['Mano derecha mano derecha', 'Mano costado izquierdo'], estadoFinal: ['Ronda Mujer', 'Base'], duracion: 8},
  {nombre: 'Touch and go', estadoInicial: ['Mano cruzada derecha arriba'], estadoFinal: ['Mano cruzada izquierda arriba'], duracion: 8},
  {nombre: 'Peine hombre espalda giro cabeza', estadoInicial: ['Mano cruzada izquierda arriba'], estadoFinal: ['Base cerrada'], duracion: 4},
  {nombre: 'Body roll', estadoInicial: ['Base cerrada'], estadoFinal: ['Base cerrada'], duracion: 4},
  //! 7 Septiembre 2024
  {nombre: 'Pluma Pistola Alterna', estadoInicial: ['Base'], estadoFinal: ['Mano derecha mano derecha'], duracion: 8},
  {nombre: 'Circular doble escuadra', estadoInicial: ['Mano derecha mano derecha'], estadoFinal: ['Doble escuadra'], duracion: 8},
  {nombre: 'Giro doble escuadra hombre mujer', estadoInicial: ['Doble escuadra'], estadoFinal: ['Mano derecha mano derecha'], duracion: 8},
  {nombre: 'Reguilete', estadoInicial: ['Mano derecha mano derecha'], estadoFinal: ['Mano costado izquierdo', 'Mano derecha mano derecha agarre boca abajo'], duracion: 8}, //TODO Buscar mas estados iniciales
  {nombre: 'Cross giro abrazo -> giro hombre', estadoInicial: ['Mano costado izquierdo'], estadoFinal: ['Mano derecha mano derecha'], duracion: 8},
  {nombre: 'Giro cubano costado 360', estadoInicial: ['Mano derecha mano derecha'], estadoFinal: ['Mano derecha mano derecha'], duracion: 8},
  //? Pavo real
  {nombre: 'Giro acento costado', estadoInicial: ['Mano cruzada izquierda arriba'], estadoFinal: ['Mano derecha mano derecha'], duracion: 8, acento: 3},
  {nombre: '360 con regreso', estadoInicial: ['Mano derecha mano derecha'], estadoFinal: ['Base'], duracion: 16},
  {nombre: 'Giro incado impulsando abdomen', estadoInicial: ['Base'], estadoFinal: ['Base'], duracion: 8, coreografico: true},
  //! 50 vueltas de salsa para bailar
  {nombre: 'Enchufla', estadoInicial: ['Base'], estadoFinal: ['Base'], duracion: 8},
  // Ideas
  {nombre: 'Cross del 7', estadoInicial: ['Base'], estadoFinal: ['Base', 'Mano costado izquierdo'], duracion: 16},
]

//! Memorizador
const askDanceStep = (
  (pasos: Array<string>, iterator: number) =>
  (): string => pasos[iterator++ % pasos.length]
)(examen, 0)

//! Generador rutinas
const getDanceStep = (danceSteps: DanceSteps, position: Position) => danceSteps.filter(element => element.estadoInicial.includes(position))

//! Ejecucion
//readLine.on('line', () => console.log(`# ${askDanceStep()}`))

// console.log('Presiona enter para imprimir un paso')

console.log(getDanceStep(salsaSteps, 'Mano derecha mano derecha'))
