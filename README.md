# Guía de inspección — Caso Irma Sevilla

Webapp de apoyo para la inspección de campo. Incluye croquis con imagen aérea, puntos de referencia, seguimiento mediante GPS, cálculo de distancias, ingreso manual WGS84 y lista de verificación con guardado local.

Sitio publicado: https://psforestal-rgb.github.io/irma-sevilla-1/

Última activación de despliegue: 30 de julio de 2026.

## Desarrollo

El documento editable de la aplicación está en `app/source.html`. Después de modificarlo, ejecute:

```powershell
pwsh -File scripts/build-parts.ps1
```

El script reconstruye los 12 fragmentos Base64 que carga `index.html`.
