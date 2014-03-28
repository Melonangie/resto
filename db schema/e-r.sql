/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : cocina-taikishi

Target Server Type    : PGSQL
Target Server Version : 90100
File Encoding         : 65001

Date: 2014-02-28 22:26:47
*/

;

-- ----------------------------
-- Table structure for bienes
-- ----------------------------
DROP TABLE IF EXISTS "bienes";
CREATE TABLE "bienes" (
"id_bienes" int4 NOT NULL,
"descripcion" varchar(50) NOT NULL,
"tipo" varchar(30) NOT NULL,
"unidad_medida" varchar(20) NOT NULL
)

;

-- ----------------------------
-- Records of bienes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cargo
-- ----------------------------
DROP TABLE IF EXISTS "cargo";
CREATE TABLE "cargo" (
"id_cargo" int4 NOT NULL,
"nom_cargo" varchar(30) NOT NULL,
"Descripcion" varchar(45) NOT NULL
)

;

-- ----------------------------
-- Records of cargo
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS "clientes";
CREATE TABLE "clientes" (
"id_clientes" int4 NOT NULL,
"nom_cliente" varchar(45) NOT NULL,
"descripcion" varchar(45) NOT NULL
)

;

-- ----------------------------
-- Records of clientes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for egreso
-- ----------------------------
DROP TABLE IF EXISTS "egreso";
CREATE TABLE "egreso" (
"id_egreso" int4 NOT NULL,
"id_solicitud_receta" int4 NOT NULL,
"fecha_egreso" date NOT NULL
)

;

-- ----------------------------
-- Records of egreso
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ingreso
-- ----------------------------
DROP TABLE IF EXISTS "ingreso";
CREATE TABLE "ingreso" (
"id_ingreso" int4 NOT NULL,
"id_solicitud_bienes" int4 NOT NULL,
"fecha_ingreso" date NOT NULL
)

;

-- ----------------------------
-- Records of ingreso
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for inventario
-- ----------------------------
DROP TABLE IF EXISTS "inventario";
CREATE TABLE "inventario" (
"id_inventario" int4 NOT NULL,
"id_bienes" int4 NOT NULL,
"Cantidad" int4 NOT NULL,
"id_ingreso" int4 NOT NULL
)

;

-- ----------------------------
-- Records of inventario
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS "producto";
CREATE TABLE "producto" (
"id_producto" int4 NOT NULL,
"descripcion" varchar(45) NOT NULL,
"tipo" varchar(45) NOT NULL
)

;

-- ----------------------------
-- Records of producto
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for producto-uso
-- ----------------------------
DROP TABLE IF EXISTS "producto-uso";
CREATE TABLE "producto-uso" (
"id_prod_uso" int4 NOT NULL,
"id_inventario" int4 NOT NULL,
"cantidad" float8 NOT NULL,
"procentaje" float8 NOT NULL
)

;

-- ----------------------------
-- Records of producto-uso
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for proveedor
-- ----------------------------
DROP TABLE IF EXISTS "proveedor";
CREATE TABLE "proveedor" (
"id_proveedor" int4 NOT NULL,
"nom_provedor" varchar(45) NOT NULL,
"id_producto" int4 NOT NULL
)

;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for recetas
-- ----------------------------
DROP TABLE IF EXISTS "recetas";
CREATE TABLE "recetas" (
"id_receta" int4 NOT NULL,
"nombre" varchar(45) NOT NULL,
"id_prod_uso" int4 NOT NULL,
"descripcion" varchar(45) NOT NULL,
"porcentaje" float8 NOT NULL
)

;

-- ----------------------------
-- Records of recetas
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for responsable
-- ----------------------------
DROP TABLE IF EXISTS "responsable";
CREATE TABLE "responsable" (
"id_responsable" int4 NOT NULL,
"nombre_responsable" varchar(30) NOT NULL,
"id_cargo" int4 NOT NULL
)

;

-- ----------------------------
-- Records of responsable
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for solicitud
-- ----------------------------
DROP TABLE IF EXISTS "solicitud";
CREATE TABLE "solicitud" (
"id_solicitud" int4 NOT NULL,
"id_clientes" int4 NOT NULL,
"fecha_solicitud" date NOT NULL
)

;

-- ----------------------------
-- Records of solicitud
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for solicitud_bienes
-- ----------------------------
DROP TABLE IF EXISTS "solicitud_bienes";
CREATE TABLE "solicitud_bienes" (
"id_solicitud_bienes" int4 NOT NULL,
"id_proveedor" int4 NOT NULL,
"cantidad" int4 NOT NULL,
"id_responsable" int4 NOT NULL
)

;

-- ----------------------------
-- Records of solicitud_bienes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for solicitud_receta
-- ----------------------------
DROP TABLE IF EXISTS "solicitud_receta";
CREATE TABLE "solicitud_receta" (
"id_solicitud_receta" int4 NOT NULL,
"id_solicitud" int4 NOT NULL,
"cantidad" float8 NOT NULL,
"id_receta" int4 NOT NULL
)

;

-- ----------------------------
-- Records of solicitud_receta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Primary Key structure for table bienes
-- ----------------------------
ALTER TABLE "bienes" ADD PRIMARY KEY ("id_bienes");

-- ----------------------------
-- Primary Key structure for table cargo
-- ----------------------------
ALTER TABLE "cargo" ADD PRIMARY KEY ("id_cargo");

-- ----------------------------
-- Primary Key structure for table clientes
-- ----------------------------
ALTER TABLE "clientes" ADD PRIMARY KEY ("id_clientes");

-- ----------------------------
-- Indexes structure for table egreso
-- ----------------------------
CREATE INDEX "id_solicitud_bienes_idx" ON "egreso" USING btree (id_solicitud_receta);

-- ----------------------------
-- Primary Key structure for table egreso
-- ----------------------------
ALTER TABLE "egreso" ADD PRIMARY KEY ("id_egreso");

-- ----------------------------
-- Indexes structure for table ingreso
-- ----------------------------
CREATE INDEX "id_orden_compara_idx" ON "ingreso" USING btree (id_solicitud_bienes);

-- ----------------------------
-- Primary Key structure for table ingreso
-- ----------------------------
ALTER TABLE "ingreso" ADD PRIMARY KEY ("id_ingreso");

-- ----------------------------
-- Indexes structure for table inventario
-- ----------------------------
CREATE INDEX "id_bienes_idx" ON "inventario" USING btree (id_bienes);
CREATE INDEX "id_ingreso_idx" ON "inventario" USING btree (id_ingreso);

-- ----------------------------
-- Primary Key structure for table inventario
-- ----------------------------
ALTER TABLE "inventario" ADD PRIMARY KEY ("id_inventario");

-- ----------------------------
-- Primary Key structure for table producto
-- ----------------------------
ALTER TABLE "producto" ADD PRIMARY KEY ("id_producto");

-- ----------------------------
-- Indexes structure for table producto-uso
-- ----------------------------
CREATE INDEX "id_inventario_idx" ON "producto-uso" USING btree (id_inventario);

-- ----------------------------
-- Primary Key structure for table producto-uso
-- ----------------------------
ALTER TABLE "producto-uso" ADD PRIMARY KEY ("id_prod_uso");

-- ----------------------------
-- Indexes structure for table proveedor
-- ----------------------------
CREATE INDEX "id_producto_idx" ON "proveedor" USING btree (id_producto);

-- ----------------------------
-- Primary Key structure for table proveedor
-- ----------------------------
ALTER TABLE "proveedor" ADD PRIMARY KEY ("id_proveedor");

-- ----------------------------
-- Indexes structure for table recetas
-- ----------------------------
CREATE INDEX "id_prod_uso_idx" ON "recetas" USING btree (id_prod_uso);

-- ----------------------------
-- Primary Key structure for table recetas
-- ----------------------------
ALTER TABLE "recetas" ADD PRIMARY KEY ("id_receta");

-- ----------------------------
-- Indexes structure for table responsable
-- ----------------------------
CREATE INDEX "id_cargo_idx" ON "responsable" USING btree (id_cargo);

-- ----------------------------
-- Primary Key structure for table responsable
-- ----------------------------
ALTER TABLE "responsable" ADD PRIMARY KEY ("id_responsable");

-- ----------------------------
-- Indexes structure for table solicitud
-- ----------------------------
CREATE INDEX "id_clientes_idx" ON "solicitud" USING btree (id_clientes);

-- ----------------------------
-- Primary Key structure for table solicitud
-- ----------------------------
ALTER TABLE "solicitud" ADD PRIMARY KEY ("id_solicitud");

-- ----------------------------
-- Indexes structure for table solicitud_bienes
-- ----------------------------
CREATE INDEX "id_proveedor_idx" ON "solicitud_bienes" USING btree (id_proveedor);
CREATE INDEX "id_responsable_idx" ON "solicitud_bienes" USING btree (id_responsable);

-- ----------------------------
-- Primary Key structure for table solicitud_bienes
-- ----------------------------
ALTER TABLE "solicitud_bienes" ADD PRIMARY KEY ("id_solicitud_bienes");

-- ----------------------------
-- Indexes structure for table solicitud_receta
-- ----------------------------
CREATE INDEX "id_solicitud_idx" ON "solicitud_receta" USING btree (id_solicitud);
CREATE INDEX "id_receta_idx" ON "solicitud_receta" USING btree (id_receta);

-- ----------------------------
-- Primary Key structure for table solicitud_receta
-- ----------------------------
ALTER TABLE "solicitud_receta" ADD PRIMARY KEY ("id_solicitud_receta");

-- ----------------------------
-- Foreign Key structure for table "egreso"
-- ----------------------------
ALTER TABLE "egreso" ADD FOREIGN KEY ("id_solicitud_receta") REFERENCES "solicitud_receta" ("id_solicitud_receta");

-- ----------------------------
-- Foreign Key structure for table "ingreso"
-- ----------------------------
ALTER TABLE "ingreso" ADD FOREIGN KEY ("id_solicitud_bienes") REFERENCES "solicitud_bienes" ("id_solicitud_bienes");

-- ----------------------------
-- Foreign Key structure for table "inventario"
-- ----------------------------
ALTER TABLE "inventario" ADD FOREIGN KEY ("id_bienes") REFERENCES "bienes" ("id_bienes");
ALTER TABLE "inventario" ADD FOREIGN KEY ("id_ingreso") REFERENCES "ingreso" ("id_ingreso");

-- ----------------------------
-- Foreign Key structure for table "producto-uso"
-- ----------------------------
ALTER TABLE "producto-uso" ADD FOREIGN KEY ("id_inventario") REFERENCES "inventario" ("id_inventario");

-- ----------------------------
-- Foreign Key structure for table "proveedor"
-- ----------------------------
ALTER TABLE "proveedor" ADD FOREIGN KEY ("id_producto") REFERENCES "producto" ("id_producto");

-- ----------------------------
-- Foreign Key structure for table "recetas"
-- ----------------------------
ALTER TABLE "recetas" ADD FOREIGN KEY ("id_prod_uso") REFERENCES "producto-uso" ("id_prod_uso");

-- ----------------------------
-- Foreign Key structure for table "responsable"
-- ----------------------------
ALTER TABLE "responsable" ADD FOREIGN KEY ("id_cargo") REFERENCES "cargo" ("id_cargo");

-- ----------------------------
-- Foreign Key structure for table "solicitud"
-- ----------------------------
ALTER TABLE "solicitud" ADD FOREIGN KEY ("id_clientes") REFERENCES "clientes" ("id_clientes");

-- ----------------------------
-- Foreign Key structure for table "solicitud_bienes"
-- ----------------------------
ALTER TABLE "solicitud_bienes" ADD FOREIGN KEY ("id_proveedor") REFERENCES "proveedor" ("id_proveedor");
ALTER TABLE "solicitud_bienes" ADD FOREIGN KEY ("id_responsable") REFERENCES "responsable" ("id_responsable");

-- ----------------------------
-- Foreign Key structure for table "solicitud_receta"
-- ----------------------------
ALTER TABLE "solicitud_receta" ADD FOREIGN KEY ("id_receta") REFERENCES "recetas" ("id_receta");
ALTER TABLE "solicitud_receta" ADD FOREIGN KEY ("id_solicitud") REFERENCES "solicitud" ("id_solicitud");
