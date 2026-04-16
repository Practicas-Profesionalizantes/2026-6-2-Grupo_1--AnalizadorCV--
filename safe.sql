-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-04-2026 a las 22:34:36
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `safe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cv`
--

CREATE TABLE `cv` (
  `id` int(11) NOT NULL,
  `dni` int(11) DEFAULT NULL,
  `archivo_cv` varchar(250) DEFAULT NULL,
  `cumple_requisitos` tinyint(1) DEFAULT NULL,
  `fecha_carga` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `id` int(11) NOT NULL,
  `duracion` int(11) DEFAULT NULL,
  `tipo` varchar(250) DEFAULT NULL,
  `puntaje_max` int(11) DEFAULT NULL,
  `puntaje_min` int(11) DEFAULT NULL,
  `online` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id` int(11) NOT NULL,
  `id_postulante` int(11) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id` int(11) NOT NULL,
  `id_postulante` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `mensaje` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulante`
--

CREATE TABLE `postulante` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `apellido` varchar(250) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo_electronico` varchar(250) DEFAULT NULL,
  `estado_civil` varchar(250) DEFAULT NULL,
  `info_medica` varchar(250) DEFAULT NULL,
  `experiencia` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `id` int(11) NOT NULL,
  `nombre_puesto` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `requisitos` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking`
--

CREATE TABLE `ranking` (
  `id` int(11) NOT NULL,
  `id_postulante` int(11) DEFAULT NULL,
  `promedio` decimal(10,0) DEFAULT NULL,
  `posicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado_evaluacion`
--

CREATE TABLE `resultado_evaluacion` (
  `id` int(11) NOT NULL,
  `id_evaluacion` int(11) DEFAULT NULL,
  `id_postulante` int(11) DEFAULT NULL,
  `puntaje_obtenido` int(11) DEFAULT NULL,
  `aprobado` tinyint(1) DEFAULT NULL,
  `intento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `contraseña` varchar(50) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dni` (`dni`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `postulante`
--
ALTER TABLE `postulante`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `resultado_evaluacion`
--
ALTER TABLE `resultado_evaluacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_evaluacion` (`id_evaluacion`),
  ADD KEY `id_postulante` (`id_postulante`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cv`
--
ALTER TABLE `cv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puesto`
--
ALTER TABLE `puesto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ranking`
--
ALTER TABLE `ranking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resultado_evaluacion`
--
ALTER TABLE `resultado_evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `cv_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `postulante` (`dni`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`dni`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`dni`);

--
-- Filtros para la tabla `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`dni`);

--
-- Filtros para la tabla `resultado_evaluacion`
--
ALTER TABLE `resultado_evaluacion`
  ADD CONSTRAINT `resultado_evaluacion_ibfk_1` FOREIGN KEY (`id_evaluacion`) REFERENCES `evaluacion` (`id`),
  ADD CONSTRAINT `resultado_evaluacion_ibfk_2` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`dni`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
