# Declaración de Uso de IA (DUIA)

* **Herramienta:** OpenCode / Kiro
* **Para qué se usó:** Generar scripts de vistas de seguridad y proponer índices de optimización.
* **Prompt/spec (resumen):** "Proponer índice para acelerar búsqueda por fechas y descartar opciones redundantes. Crear vista ocultando contraseñas."
* **Se aceptó / se descartó - por qué:** 
  * Se aceptó el índice de fechas porque redujo el tiempo de lectura significativamente pasando a Bitmap Index Scan.
  * Se descartó el índice en la columna de activos por baja cardinalidad.
  * Se aceptaron las vistas porque aíslan correctamente los datos sensibles (contraseñas).