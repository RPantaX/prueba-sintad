CREATE DATABASE IF NOT EXISTS `db_transporte`;
USE db_transporte;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_entidad
-- ----------------------------
DROP TABLE IF EXISTS `tb_entidad`;
CREATE TABLE `tb_entidad` (
                              `id_entidad` int(11) NOT NULL AUTO_INCREMENT,
                              `id_tipo_documento` int(11) NOT NULL,
                              `nro_documento` varchar(25) NOT NULL,
                              `razon_social` varchar(100) NOT NULL,
                              `nombre_comercial` varchar(100) DEFAULT NULL,
                              `id_tipo_contribuyente` int(11) DEFAULT NULL,
                              `direccion` varchar(250) DEFAULT NULL,
                              `telefono` varchar(50) DEFAULT NULL,
                              `estado` bit(1) NOT NULL DEFAULT b'1',
                              PRIMARY KEY (`id_entidad`),
                              UNIQUE KEY `nro_documento_UNIQUE` (`nro_documento`),
                              KEY `fk_tb_entidad_tb_tipo_documento1_idx` (`id_tipo_documento`),
                              KEY `fk_tb_entidad_tb_tipo_contribuyente1_idx` (`id_tipo_contribuyente`),
                              CONSTRAINT `tb_entidad_ibfk_2` FOREIGN KEY (`id_tipo_contribuyente`) REFERENCES `tb_tipo_contribuyente` (`id_tipo_contribuyente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
                              CONSTRAINT `tb_entidad_ibfk_3` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tb_tipo_documento` (`id_tipo_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_entidad
-- ----------------------------
INSERT INTO `tb_entidad` VALUES ('1', '3', '20505327552', 'SYL S.A.C', 'SYL CARGO NOMBRE COMERCIAL', '1', 'Jr. Comandante Jimenez Nro. 166 Int. a (entre Cuadra 7 y 8 Javier Padro Oeste)', '79845612', '');
INSERT INTO `tb_entidad` VALUES ('2', '3', '20543844838', 'PUNTUAL EXPRESS S.A.C.', '', '1', 'MZA. F LOTE. 29 AS.RSD.MONTECARLO II LIMA - LIMA - SAN MARTIN DE PORRE', '', '');
INSERT INTO `tb_entidad` VALUES ('3', '3', '10410192999', 'ALVAREZ MACHUCA RENZO GUSTAVO', '', '3', 'AV. LOS ALISOS MZA. G LOTE. 05 ASC. LA ALBORADA DE OQUENDO III ETAPA (CRUCE PTE OQUENDO CON AV.NESTOR GAMBETTA) PROV. CONST. DEL CALLAO - PROV. CONST. DEL CALLAO - CALLAO', '', '');
INSERT INTO `tb_entidad` VALUES ('4', '3', '20600131037', 'CARNICOS MAFER S.A.C.', '', '2', 'CAL.EL UNIVERSO NRO. 327 URB. LA CAMPIÑA ZONA CINCO (ALTURA ', '', '');
INSERT INTO `tb_entidad` VALUES ('5', '3', '20556528218', 'SUMAQUINARIA S.A.C.', '', '2', 'AV. M.SUCRE NRO. 455 DPTO. 603 LIMA - LIMA - MAGDALENA DEL MAR', '', '');
INSERT INTO `tb_entidad` VALUES ('6', '3', '20545412528', 'OASIS FOODS S.A.C.', '', '2', 'CAL. FRANCISCO MASIAS NRO. 370 URB. SAN EUGENIO (PISO 7) LIM', '', '');
INSERT INTO `tb_entidad` VALUES ('7', '3', '20510620195', 'INVERSIONES PRO3 SAC', '', '2', 'AV. AUTOPIDTA RAMIRO PRIALE LOTE. 02 A.V. PROP HUERTOS DE HU', '', '');
INSERT INTO `tb_entidad` VALUES ('8', '3', '20498383361', 'REPUESTOS DAVID DIESEL E.I.R.L.', '', '2', 'CAR.VIA EVITAMIENTO MZA. 857 LOTE. 7 SEC. IRRIGACION EL CURAL 1 AREQUIPA - AREQUIPA - CERRO COLORADO', '', '');
INSERT INTO `tb_entidad` VALUES ('9', '6', 'CNAH00003', 'ANHUI HAYVO PROTECTIVE PRODUCT MANUFACTURING CO.,LTD', '', '4', '173 FENGLE AVENUE,ECNOMIC DEVELOPMENT ZONE,QUANJIAO COUNTY', '', '');

-- ----------------------------
-- Table structure for tb_tipo_contribuyente
-- ----------------------------
DROP TABLE IF EXISTS `tb_tipo_contribuyente`;
CREATE TABLE `tb_tipo_contribuyente` (
                                         `id_tipo_contribuyente` int(11) NOT NULL AUTO_INCREMENT,
                                         `nombre` varchar(50) NOT NULL,
                                         `estado` bit(1) NOT NULL,
                                         PRIMARY KEY (`id_tipo_contribuyente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tipo_contribuyente
-- ----------------------------
INSERT INTO `tb_tipo_contribuyente` VALUES ('1', 'Natural Sin Negocio', '');
INSERT INTO `tb_tipo_contribuyente` VALUES ('2', 'Juridica', '');
INSERT INTO `tb_tipo_contribuyente` VALUES ('3', 'Natural Con Negocio', '');
INSERT INTO `tb_tipo_contribuyente` VALUES ('4', 'No Domiciliado', '');

-- ----------------------------
-- Table structure for tb_tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `tb_tipo_documento`;
CREATE TABLE `tb_tipo_documento` (
                                     `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT,
                                     `codigo` varchar(20) NOT NULL,
                                     `nombre` varchar(100) NOT NULL,
                                     `descripcion` varchar(200) DEFAULT NULL,
                                     `estado` bit(1) NOT NULL DEFAULT b'1',
                                     PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tipo_documento
-- ----------------------------
INSERT INTO `tb_tipo_documento` VALUES ('1', '4', 'CARNET DE EXTRANJERIA', 'CARNET DE EXTRANJERIA', '');
INSERT INTO `tb_tipo_documento` VALUES ('2', '7', 'PASAPORTE', 'PASAPORTE', '');
INSERT INTO `tb_tipo_documento` VALUES ('3', '11', 'PARTIDA DE NACIMIENTO - IDENTIDAD', 'PARTIDA DE NACIMIENTO - IDENTIDAD', '');
INSERT INTO `tb_tipo_documento` VALUES ('4', '99', 'OTROS', 'OTROS', '');
INSERT INTO `tb_tipo_documento` VALUES ('5', '6', 'RUC', 'REGISTRO UNICO DEL CONTRIBUYENTE', '');
INSERT INTO `tb_tipo_documento` VALUES ('6', '1', 'DNI', 'DOCUMENTO NACIONAL DE IDENTIDAD', '');


-- Tabla para los usuarios
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
                       `id_user`  int(11) NOT NULL AUTO_INCREMENT,
                       `numero_celular` VARCHAR(255) NULL,
                       `usuario` VARCHAR(255) NOT NULL UNIQUE,
                       `password` VARCHAR(255) NOT NULL,
                       `estado` bit(1) NOT NULL DEFAULT b'1',
                       `modificado_por` VARCHAR(15) NOT NULL,
                       `creado_en` TIMESTAMP NOT NULL,
                       `modificado_en` TIMESTAMP NULL,
                       `eliminado_en` TIMESTAMP NULL,
                       `rol` ENUM('USER', 'ADMIN') NOT NULL,
                        PRIMARY KEY (`id_user`),
                        UNIQUE KEY `usuario_UNIQUE` (`usuario`)
);


-- Tabla para Camiones
DROP TABLE IF EXISTS `tb_camion`;

CREATE TABLE `tb_camion` (
                             `id_camion` INT(11) NOT NULL AUTO_INCREMENT,
                             `placa` VARCHAR(20) NOT NULL UNIQUE,
                             `marca` VARCHAR(50) NOT NULL,
                             `modelo` VARCHAR(50) NOT NULL,
                             `year_fabricacion` YEAR NOT NULL,
                             `estado` BIT(1) NOT NULL DEFAULT b'1',
                             `creado_en` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `modificado_en` TIMESTAMP NULL DEFAULT NULL,
                             `eliminado_en` TIMESTAMP NULL DEFAULT NULL,
                             PRIMARY KEY (`id_camion`),
                             UNIQUE KEY `placa_UNIQUE` (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Tabla para Camioneros
DROP TABLE IF EXISTS `tb_camionero`;
CREATE TABLE `tb_camionero` (
                                `id_camionero` INT(11) NOT NULL AUTO_INCREMENT,
                                `dni` VARCHAR(8) NOT NULL,
                                `nombres` VARCHAR(200) NOT NULL,
                                `apellidos` VARCHAR(200) NOT NULL ,
                                `direccion` VARCHAR(250)  NULL ,
                                `telefono` VARCHAR(9) NULL ,
                                `edad` INT(11) NOT NULL ,
                                `id_entidad` INT(11) NOT NULL,
                                `id_camion` INT(11) NOT NULL,
                                `nro_licencia` VARCHAR(20) NOT NULL UNIQUE,
                                `estado` BIT(1) NOT NULL DEFAULT b'1',
                                `creado_en` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                `modificado_en` TIMESTAMP NULL DEFAULT NULL,
                                `eliminado_en` TIMESTAMP NULL DEFAULT NULL,
                                PRIMARY KEY (`id_camionero`),
                                UNIQUE KEY `id_entidad_UNIQUE` (`id_entidad`),
                                UNIQUE KEY `id_camion_UNIQUE` (`id_camion`),
                                KEY `fk_camionero_entidad_idx` (`id_entidad`),
                                KEY `fk_camionero_camion_idx` (`id_camion`),
                                CONSTRAINT `fk_camionero_entidad` FOREIGN KEY (`id_entidad`) REFERENCES `tb_entidad` (`id_entidad`) ON DELETE CASCADE ON UPDATE CASCADE,
                                CONSTRAINT `fk_camionero_camion` FOREIGN KEY (`id_camion`) REFERENCES `tb_camion` (`id_camion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;