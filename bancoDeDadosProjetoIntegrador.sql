-- MySQL Script generated by MySQL Workbench
-- Mon Jun 27 15:46:38 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_e-elasGen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_e-elasGen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_e-elasGen` DEFAULT CHARACTER SET utf8 ;
USE `db_e-elasGen` ;

-- -----------------------------------------------------
-- Table `db_e-elasGen`.`tb_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_e-elasGen`.`tb_categorias` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(255) NOT NULL,
  `classe` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_e-elasGen`.`tb_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_e-elasGen`.`tb_usuarios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `sobrenome` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_e-elasGen`.`tb_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_e-elasGen`.`tb_produtos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(1000) NOT NULL,
  `preco` DECIMAL NOT NULL,
  `quantidade` INT UNSIGNED NOT NULL,
  `imagem` VARCHAR(255) NULL,
  `categoria_id` BIGINT NULL,
  `tusuario_id` BIGINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_produtos_tb_categorias_idx` (`categoria_id` ASC) VISIBLE,
  INDEX `fk_tb_produtos_tb_usuarios1_idx` (`tusuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_produtos_tb_categorias`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `db_e-elasGen`.`tb_categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produtos_tb_usuarios1`
    FOREIGN KEY (`tusuario_id`)
    REFERENCES `db_e-elasGen`.`tb_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
