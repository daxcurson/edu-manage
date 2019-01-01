# edu-manage
Sistema de gestión de un instituto de enseñanza.

Edu-Manage apunta a ser una solución completa para la gestión de un instituto de enseñanza. Permite recibir inscripciones de estudiantes en cursos, cobrar cuotas, gestionar la agenda de cursos y de profesores. 

## Características principales:

- Administración de estudiantes: recibir inscripciones, recibir cancelaciones de estudiantes, gestionar sus bajas.
- Manejo de cuotas y pagos: generar cuotas, recibir pagos.
- Administración de cursos: crear cursos, planificar sus clases, asignar profesores.
- Los cursos pueden tener varias modalidades: mensuales, cuatrimestrales, etc, y admite la posibilidad de que un curso sea tomado por distintos estudiantes que paguen una modalidad distinta.
- Administración de profesores: contratar profesores, asignar y calcular honorarios por clase. 
- Informes de gestión: costo de cada curso, ganancia obtenida por curso, porcentaje de ausencias de profesores, estudiantes, informe de ganancias y pérdidas, informe de deudores.
- Calendario de profesores: el profesor puede entrar al sistema y ver su calendario de cursos, puede determinar horas en las que no estará disponible y podrá informar cuándo no asistirá a clase.

## Características adicionales:

- Multimonetario. Permite recibir pagos en múltiples monedas.
- Internacionalizable. Los formularios para estudiantes pueden generarse en múltiples
  idiomas.
- Flexible. Cada curso puede tener distintas modalidades para ser facturado: por cuota fija mensual, por cuota variable mensual, por cuota cuatrimestral, por cantidad de horas, etc.
- Facturación fiscal AFIP. Permite generar facturas para cuando el estudiante lo requiera.
- Generación de factura PDF y almacenamiento.
- Generación de recibos.
- Notificaciones. Se pueden configurar notificaciones para que lleguen por mensaje en el explorador o por correo electrónico.

## Planificación

Las funcionalidades se irán completando hasta llegar a la versión "1.0" que contendrá todo lo prometido en la sección de características principales. A partir de ahí, se agregarán funcionalidades a medida que ingresen nuevos requerimientos.

### Versión 0.1 "Ver estudiantes en curso"

- Recibir inscripciones de estudiantes.
- Crear cursos.
- Crear clases por curso.
- Confirmar la inscripción del estudiante en un curso.
- Ver el calendario de cursos.
- Ver el calendario de un curso.
- Ver los estudiantes del curso.

### Versión 0.2 "Cobrar cursos"

- Planificar cuotas a cobrar a los estudiantes dependiendo de la modalidad de curso y de pago que se haya configurado.
- Recibir pagos de las cuotas.
- Registrar los pagos en la cuenta del estudiante.

### Versión 0.3 "Cancelar clases"

- Recibir cancelaciones de estudiantes.
- Informar a los profesores de las ausencias de los estudiantes y de las cancelaciones d clase, si hubiera.
- Cobrar cancelación al estudiante.

### Versión 0.4 "Calendario del profesor"

- El profesor puede entrar al sistema y consultar su calendario.
- El profesor informa de sus momentos disponibles para poder planificar su agenda.
- El profesor informa qué clase desea cancelar.

### Versión 0.5 "Planificación de cursos"

- Mostrar profesores disponibles para dar una clase.
- Identificar conflictos de planificación al asignar un profesor a una clase.
