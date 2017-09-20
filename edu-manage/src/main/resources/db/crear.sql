-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 21, 2015 at 03:56 PM
-- Server version: 5.6.20-log
-- PHP Version: 5.5.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `buenosai_lvstudio2`
--

-- --------------------------------------------------------

--
-- Table structure for table `accents`
--

CREATE TABLE IF NOT EXISTS `accents` (
`id` int(11) NOT NULL,
  `descripcion` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adjuntos`
--

CREATE TABLE IF NOT EXISTS `adjuntos` (
`id` int(10) unsigned NOT NULL,
  `model` varchar(20) NOT NULL,
  `foreign_key` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `dir` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `asistencias`
--

CREATE TABLE IF NOT EXISTS `asistencias` (
`id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `inscripcion_id` int(11) NOT NULL,
  `presente` varchar(1) DEFAULT NULL,
  `student_performance` text,
  `reason_absence` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13332 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE IF NOT EXISTS `authorities` (
`id` int(11) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cambios`
--

CREATE TABLE IF NOT EXISTS `cambios` (
`id` int(11) NOT NULL,
  `objeto` varchar(50) NOT NULL,
  `objeto_id` int(11) NOT NULL,
  `controller` varchar(30) NOT NULL,
  `action` varchar(50) NOT NULL,
  `descripcion_cambio` varchar(500) DEFAULT NULL,
  `motivo` varchar(300) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `profesor_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=68157 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cancelaciones`
--

CREATE TABLE IF NOT EXISTS `cancelaciones` (
`id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `tipo_cancelacion_id` int(11) NOT NULL,
  `fecha_cancelacion` datetime NOT NULL,
  `horas_anticipacion` varchar(20) NOT NULL DEFAULT '',
  `persona_id` int(11) DEFAULT NULL,
  `profesor_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `comentarios` text,
  `recuperada_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=968 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cancelacion_estudiantes`
--

CREATE TABLE IF NOT EXISTS `cancelacion_estudiantes` (
`id` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `persona_id` int(11) NOT NULL,
  `inscripcion_id` int(11) NOT NULL,
  `profesor_id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `asistencia_id` int(11) NOT NULL,
  `fecha_cancelacion` datetime NOT NULL,
  `horas_anticipacion` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cancelacion_profesores`
--

CREATE TABLE IF NOT EXISTS `cancelacion_profesores` (
`id` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `profesor_id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `fecha_cancelacion` datetime NOT NULL,
  `horas_anticipacion` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `carga_horarias`
--

CREATE TABLE IF NOT EXISTS `carga_horarias` (
`id` int(11) NOT NULL,
  `tipo_curso_id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `horas_semanales` decimal(8,2) NOT NULL,
  `dias_semana` int(11) NOT NULL,
  `horas_clase` decimal(8,2) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clases`
--

CREATE TABLE IF NOT EXISTS `clases` (
`id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `profesor_id` int(11) DEFAULT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha_clase` date NOT NULL,
  `hora_comienzo` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `cancelada` int(11) DEFAULT '0',
  `mostrar_cancelada` int(11) DEFAULT '0',
  `comentarios` text,
  `grammar` text,
  `vocabulary` text,
  `communication` text,
  `homework` text,
  `book_pages` text,
  `suggestions` text,
  `sucursal_id` int(11) DEFAULT NULL,
  `domicilio_clase` varchar(100) DEFAULT NULL,
  `no_recuperar` int(11) DEFAULT '0',
  `precio_por_hora` decimal(8,2) DEFAULT '0.00',
  `moneda_id` int(11) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=23659 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clase_cuotas`
--

CREATE TABLE IF NOT EXISTS `clase_cuotas` (
`id` int(11) NOT NULL,
  `cuota_id` int(11) NOT NULL,
  `clase_id` int(11) NOT NULL,
  `inscripcion_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17759 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clase_cursos`
--

CREATE TABLE IF NOT EXISTS `clase_cursos` (
`id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `abreviatura` varchar(5) NOT NULL,
  `idioma_estudiar_id` int(11) DEFAULT NULL,
  `tipo_curso_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `como_supos`
--

CREATE TABLE IF NOT EXISTS `como_supos` (
`id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `constantes`
--

CREATE TABLE IF NOT EXISTS `constantes` (
`id` int(11) NOT NULL,
  `nombre_variable` varchar(40) NOT NULL,
  `valor_variable` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cuotas`
--

CREATE TABLE IF NOT EXISTS `cuotas` (
`id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `inscripcion_id` int(11) NOT NULL,
  `extension_cursada_id` int(11) DEFAULT NULL,
  `curso_id` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `confirmado` int(11) DEFAULT '0',
  `fecha_vencimiento` date NOT NULL,
  `fecha_desde` date NOT NULL COMMENT 'Fecha desde la cual una cuota cubre la cursada de un curso',
  `fecha_hasta` date NOT NULL COMMENT 'Fecha en que finaliza la cobertura de esta cuota para el curso',
  `monto_pagar` decimal(8,2) NOT NULL,
  `es_matricula` int(11) DEFAULT '0',
  `moneda_id` int(11) NOT NULL,
  `saldo_pagar` decimal(8,2) NOT NULL DEFAULT '0.00',
  `comentarios` text,
  `motivo` text
) ENGINE=MyISAM AUTO_INCREMENT=6144 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cuotas_modificaciones`
--

CREATE TABLE IF NOT EXISTS `cuotas_modificaciones` (
`id` int(11) NOT NULL,
  `cuota_id` int(11) DEFAULT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1177 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
`id` int(11) NOT NULL,
  `codigo_curso` varchar(50) NOT NULL,
  `descripcion_curso` varchar(50) NOT NULL,
  `libro` varchar(50) NOT NULL,
  `intensivo` int(11) NOT NULL DEFAULT '0',
  `es_paquete` int(11) DEFAULT '0',
  `horario_curso` varchar(40) DEFAULT NULL,
  `fecha_comienzo` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `tipo_curso_id` int(11) DEFAULT NULL,
  `idioma_estudiar_id` int(11) NOT NULL,
  `nivel_id` int(11) DEFAULT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `domicilio_clase` varchar(100) DEFAULT NULL,
  `abierto` varchar(1) NOT NULL DEFAULT 'N',
  `inscriptos` int(11) DEFAULT '0',
  `baja` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=687 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cursos_nombres_viejos`
--

CREATE TABLE IF NOT EXISTS `cursos_nombres_viejos` (
`id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `codigo_curso` varchar(50) NOT NULL,
  `descripcion_curso` varchar(50) NOT NULL,
  `fecha_cambio` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `curso_ofrecidos`
--

CREATE TABLE IF NOT EXISTS `curso_ofrecidos` (
`id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `profesor_id` int(11) NOT NULL,
  `fecha_ofrecido` date DEFAULT NULL,
  `aceptado` int(11) DEFAULT NULL,
  `fecha_aceptacion` date DEFAULT NULL,
  `estado_aceptacion` varchar(30) NOT NULL DEFAULT 'No aceptado'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `curso_profesores`
--

CREATE TABLE IF NOT EXISTS `curso_profesores` (
`id` int(11) NOT NULL,
  `profesor_id` int(11) NOT NULL,
  `honorario_profesor_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `precio_por_hora` decimal(8,2) NOT NULL,
  `moneda_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=332 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `duracion_modos`
--

CREATE TABLE IF NOT EXISTS `duracion_modos` (
`id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `codigo` varchar(30) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
`id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extension_cursadas`
--

CREATE TABLE IF NOT EXISTS `extension_cursadas` (
`id` int(11) NOT NULL,
  `modalidad_curso_id` int(11) NOT NULL,
  `inscripcion_id` int(11) NOT NULL,
  `duracion_modo_id` int(11) NOT NULL,
  `duracion_cantidad` int(11) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  `precio_unidad_modalidad` decimal(8,2) NOT NULL,
  `moneda_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE IF NOT EXISTS `extras` (
`id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `moneda_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extra_personas`
--

CREATE TABLE IF NOT EXISTS `extra_personas` (
`id` int(11) NOT NULL,
  `extra_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feriados`
--

CREATE TABLE IF NOT EXISTS `feriados` (
`id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
`id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE IF NOT EXISTS `group_members` (
`id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `group_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_permission`
--

CREATE TABLE IF NOT EXISTS `group_permission` (
`id` int(11) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `honorario_profesores`
--

CREATE TABLE IF NOT EXISTS `honorario_profesores` (
`id` int(11) NOT NULL,
  `precio_por_hora` decimal(8,2) NOT NULL,
  `moneda_id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idioma_estudiar_id` int(11) NOT NULL,
  `otro_honorario` int(11) NOT NULL,
  `fecha_desde` date NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `horario_cursos`
--

CREATE TABLE IF NOT EXISTS `horario_cursos` (
`id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `dia_semana` varchar(30) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `profesor_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2248 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `horario_profesores`
--

CREATE TABLE IF NOT EXISTS `horario_profesores` (
`id` int(11) NOT NULL,
  `profesor_id` int(11) NOT NULL,
  `fecha_comienzo` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `dia_semana` varchar(20) NOT NULL,
  `hora_comienzo` time NOT NULL,
  `hora_fin` time NOT NULL,
  `lugar` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1545 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `horario_profesor_excepciones`
--

CREATE TABLE IF NOT EXISTS `horario_profesor_excepciones` (
`id` int(11) NOT NULL,
  `horario_profesor_id` int(11) NOT NULL,
  `fecha_excepcion` date NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=271 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `idioma_estudiares`
--

CREATE TABLE IF NOT EXISTS `idioma_estudiares` (
`id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `abreviatura` varchar(5) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `idioma_modalidades`
--

CREATE TABLE IF NOT EXISTS `idioma_modalidades` (
`id` int(11) NOT NULL,
  `modalidad_curso_id` int(11) NOT NULL,
  `idioma_estudiar_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `idioma_nativos`
--

CREATE TABLE IF NOT EXISTS `idioma_nativos` (
`id` int(11) NOT NULL,
  `descripcion` varchar(40) CHARACTER SET latin1 NOT NULL,
  `descripcion_ingles` varchar(40) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inscripciones`
--

CREATE TABLE IF NOT EXISTS `inscripciones` (
`id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `modalidad_curso_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `confirmada` int(11) NOT NULL DEFAULT '0',
  `pre_inscripcion` int(11) NOT NULL DEFAULT '0',
  `lista_espera` int(11) NOT NULL DEFAULT '0',
  `fecha_inscripcion` date NOT NULL,
  `fecha_comienzo` date DEFAULT NULL,
  `fecha_finalizacion` date DEFAULT NULL,
  `baja` int(11) NOT NULL DEFAULT '0',
  `fecha_baja` date DEFAULT NULL,
  `empleado` int(11) DEFAULT '0',
  `motivo_empleado` text,
  `borrada` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=1528 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inscripciones_individuales`
--

CREATE TABLE IF NOT EXISTS `inscripciones_individuales` (
`id` int(11) NOT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `materia` varchar(60) DEFAULT NULL,
  `nivel` varchar(50) DEFAULT NULL,
  `clases_semanales` int(11) DEFAULT NULL,
  `horas_clase` varchar(30) DEFAULT NULL,
  `paquetes` varchar(100) DEFAULT NULL,
  `fecha_estimada_comienzo` date DEFAULT NULL,
  `dias_preferidos` varchar(60) DEFAULT NULL,
  `dias_alternativos` varchar(60) DEFAULT NULL,
  `horario_preferido` varchar(60) DEFAULT NULL,
  `horario_alternativo` varchar(60) DEFAULT NULL,
  `sexo_profesor` varchar(10) DEFAULT NULL,
  `preferencia_idioma` varchar(30) DEFAULT NULL,
  `idioma_estudiar_id` int(11) DEFAULT NULL,
  `nivel_id` int(11) DEFAULT NULL,
  `orientacion_id` int(11) DEFAULT NULL,
  `profesor_posible_id` int(11) DEFAULT NULL,
  `cual_examen` varchar(20) DEFAULT NULL,
  `otra_orientacion` varchar(40) DEFAULT NULL,
  `confirmada` int(11) DEFAULT '0',
  `inscripcion_id` int(11) DEFAULT NULL,
  `lista_espera` int(11) DEFAULT '0',
  `dual` int(11) NOT NULL DEFAULT '0',
  `modalidad_curso_id` int(11) DEFAULT NULL,
  `pre_inscripcion` int(11) NOT NULL DEFAULT '0',
  `borrada` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=809 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `modalidad_cursos`
--

CREATE TABLE IF NOT EXISTS `modalidad_cursos` (
`id` int(11) NOT NULL,
  `carga_horaria_id` int(11) NOT NULL,
  `modalidad_pago_id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `precio_unidad_modalidad` decimal(8,2) NOT NULL,
  `moneda_id` int(11) NOT NULL,
  `duracion_cantidad` int(11) NOT NULL,
  `duracion_modo_id` int(11) NOT NULL,
  `es_extra` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `modalidad_disponibles`
--

CREATE TABLE IF NOT EXISTS `modalidad_disponibles` (
`id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `modalidad_curso_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=855 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `modalidad_pagos`
--

CREATE TABLE IF NOT EXISTS `modalidad_pagos` (
`id` int(11) NOT NULL,
  `descripcion` varchar(40) NOT NULL,
  `modo_facturacion` enum('CLASE','SEMANA','MES','PAQUETE','EVENTO','MES_VARIABLE') NOT NULL,
  `modo_calculo` enum('CLASE','SEMANA','MES','PAQUETE') NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `monedas`
--

CREATE TABLE IF NOT EXISTS `monedas` (
`id` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `tasa_cambio` decimal(8,2) NOT NULL,
  `simbolo` varchar(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `motivos`
--

CREATE TABLE IF NOT EXISTS `motivos` (
`id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `descripcion_ingles` varchar(100) NOT NULL,
  `externo` int(11) NOT NULL DEFAULT '0',
  `estado_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nacionalidades`
--

CREATE TABLE IF NOT EXISTS `nacionalidades` (
`id` int(11) NOT NULL,
  `descripcion` varchar(30) CHARACTER SET latin1 NOT NULL,
  `descripcion_ingles` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `niveles`
--

CREATE TABLE IF NOT EXISTS `niveles` (
`id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `dificultad` int(11) DEFAULT '0',
  `abreviatura` varchar(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notificaciones`
--

CREATE TABLE IF NOT EXISTS `notificaciones` (
`id` int(11) NOT NULL,
  `clase` varchar(30) DEFAULT NULL,
  `metodo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `titulo_ingles` varchar(100) DEFAULT NULL,
  `archivo` varchar(200) DEFAULT NULL,
  `nombre_vista` varchar(50) DEFAULT NULL,
  `destinatarios` text,
  `adjuntos` text,
  `adjuntos_ingles` text
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notificacion_enviadas`
--

CREATE TABLE IF NOT EXISTS `notificacion_enviadas` (
`id` int(11) NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notificacion_id` int(11) NOT NULL,
  `lista_destinatarios` text NOT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `hash_mensaje` varchar(200) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7473 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orientaciones`
--

CREATE TABLE IF NOT EXISTS `orientaciones` (
`id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE IF NOT EXISTS `pagos` (
`id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL DEFAULT '0',
  `monto_pago` decimal(8,2) NOT NULL DEFAULT '0.00',
  `moneda_id` int(11) NOT NULL DEFAULT '0',
  `saldo_cuenta` decimal(8,2) DEFAULT NULL,
  `persona_id_dual` int(11) DEFAULT NULL,
  `tasa_cambio` decimal(8,2) NOT NULL DEFAULT '1.00',
  `fecha_pago` date NOT NULL,
  `factura_nro` varchar(40) NOT NULL,
  `modo_pago` varchar(40) NOT NULL,
  `sucursal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comentarios` text
) ENGINE=MyISAM AUTO_INCREMENT=3340 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pagos_parciales`
--

CREATE TABLE IF NOT EXISTS `pagos_parciales` (
`id` int(11) NOT NULL,
  `cuota_id` int(11) NOT NULL,
  `cuota_id_dual` int(11) NOT NULL,
  `monto_pago` decimal(8,2) NOT NULL,
  `moneda_id` int(11) NOT NULL,
  `tasa_cambio` decimal(8,2) NOT NULL DEFAULT '1.00',
  `pago_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2663 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

CREATE TABLE IF NOT EXISTS `personas` (
`id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `alumno_id` int(11) DEFAULT NULL,
  `idioma_nativo_id` int(11) DEFAULT NULL,
  `nacionalidad_id` int(11) DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `novedades` int(11) DEFAULT '0',
  `direccion` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `apellido` varchar(50) CHARACTER SET latin1 NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `pasaporte` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `ocupacion` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `facebook` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `skype` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `como_supo_id` int(11) DEFAULT NULL,
  `como_supo_otros` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `tiempo_clases` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `motivo_estudio` text CHARACTER SET latin1,
  `comentarios` text CHARACTER SET latin1,
  `hizo_test_nivel` varchar(1) CHARACTER SET latin1 DEFAULT 'N',
  `nivel_supuesto_estudiante_id` int(11) DEFAULT NULL,
  `nivel_resultado_test_id` int(11) DEFAULT NULL,
  `nombre_tutor` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `telefono_tutor` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `vinculo` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `idioma_estudiar_id` int(11) DEFAULT NULL,
  `donde_estabas` text COLLATE utf8_spanish_ci,
  `picked_up_airport` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `accomodation_services` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `dropped_off_airport` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `agree` int(11) DEFAULT NULL,
  `baja` int(11) NOT NULL DEFAULT '0',
  `baja_id` int(11) DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `temporal` int(11) DEFAULT NULL,
  `fecha_retorno` date DEFAULT NULL,
  `motivo_id` int(11) DEFAULT NULL,
  `motivo_otro` text CHARACTER SET latin1,
  `usuario_id_baja` int(11) DEFAULT NULL,
  `despedida_enviada` int(11) DEFAULT '1',
  `saldo_cuenta` decimal(8,2) NOT NULL DEFAULT '0.00',
  `empleado` int(11) NOT NULL DEFAULT '0',
  `motivo_empleado` text COLLATE utf8_spanish_ci,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=1093 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persona_bajas`
--

CREATE TABLE IF NOT EXISTS `persona_bajas` (
`id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `usuario_id_baja` int(11) NOT NULL,
  `fecha_baja` date NOT NULL,
  `fecha_retorno` date NOT NULL,
  `temporal` int(11) NOT NULL,
  `motivo_id` int(11) DEFAULT NULL,
  `motivo_otro` text
) ENGINE=MyISAM AUTO_INCREMENT=365 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profesores`
--

CREATE TABLE IF NOT EXISTS `profesores` (
`id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nacionalidad_id` int(11) DEFAULT NULL,
  `idioma_nativo_id` int(11) DEFAULT NULL,
  `idioma_estudiar_id` int(11) NOT NULL DEFAULT '0',
  `nivel_id` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email_otro` varchar(100) NOT NULL,
  `celular` varchar(100) DEFAULT NULL,
  `fecha_comienzo` date DEFAULT NULL,
  `disponibilidad` varchar(100) DEFAULT NULL,
  `anos_experiencia` varchar(100) DEFAULT NULL,
  `comentarios` text,
  `facebook` varchar(100) NOT NULL,
  `telefono_fijo` varchar(30) DEFAULT NULL,
  `barrio` varchar(30) DEFAULT NULL,
  `titulo_universitario` varchar(60) DEFAULT NULL,
  `universidad` varchar(60) DEFAULT NULL,
  `tefl` int(11) DEFAULT NULL,
  `tefl_emisor` varchar(60) DEFAULT NULL,
  `detalles_experiencia` text,
  `gusto_profesor` text,
  `edades` varchar(60) DEFAULT NULL,
  `experiencia_clases` text,
  `fecha_llegada_ba` varchar(50) DEFAULT NULL,
  `fecha_partida_ba` varchar(50) DEFAULT NULL,
  `personalidad` text,
  `apariencia` varchar(60) DEFAULT NULL,
  `impresion` varchar(60) DEFAULT NULL,
  `trabajo_flores` varchar(60) DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL,
  `salario_esperado` varchar(60) DEFAULT NULL,
  `accent_id` int(11) DEFAULT NULL,
  `speech_id` int(11) DEFAULT NULL,
  `interes_gramatica` varchar(60) DEFAULT NULL,
  `dias_ocupados` text,
  `por_que_ba` text,
  `otros_lugares` text,
  `direccion` varchar(60) DEFAULT NULL,
  `mas` text,
  `otros_comentarios` text,
  `estilo_habla_id` int(11) DEFAULT NULL,
  `reunion_orientacion` varchar(60) DEFAULT NULL,
  `monotributista` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT '""',
  `photo_dir` varchar(255) DEFAULT '""',
  `biografia` text,
  `deshabilitado` int(11) DEFAULT '0',
  `created` date NOT NULL,
  `fecha_baja` date DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profesor_idiomas`
--

CREATE TABLE IF NOT EXISTS `profesor_idiomas` (
`id` int(11) NOT NULL,
  `profesor_id` int(11) NOT NULL,
  `idioma_estudiar_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=198 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `promociones`
--

CREATE TABLE IF NOT EXISTS `promociones` (
`id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `monto_descuento` decimal(8,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `promocion_estudiantes`
--

CREATE TABLE IF NOT EXISTS `promocion_estudiantes` (
`id` int(11) NOT NULL,
  `inscripcion_id` int(11) NOT NULL,
  `monto_descuento` decimal(8,2) NOT NULL,
  `moneda_descuento_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `speeches`
--

CREATE TABLE IF NOT EXISTS `speeches` (
`id` int(11) NOT NULL,
  `descripcion` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sucursales`
--

CREATE TABLE IF NOT EXISTS `sucursales` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nombre_ingles` varchar(40) NOT NULL,
  `abreviatura` varchar(5) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_cancelaciones`
--

CREATE TABLE IF NOT EXISTS `tipo_cancelaciones` (
`id` int(11) NOT NULL,
  `descripcion` varchar(40) NOT NULL,
  `codigo` varchar(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_cursos`
--

CREATE TABLE IF NOT EXISTS `tipo_cursos` (
`id` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `abreviatura` varchar(4) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accents`
--
ALTER TABLE `accents`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjuntos`
--
ALTER TABLE `adjuntos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asistencias`
--
ALTER TABLE `asistencias`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `clase_id` (`clase_id`,`persona_id`);

--
-- Indexes for table `authorities`
--
ALTER TABLE `authorities`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ix_auth_username` (`id`,`authority`);

--
-- Indexes for table `cambios`
--
ALTER TABLE `cambios`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancelaciones`
--
ALTER TABLE `cancelaciones`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancelacion_estudiantes`
--
ALTER TABLE `cancelacion_estudiantes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancelacion_profesores`
--
ALTER TABLE `cancelacion_profesores`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carga_horarias`
--
ALTER TABLE `carga_horarias`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clases`
--
ALTER TABLE `clases`
 ADD PRIMARY KEY (`id`), ADD KEY `curso_id` (`curso_id`), ADD KEY `profesor_id` (`profesor_id`);

--
-- Indexes for table `clase_cuotas`
--
ALTER TABLE `clase_cuotas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clase_cursos`
--
ALTER TABLE `clase_cursos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `como_supos`
--
ALTER TABLE `como_supos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `constantes`
--
ALTER TABLE `constantes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuotas`
--
ALTER TABLE `cuotas`
 ADD PRIMARY KEY (`id`), ADD KEY `persona_curso` (`persona_id`,`curso_id`);

--
-- Indexes for table `cuotas_modificaciones`
--
ALTER TABLE `cuotas_modificaciones`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
 ADD PRIMARY KEY (`id`), ADD KEY `codigo_curso` (`codigo_curso`);

--
-- Indexes for table `cursos_nombres_viejos`
--
ALTER TABLE `cursos_nombres_viejos`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `curso_ofrecidos`
--
ALTER TABLE `curso_ofrecidos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `curso_profesores`
--
ALTER TABLE `curso_profesores`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `duracion_modos`
--
ALTER TABLE `duracion_modos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estados`
--
ALTER TABLE `estados`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extension_cursadas`
--
ALTER TABLE `extension_cursadas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_personas`
--
ALTER TABLE `extra_personas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feriados`
--
ALTER TABLE `feriados`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_permission`
--
ALTER TABLE `group_permission`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `honorario_profesores`
--
ALTER TABLE `honorario_profesores`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `horario_cursos`
--
ALTER TABLE `horario_cursos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `horario_profesores`
--
ALTER TABLE `horario_profesores`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `horario_profesor_excepciones`
--
ALTER TABLE `horario_profesor_excepciones`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `idioma_estudiares`
--
ALTER TABLE `idioma_estudiares`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `idioma_modalidades`
--
ALTER TABLE `idioma_modalidades`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `idioma_modalidad` (`modalidad_curso_id`,`idioma_estudiar_id`);

--
-- Indexes for table `idioma_nativos`
--
ALTER TABLE `idioma_nativos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inscripciones`
--
ALTER TABLE `inscripciones`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `curso_id` (`curso_id`,`persona_id`,`modalidad_curso_id`,`fecha_comienzo`,`fecha_finalizacion`);

--
-- Indexes for table `inscripciones_individuales`
--
ALTER TABLE `inscripciones_individuales`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modalidad_cursos`
--
ALTER TABLE `modalidad_cursos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modalidad_disponibles`
--
ALTER TABLE `modalidad_disponibles`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `curso_id` (`curso_id`,`modalidad_curso_id`);

--
-- Indexes for table `modalidad_pagos`
--
ALTER TABLE `modalidad_pagos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monedas`
--
ALTER TABLE `monedas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `motivos`
--
ALTER TABLE `motivos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nacionalidades`
--
ALTER TABLE `nacionalidades`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `niveles`
--
ALTER TABLE `niveles`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notificaciones`
--
ALTER TABLE `notificaciones`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notificacion_enviadas`
--
ALTER TABLE `notificacion_enviadas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orientaciones`
--
ALTER TABLE `orientaciones`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
 ADD PRIMARY KEY (`id`), ADD KEY `persona_id` (`persona_id`);

--
-- Indexes for table `pagos_parciales`
--
ALTER TABLE `pagos_parciales`
 ADD PRIMARY KEY (`id`), ADD KEY `cuota_id` (`cuota_id`), ADD KEY `pago_id` (`pago_id`);

--
-- Indexes for table `personas`
--
ALTER TABLE `personas`
 ADD PRIMARY KEY (`id`), ADD KEY `estado_id` (`estado_id`), ADD KEY `apellido` (`apellido`), ADD KEY `nombre` (`nombre`);

--
-- Indexes for table `persona_bajas`
--
ALTER TABLE `persona_bajas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profesores`
--
ALTER TABLE `profesores`
 ADD PRIMARY KEY (`id`), ADD KEY `nombre` (`nombre`), ADD KEY `email` (`email`);

--
-- Indexes for table `profesor_idiomas`
--
ALTER TABLE `profesor_idiomas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promociones`
--
ALTER TABLE `promociones`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocion_estudiantes`
--
ALTER TABLE `promocion_estudiantes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `speeches`
--
ALTER TABLE `speeches`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sucursales`
--
ALTER TABLE `sucursales`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_cancelaciones`
--
ALTER TABLE `tipo_cancelaciones`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_cursos`
--
ALTER TABLE `tipo_cursos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;