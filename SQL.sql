-- 1. Seleccionar todo de una tabla:
SELECT * FROM empleados;

-- 2. Seleccionar columnas específicas:
SELECT nombre, salario FROM empleados;

-- 3. Filtros con WHERE:
SELECT * FROM empleados WHERE salario > 50000;

-- 4. Filtros combinados con AND / OR:
SELECT * FROM empleados WHERE salario > 50000 AND departamento = 'Ventas';

-- 5. Ordenar resultados:
SELECT * FROM empleados ORDER BY salario DESC;

-- 6. Limitar resultados:
SELECT * FROM empleados LIMIT 10;

-- 7. Renombrar columnas (AS):
SELECT nombre AS empleado, salario AS sueldo FROM empleados;

-- 8. Buscar con LIKE:
SELECT * FROM empleados WHERE nombre LIKE 'M%';

-- 9. Agrupaciones con GROUP BY:
SELECT departamento, COUNT(*) FROM empleados GROUP BY departamento;

-- 10. Agregaciones básicas:
SELECT AVG(salario), MIN(salario), MAX(salario) FROM empleados;

-- 11. HAVING para filtrar grupos:
SELECT departamento, COUNT(*) FROM empleados GROUP BY departamento HAVING COUNT(*) > 5;

-- 12. INNER JOIN:
SELECT e.nombre, d.nombre AS departamento
FROM empleados e
INNER JOIN departamentos d ON e.departamento_id = d.id;

-- 13. LEFT JOIN:
SELECT e.nombre, d.nombre AS departamento
FROM empleados e
LEFT JOIN departamentos d ON e.departamento_id = d.id;

-- 14. RIGHT JOIN:
SELECT e.nombre, d.nombre AS departamento
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id = d.id;

-- 15. FULL OUTER JOIN (si el motor lo soporta):
SELECT * FROM empleados
FULL OUTER JOIN departamentos ON empleados.departamento_id = departamentos.id;

-- 16. Subconsulta en SELECT:
SELECT nombre, (SELECT AVG(salario) FROM empleados) AS salario_promedio FROM empleados;

-- 17. Subconsulta en WHERE:
SELECT nombre FROM empleados WHERE salario > (SELECT AVG(salario) FROM empleados);

-- 18. IN y NOT IN:
SELECT nombre FROM empleados WHERE departamento_id IN (1, 3, 5);

-- 19. BETWEEN:
SELECT nombre FROM empleados WHERE salario BETWEEN 40000 AND 60000;

-- 20. CASE (if-else en SQL):
SELECT nombre,
  CASE 
    WHEN salario > 70000 THEN 'Alto'
    WHEN salario > 40000 THEN 'Medio'
    ELSE 'Bajo'
  END AS categoria_salarial
FROM empleados;

-- 21. Funciones de texto:
SELECT UPPER(nombre), LENGTH(nombre) FROM empleados;

-- 22. Funciones de fecha:
SELECT nombre, NOW() - fecha_contratacion AS antigüedad FROM empleados;

-- 23. DISTINCT:
SELECT DISTINCT departamento FROM empleados;

-- 24. INSERT:
INSERT INTO empleados (nombre, salario, departamento_id) VALUES ('Ana', 55000, 2);

-- 25. UPDATE:
UPDATE empleados SET salario = salario * 1.1 WHERE departamento_id = 3;

-- 26. DELETE:
DELETE FROM empleados WHERE salario < 30000;

-- 27. CREATE TABLE:
CREATE TABLE empleados (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  salario DECIMAL,
  departamento_id INT
);

-- 28. ALTER TABLE (agregar columna):
ALTER TABLE empleados ADD COLUMN fecha_contratacion DATE;

-- 29. DROP TABLE:
DROP TABLE empleados;

-- 30. CTE (Common Table Expression):
WITH salarios_altos AS (
  SELECT * FROM empleados WHERE salario > 60000
)
SELECT * FROM salarios_altos WHERE departamento_id = 2;