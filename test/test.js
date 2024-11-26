const getValue = units =>
    units > 280 ? units * 3
  : units > 250 ? units * 2
  : units > 210 ? units
  : 0
