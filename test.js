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
  'Suzie Kiu', //!
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

const getDanceStep = (
  (pasos, iterator) => () => pasos[iterator++ % pasos.length]
)(pasosIndividuales, 0)

readLine.on('line', () => console.log(`# ${getDanceStep()}`))

console.log('Presiona enter para imprimir un paso')
