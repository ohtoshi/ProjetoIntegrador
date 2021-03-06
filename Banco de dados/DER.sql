-- MySQL Script generated by MySQL Workbench
-- Tue Mar 22 15:43:55 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProjetoIntegrador
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProjetoIntegrador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjetoIntegrador` DEFAULT CHARACTER SET utf8 ;
USE `ProjetoIntegrador` ;

-- -----------------------------------------------------
-- Table `ProjetoIntegrador`.`tb_tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoIntegrador`.`tb_tema` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(255) NOT NULL,
  `estado` VARCHAR(255) NOT NULL,
  `urgente` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoIntegrador`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoIntegrador`.`tb_usuario` (
  `id` BIGINT NOT NULL,
  `nome_completo` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `senha` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoIntegrador`.`tb_postagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoIntegrador`.`tb_postagem` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `texto` VARCHAR(1000) NOT NULL,
  `endereco_ocorrencia` VARCHAR(255) NOT NULL,
  `data` DATE NOT NULL,
  `tb_tema_id` BIGINT NOT NULL,
  `tb_usuario_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_postagem_tb_tema_idx` (`tb_tema_id` ASC) VISIBLE,
  INDEX `fk_tb_postagem_tb_usuario1_idx` (`tb_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_postagem_tb_tema`
    FOREIGN KEY (`tb_tema_id`)
    REFERENCES `ProjetoIntegrador`.`tb_tema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_postagem_tb_usuario1`
    FOREIGN KEY (`tb_usuario_id`)
    REFERENCES `ProjetoIntegrador`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
