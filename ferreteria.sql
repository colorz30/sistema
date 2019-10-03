-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 03-10-2019 a las 04:03:42
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ferreteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `NIT` varchar(200) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `telefono` varchar(200) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`NIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despacho`
--

DROP TABLE IF EXISTS `despacho`;
CREATE TABLE IF NOT EXISTS `despacho` (
  `id_despacho` int(11) NOT NULL AUTO_INCREMENT,
  `no_factura` int(11) NOT NULL,
  `id_sede` varchar(200) NOT NULL,
  PRIMARY KEY (`id_despacho`),
  KEY `fk_id_sede_despacho` (`id_sede`),
  KEY `fk_no_factura_despacho` (`no_factura`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `no_factura` int(11) NOT NULL,
  `id_producto` varchar(200) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor_unitario` float NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_no_factura` (`no_factura`),
  KEY `fk_id_producto` (`id_producto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_cliente`
--

DROP TABLE IF EXISTS `direccion_cliente`;
CREATE TABLE IF NOT EXISTS `direccion_cliente` (
  `id_direccion_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `NIT` varchar(200) NOT NULL,
  `calle` varchar(20) DEFAULT NULL,
  `avenida` varchar(20) DEFAULT NULL,
  `zona` int(11) NOT NULL,
  `departamento` varchar(200) NOT NULL,
  `municipio` varchar(200) NOT NULL,
  PRIMARY KEY (`id_direccion_cliente`),
  KEY `fk_nit_direccion` (`NIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_empleado`
--

DROP TABLE IF EXISTS `direccion_empleado`;
CREATE TABLE IF NOT EXISTS `direccion_empleado` (
  `id_direccion_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` varchar(200) NOT NULL,
  `calle` varchar(20) DEFAULT NULL,
  `avenida` varchar(20) DEFAULT NULL,
  `zona` int(11) NOT NULL,
  `departamento` varchar(200) NOT NULL,
  `municipio` varchar(200) NOT NULL,
  PRIMARY KEY (`id_direccion_empleado`),
  KEY `fk_id_empleado_direccion` (`id_empleado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id_empleado` varchar(200) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `id_sede` varchar(200) NOT NULL,
  `puesto` varchar(200) NOT NULL,
  `id_horario` varchar(200) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_id_sede` (`id_sede`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

DROP TABLE IF EXISTS `envio`;
CREATE TABLE IF NOT EXISTS `envio` (
  `id_envio` int(11) NOT NULL AUTO_INCREMENT,
  `NIT` varchar(200) NOT NULL,
  `estado` varchar(200) NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  PRIMARY KEY (`id_envio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `no_factura` int(11) NOT NULL AUTO_INCREMENT,
  `serie` varchar(20) NOT NULL,
  `NIT` varchar(200) NOT NULL,
  `id_empleado` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` float NOT NULL,
  `estado_envio` int(11) NOT NULL,
  PRIMARY KEY (`no_factura`),
  KEY `fk_nit` (`NIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

DROP TABLE IF EXISTS `horario`;
CREATE TABLE IF NOT EXISTS `horario` (
  `id_horario` varchar(200) NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `dias_turno` varchar(200) NOT NULL,
  PRIMARY KEY (`id_horario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

DROP TABLE IF EXISTS `kardex`;
CREATE TABLE IF NOT EXISTS `kardex` (
  `no_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` varchar(200) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` float NOT NULL,
  `id_proveedor` varchar(200) NOT NULL,
  `tipo_transaccion` varchar(200) NOT NULL,
  PRIMARY KEY (`no_movimiento`),
  KEY `fk_id_producto_kardex` (`id_producto`),
  KEY `fk_id_proveedor_kardex` (`id_proveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `id_marca` varchar(200) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `id_proveedor` varchar(200) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` varchar(200) NOT NULL,
  `stock` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `tipo` int(11) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `valor_unitario` float NOT NULL,
  `no_estante` varchar(200) NOT NULL,
  `estado_baja` int(11) DEFAULT '1',
  `codigo_barras` int(11) NOT NULL,
  `id_marca` varchar(200) NOT NULL,
  `maximo` int(11) NOT NULL,
  `minimo` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_tipo_detalle_producto` (`tipo`),
  KEY `fk_id_marca` (`id_marca`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` varchar(200) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `contacto` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

DROP TABLE IF EXISTS `sede`;
CREATE TABLE IF NOT EXISTS `sede` (
  `id_sede` varchar(200) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `ubicacion` varchar(200) NOT NULL,
  `id_horario` varchar(200) NOT NULL,
  PRIMARY KEY (`id_sede`),
  KEY `fk_id_horario` (`id_horario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
CREATE TABLE IF NOT EXISTS `tipo_producto` (
  `tipo` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`tipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rol_id` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rol_id` (`rol_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `username`, `email`, `password`, `fecha_registro`, `rol_id`) VALUES
(1, 'Josselin Morales', 'jmorales', 'raww.c20@gmail.com', '123', '2019-09-19 19:36:15', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
