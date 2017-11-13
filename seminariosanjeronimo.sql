-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2017 a las 05:41:37
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `seminariosanjeronimo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idadministrador` int(11) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidoPaterno` varchar(45) DEFAULT NULL,
  `apellidoMaterno` varchar(45) DEFAULT NULL,
  `ci` int(11) DEFAULT NULL,
  `nacionalidad` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaestudiante`
--

CREATE TABLE `categoriaestudiante` (
  `idcategoriaEstudiante` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoriaestudiante`
--

INSERT INTO `categoriaestudiante` (`idcategoriaEstudiante`, `nombre`) VALUES
(1, 'Ordinario'),
(2, 'Ordinario Libre'),
(3, 'Extraordinario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoeclesiastico`
--

CREATE TABLE `estadoeclesiastico` (
  `idestadoEclesiastico` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estadoeclesiastico`
--

INSERT INTO `estadoeclesiastico` (`idestadoEclesiastico`, `nombre`) VALUES
(1, 'Diocesano'),
(2, 'Religioso'),
(3, 'Laico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `idestudiante` int(11) NOT NULL,
  `idcategoriaEstudiante` int(11) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidoPaterno` varchar(45) DEFAULT NULL,
  `apellidoMaterno` varchar(45) DEFAULT NULL,
  `ci` int(11) DEFAULT NULL,
  `nacionalidad` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `descripcionEstadoEclesiastico` varchar(45) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idestadoEclesiastico` int(11) NOT NULL,
  `celular` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`idestudiante`, `idcategoriaEstudiante`, `nombres`, `apellidoPaterno`, `apellidoMaterno`, `ci`, `nacionalidad`, `fechaNacimiento`, `telefono`, `direccion`, `descripcionEstadoEclesiastico`, `idusuario`, `idestadoEclesiastico`, `celular`) VALUES
(4, 1, 'Mateo Enrique', 'Navia', 'Koehnke', 6889159, 'Boliviana', '1997-03-12', 2748569, 'Achumani', 'Mi Congre', NULL, 1, 72013548),
(5, 1, 'Liber David', 'Alfaro', 'Diez de Medina', 6889159, 'Boliviana', '1996-07-13', 2740308, 'Mallasilla', 'Culgis', NULL, 3, 67067892),
(6, 1, 'Davo', 'akldjflad', 'adfasdf', 1164265, 'denver', '2014-03-05', 2625228, 'Maslfad', 'dfakjdhf', NULL, 1, 5644),
(7, 1, 'MAMOOONASO', 'ALKDFKLAJSDF', 'fadjfklad', 5456464, 'jkawrhtkajhf', '2015-05-08', 456487464, 'MI Casa', 'kdejfjfl', NULL, 1, 5985465);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion`
--

CREATE TABLE `gestion` (
  `idgestion` int(11) NOT NULL,
  `año` int(11) DEFAULT NULL,
  `semestre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `idhorarios` int(11) NOT NULL,
  `hora` time DEFAULT NULL,
  `dia` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idmateria` int(11) NOT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `idnivelEstudio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`idmateria`, `codigo`, `nombre`, `creditos`, `idnivelEstudio`) VALUES
(1, 'TEO - 315', 'Matrimonio y Orden', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiaestudiante`
--

CREATE TABLE `materiaestudiante` (
  `idmateriaEstudiante` int(11) NOT NULL,
  `idmateriaNivelGestion` int(11) NOT NULL,
  `idestudiante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materianivelgestion`
--

CREATE TABLE `materianivelgestion` (
  `idmateriaNivelGestion` int(11) NOT NULL,
  `idmateria` int(11) NOT NULL,
  `idgestion` int(11) NOT NULL,
  `idhorarios` int(11) NOT NULL,
  `idprofesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivelestudio`
--

CREATE TABLE `nivelestudio` (
  `idnivelEstudio` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nivelestudio`
--

INSERT INTO `nivelestudio` (`idnivelEstudio`, `nombre`) VALUES
(1, 'Curso Propedeutico'),
(2, 'Bienio Filosofico'),
(3, 'Trienio Teologico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `idnotasParciales` int(11) NOT NULL,
  `primerParcial` double DEFAULT NULL,
  `segundoParcial` double DEFAULT NULL,
  `tercerParcial` double DEFAULT NULL,
  `finalPrimerTurno` double DEFAULT NULL,
  `finalSegundoTurno` double DEFAULT NULL,
  `idmateriaEstudiante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `idprofesor` int(11) NOT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidoPaterno` varchar(45) DEFAULT NULL,
  `apellidoMaterno` varchar(45) DEFAULT NULL,
  `ci` int(11) DEFAULT NULL,
  `nacionalidad` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `tituloCivil` varchar(45) DEFAULT NULL,
  `tituloEclesiastico` varchar(45) DEFAULT NULL,
  `lugarObtencionTitulo` varchar(45) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idtipoProfesion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`idprofesor`, `nombres`, `apellidoPaterno`, `apellidoMaterno`, `ci`, `nacionalidad`, `fechaNacimiento`, `telefono`, `direccion`, `tituloCivil`, `tituloEclesiastico`, `lugarObtencionTitulo`, `idusuario`, `idtipoProfesion`) VALUES
(2, 'Juan Ignacio', 'Reyes', 'Gutierrez', 6895231, 'Brasilera', '1972-05-12', 0, '', 'Datamining', '', 'UPB', NULL, 2),
(3, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(4, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(5, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(6, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(7, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(8, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(9, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(10, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(11, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(12, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(13, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(14, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(15, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1),
(16, '', '', '', 0, '', '0000-00-00', 0, '', '', '', '', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoprofesion`
--

CREATE TABLE `tipoprofesion` (
  `idtipoProfesion` int(11) NOT NULL,
  `descrip` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipoprofesion`
--

INSERT INTO `tipoprofesion` (`idtipoProfesion`, `descrip`) VALUES
(1, 'Licenciado'),
(2, 'Doctor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idtipoUsuario` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idtipoUsuario`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Docente'),
(3, 'Estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `idtipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `idtipoUsuario`) VALUES
(1, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idadministrador`),
  ADD KEY `fk_administrador_usuario1_idx` (`idusuario`);

--
-- Indices de la tabla `categoriaestudiante`
--
ALTER TABLE `categoriaestudiante`
  ADD PRIMARY KEY (`idcategoriaEstudiante`);

--
-- Indices de la tabla `estadoeclesiastico`
--
ALTER TABLE `estadoeclesiastico`
  ADD PRIMARY KEY (`idestadoEclesiastico`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`idestudiante`),
  ADD KEY `fk_estudiante_categoriaEstudiante_idx` (`idcategoriaEstudiante`),
  ADD KEY `fk_estudiante_usuario1_idx` (`idusuario`),
  ADD KEY `fk_estudiante_estadoEclesiastico1_idx` (`idestadoEclesiastico`);

--
-- Indices de la tabla `gestion`
--
ALTER TABLE `gestion`
  ADD PRIMARY KEY (`idgestion`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`idhorarios`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idmateria`),
  ADD KEY `idnivel` (`idnivelEstudio`);

--
-- Indices de la tabla `materiaestudiante`
--
ALTER TABLE `materiaestudiante`
  ADD PRIMARY KEY (`idmateriaEstudiante`),
  ADD KEY `fk_materiaEstudiante_materiaNivelGestion1_idx` (`idmateriaNivelGestion`),
  ADD KEY `fk_materiaEstudiante_estudiante1_idx` (`idestudiante`);

--
-- Indices de la tabla `materianivelgestion`
--
ALTER TABLE `materianivelgestion`
  ADD PRIMARY KEY (`idmateriaNivelGestion`),
  ADD KEY `fk_materiaNivelGestion_gestion1_idx` (`idgestion`),
  ADD KEY `fk_materiaNivelGestion_materiaNivel1_idx` (`idmateria`),
  ADD KEY `fk_materiaNivelGestion_horarios1_idx` (`idhorarios`),
  ADD KEY `fk_materiaNivelGestion_profesor1_idx` (`idprofesor`);

--
-- Indices de la tabla `nivelestudio`
--
ALTER TABLE `nivelestudio`
  ADD PRIMARY KEY (`idnivelEstudio`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`idnotasParciales`),
  ADD KEY `fk_notasParciales_materiaEstudiante1_idx` (`idmateriaEstudiante`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`idprofesor`),
  ADD KEY `fk_profesor_usuario1_idx` (`idusuario`),
  ADD KEY `idtipoProfesion` (`idtipoProfesion`);

--
-- Indices de la tabla `tipoprofesion`
--
ALTER TABLE `tipoprofesion`
  ADD PRIMARY KEY (`idtipoProfesion`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idtipoUsuario`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_usuario_tipoUsuario1_idx` (`idtipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idadministrador` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `categoriaestudiante`
--
ALTER TABLE `categoriaestudiante`
  MODIFY `idcategoriaEstudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `estadoeclesiastico`
--
ALTER TABLE `estadoeclesiastico`
  MODIFY `idestadoEclesiastico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `idestudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `gestion`
--
ALTER TABLE `gestion`
  MODIFY `idgestion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idmateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `materiaestudiante`
--
ALTER TABLE `materiaestudiante`
  MODIFY `idmateriaEstudiante` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `materianivelgestion`
--
ALTER TABLE `materianivelgestion`
  MODIFY `idmateriaNivelGestion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `nivelestudio`
--
ALTER TABLE `nivelestudio`
  MODIFY `idnivelEstudio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `idnotasParciales` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `idprofesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `idtipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_administrador_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `fk_estudiante_categoriaEstudiante` FOREIGN KEY (`idcategoriaEstudiante`) REFERENCES `categoriaestudiante` (`idcategoriaEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiante_estadoEclesiastico1` FOREIGN KEY (`idestadoEclesiastico`) REFERENCES `estadoeclesiastico` (`idestadoEclesiastico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estudiante_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`idnivelEstudio`) REFERENCES `nivelestudio` (`idnivelEstudio`);

--
-- Filtros para la tabla `materiaestudiante`
--
ALTER TABLE `materiaestudiante`
  ADD CONSTRAINT `fk_materiaEstudiante_estudiante1` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materiaEstudiante_materiaNivelGestion1` FOREIGN KEY (`idmateriaNivelGestion`) REFERENCES `materianivelgestion` (`idmateriaNivelGestion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `materianivelgestion`
--
ALTER TABLE `materianivelgestion`
  ADD CONSTRAINT `fk_materiaNivelGestion_gestion1` FOREIGN KEY (`idgestion`) REFERENCES `gestion` (`idgestion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materiaNivelGestion_horarios1` FOREIGN KEY (`idhorarios`) REFERENCES `horarios` (`idhorarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materiaNivelGestion_profesor1` FOREIGN KEY (`idprofesor`) REFERENCES `profesor` (`idprofesor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_notasParciales_materiaEstudiante1` FOREIGN KEY (`idmateriaEstudiante`) REFERENCES `materiaestudiante` (`idmateriaEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `fk_profesor_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`idtipoProfesion`) REFERENCES `tipoprofesion` (`idtipoProfesion`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_usuario_tipoUsuario1` FOREIGN KEY (`idtipoUsuario`) REFERENCES `tipousuario` (`idtipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
