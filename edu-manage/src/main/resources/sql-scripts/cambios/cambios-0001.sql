CREATE TABLE IF NOT EXISTS `estado_inscripcion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `abreviatura` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
ALTER TABLE `inscripciones` ADD `estado_id` INT NOT NULL DEFAULT '1' AFTER `borrada`;
ALTER TABLE `estado_inscripcion` ADD PRIMARY KEY(`id`);";
ALTER TABLE `estado_inscripcion` CHANGE `id` `id` INT(11) NOT NULL AUTO_INCREMENT;
alter table inscripciones 
add  `materia` varchar(60) DEFAULT NULL,
add  `nivel` varchar(50) DEFAULT NULL,
add  `clases_semanales` int(11) DEFAULT NULL,
add  `horas_clase` varchar(30) DEFAULT NULL,
add  `dias_preferidos` varchar(60) DEFAULT NULL,
add  `dias_alternativos` varchar(60) DEFAULT NULL,
add  `horario_preferido` varchar(60) DEFAULT NULL,
add  `horario_alternativo` varchar(60) DEFAULT NULL,
add  `sexo_profesor` varchar(10) DEFAULT NULL,
add `preferencia_idioma` varchar(30) DEFAULT NULL,
add  `idioma_estudiar_id` int(11) DEFAULT NULL,
add  `nivel_id` int(11) DEFAULT NULL,
add  `orientacion_id` int(11) DEFAULT NULL,
add  `profesor_posible_id` int(11) DEFAULT NULL,
add  `cual_examen` varchar(20) DEFAULT NULL,
add  `otra_orientacion` varchar(40) DEFAULT NULL,
add  `sucursal_id` int(11) DEFAULT '0';
