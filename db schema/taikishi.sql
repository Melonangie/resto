/*
 Navicat Premium Data Transfer

 Source Server         : vagrant
 Source Server Type    : PostgreSQL
 Source Server Version : 80420
 Source Host           : 127.0.0.1
 Source Database       : taikishi
 Source Schema         : inventario

 Target Server Type    : PostgreSQL
 Target Server Version : 80420
 File Encoding         : utf-8

 Date: 02/27/2014 12:40:06 PM
*/

-- ----------------------------
--  Table structure for empresa_tipo
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."empresa_tipo";
CREATE TABLE "inventario"."empresa_tipo" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."empresa_tipo" OWNER TO "postgres";

-- ----------------------------
--  Table structure for unidad
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."unidad";
CREATE TABLE "inventario"."unidad" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."unidad" OWNER TO "postgres";

-- ----------------------------
--  Table structure for usuario_nivel
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."usuario_nivel";
CREATE TABLE "inventario"."usuario_nivel" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."usuario_nivel" OWNER TO "postgres";

-- ----------------------------
--  Table structure for paquete
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."paquete";
CREATE TABLE "inventario"."paquete" (
	"id" int4 NOT NULL,
	"clave" varchar(55) NOT NULL,
	"id_subcategoria" int4 NOT NULL,
	"nombre" varchar(75) NOT NULL,
	"descripcion" varchar(255),
	"unidad" int4 NOT NULL,
	"precio_unidad" money NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."paquete" OWNER TO "postgres";

-- ----------------------------
--  Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."categoria";
CREATE TABLE "inventario"."categoria" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."categoria" OWNER TO "postgres";

-- ----------------------------
--  Table structure for entrada_ajuste
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."entrada_ajuste";
CREATE TABLE "inventario"."entrada_ajuste" (
	"id_entrada" int4 NOT NULL,
	"razon" varchar(255) NOT NULL,
	"clave" varchar(55) NOT NULL,
	"cantidad" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."entrada_ajuste" OWNER TO "postgres";

-- ----------------------------
--  Table structure for salida
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."salida";
CREATE TABLE "inventario"."salida" (
	"id" int4 NOT NULL,
	"fecha" timestamp(6) NOT NULL,
	"id_empleado" int4 NOT NULL,
	"id_almacen" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."salida" OWNER TO "postgres";

-- ----------------------------
--  Table structure for contacto
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."contacto";
CREATE TABLE "inventario"."contacto" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"paterno" varchar(55) NOT NULL,
	"materno" varchar(55) NOT NULL,
	"puesto" varchar(55) NOT NULL,
	"telefono" int4,
	"extension" int4,
	"celular" int4,
	"email" varchar(255),
	"giro_empresa" varchar(55),
	"horario" varchar(55),
	"web" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."contacto" OWNER TO "postgres";

-- ----------------------------
--  Table structure for inventario_merma
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."inventario_merma";
CREATE TABLE "inventario"."inventario_merma" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."inventario_merma" OWNER TO "postgres";

-- ----------------------------
--  Table structure for paquete_detalle
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."paquete_detalle";
CREATE TABLE "inventario"."paquete_detalle" (
	"id_paquete" int4 NOT NULL,
	"clave" varchar(55) NOT NULL,
	"unidad" int4 NOT NULL,
	"cantidad" int4 NOT NULL,
	"status" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."paquete_detalle" OWNER TO "postgres";

-- ----------------------------
--  Table structure for inventario_almacenaje
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."inventario_almacenaje";
CREATE TABLE "inventario"."inventario_almacenaje" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255),
	"costo" money NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."inventario_almacenaje" OWNER TO "postgres";

-- ----------------------------
--  Table structure for entrada_orden_compra
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."entrada_orden_compra";
CREATE TABLE "inventario"."entrada_orden_compra" (
	"id_entrada" int4 NOT NULL,
	"id_orden_embarque" int4 NOT NULL,
	"status" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."entrada_orden_compra" OWNER TO "postgres";

-- ----------------------------
--  Table structure for receta
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."receta";
CREATE TABLE "inventario"."receta" (
	"id" int4 NOT NULL,
	"clave" varchar(55) NOT NULL,
	"id_subcategoria" int4 NOT NULL,
	"nombre" varchar(75) NOT NULL,
	"descripcion" varchar(255),
	"unidad" int4 NOT NULL,
	"precio_unidad" money NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."receta" OWNER TO "postgres";

-- ----------------------------
--  Table structure for almacen_area
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."almacen_area";
CREATE TABLE "inventario"."almacen_area" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255) NOT NULL,
	"id_empleado_encargado" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."almacen_area" OWNER TO "postgres";

COMMENT ON COLUMN "inventario"."almacen_area"."id" IS 'areas como cocina, bar, barra';

-- ----------------------------
--  Table structure for salida_ajuste
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."salida_ajuste";
CREATE TABLE "inventario"."salida_ajuste" (
	"id_salida" int4 NOT NULL,
	"clave" varchar(55) NOT NULL,
	"cantidad" int4 NOT NULL,
	"razon" varchar(255) NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."salida_ajuste" OWNER TO "postgres";

-- ----------------------------
--  Table structure for almacen
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."almacen";
CREATE TABLE "inventario"."almacen" (
	"id" int4 NOT NULL,
	"id_empresa" int4 NOT NULL,
	"fecha_modificado" timestamp(6) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."almacen" OWNER TO "postgres";

COMMENT ON COLUMN "inventario"."almacen"."descripcion" IS 'almecen de cada local';

-- ----------------------------
--  Table structure for orden_embarque
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."orden_embarque";
CREATE TABLE "inventario"."orden_embarque" (
	"id" int4 NOT NULL,
	"id_orden_compra" int4 NOT NULL,
	"id_empleado_entrego" int4 NOT NULL,
	"id_empleado_recivo" int4 NOT NULL,
	"fecha_entrega" date NOT NULL,
	"total" money NOT NULL,
	"descuento" int4,
	"status" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."orden_embarque" OWNER TO "postgres";

-- ----------------------------
--  Table structure for tipo_pago
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."tipo_pago";
CREATE TABLE "inventario"."tipo_pago" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."tipo_pago" OWNER TO "postgres";

-- ----------------------------
--  Table structure for receta_detalle
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."receta_detalle";
CREATE TABLE "inventario"."receta_detalle" (
	"id_receta" int4 NOT NULL,
	"id_articulo" int4 NOT NULL,
	"cantidad" int4 NOT NULL,
	"id_articulo_unidad" int4 NOT NULL,
	"status" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."receta_detalle" OWNER TO "postgres";

-- ----------------------------
--  Table structure for orden_detalle
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."orden_detalle";
CREATE TABLE "inventario"."orden_detalle" (
	"id" int4 NOT NULL,
	"id_orden" int4 NOT NULL,
	"clave" varchar(55) NOT NULL,
	"cantidad" int4 NOT NULL,
	"precio_unitario" money NOT NULL,
	"iva" int4 NOT NULL,
	"descuento" int4,
	"status" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."orden_detalle" OWNER TO "postgres";

-- ----------------------------
--  Table structure for salida_orden_venta
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."salida_orden_venta";
CREATE TABLE "inventario"."salida_orden_venta" (
	"id_salida" int4 NOT NULL,
	"id_orden_detalle" int4 NOT NULL,
	"status" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."salida_orden_venta" OWNER TO "postgres";

-- ----------------------------
--  Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."status";
CREATE TABLE "inventario"."status" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."status" OWNER TO "postgres";

-- ----------------------------
--  Table structure for salida_pos_venta_detalle
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."salida_pos_venta_detalle";
CREATE TABLE "inventario"."salida_pos_venta_detalle" (
	"id" int4 NOT NULL,
	"id_salida_pos_venta" int4 NOT NULL,
	"clave" varchar(55) NOT NULL,
	"cantidad" int4 NOT NULL,
	"promocion" int4 NOT NULL,
	"descuento" int4 NOT NULL,
	"iva" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."salida_pos_venta_detalle" OWNER TO "postgres";

-- ----------------------------
--  Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."departamento";
CREATE TABLE "inventario"."departamento" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."departamento" OWNER TO "postgres";

-- ----------------------------
--  Table structure for empresa_pago
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."empresa_pago";
CREATE TABLE "inventario"."empresa_pago" (
	"id_empresa" int4 NOT NULL,
	"id_tipo_pago" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."empresa_pago" OWNER TO "postgres";

-- ----------------------------
--  Table structure for puesto
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."puesto";
CREATE TABLE "inventario"."puesto" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."puesto" OWNER TO "postgres";

-- ----------------------------
--  Table structure for inventario_proceso
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."inventario_proceso";
CREATE TABLE "inventario"."inventario_proceso" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."inventario_proceso" OWNER TO "postgres";

-- ----------------------------
--  Table structure for articulo
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."articulo";
CREATE TABLE "inventario"."articulo" (
	"id" int4 NOT NULL,
	"clave" varchar(55) NOT NULL,
	"id_subcategoria" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255),
	"proveedor" int4 NOT NULL,
	"precio_venta_unidad" money NOT NULL,
	"unidad_venta" int4 NOT NULL,
	"precio_compra_unidad" money NOT NULL,
	"unidad_compra" int4 NOT NULL,
	"fecha_alta" timestamp(6) NOT NULL,
	"status" int4 NOT NULL,
	"foto" path,
	"fecha_baja" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."articulo" OWNER TO "postgres";

-- ----------------------------
--  Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."empleado";
CREATE TABLE "inventario"."empleado" (
	"id" int4 NOT NULL,
	"id_empresa" int4 NOT NULL,
	"id_departamento" int4 NOT NULL,
	"id_puesto" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"paterno" varchar(55) NOT NULL,
	"materno" varchar(55) NOT NULL,
	"direccion" varchar(255) NOT NULL,
	"telefono_casa" int4 NOT NULL,
	"telefono_celular" int4,
	"alta" date NOT NULL,
	"nacimiento" date,
	"status" int4 NOT NULL,
	"telefono_extension " int4,
	"telefono_oficina" int4,
	"foto" path
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."empleado" OWNER TO "postgres";

-- ----------------------------
--  Table structure for inventario_clase
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."inventario_clase";
CREATE TABLE "inventario"."inventario_clase" (
	"id" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."inventario_clase" OWNER TO "postgres";

-- ----------------------------
--  Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."empresa";
CREATE TABLE "inventario"."empresa" (
	"id" int4 NOT NULL,
	"nombre" varchar(100) NOT NULL,
	"id_empresa_tipo" int4 NOT NULL,
	"razon_social" varchar(255) NOT NULL,
	"direccion" varchar(255) NOT NULL,
	"ciudad" varchar(55),
	"estado" varchar(55),
	"pais" varchar(55),
	"RFC" varchar(55),
	"id_contacto" int4,
	"telefono" int4 NOT NULL,
	"logo" path,
	"status" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."empresa" OWNER TO "postgres";

-- ----------------------------
--  Table structure for entrada
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."entrada";
CREATE TABLE "inventario"."entrada" (
	"id" int4 NOT NULL,
	"fecha" timestamp(6) NOT NULL,
	"id_empleado" int4 NOT NULL,
	"id_almacen" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."entrada" OWNER TO "postgres";

-- ----------------------------
--  Table structure for inventario
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."inventario";
CREATE TABLE "inventario"."inventario" (
	"clave" varchar(55) NOT NULL,
	"cantidad" int4 NOT NULL,
	"unidad_media" int4 NOT NULL,
	"id_almacen" int4 NOT NULL,
	"id_almacen_area" int4 NOT NULL,
	"id_inventario_proceso" int4 NOT NULL,
	"id_inventario_clase" int4 NOT NULL,
	"id_inventario_merma" int4 NOT NULL,
	"id_almacenamiento" int4 NOT NULL,
	"costo_promedio" money,
	"cantidad_minima" int4,
	"cantidad_maxima" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."inventario" OWNER TO "postgres";

-- ----------------------------
--  Table structure for categoria_subcategoria
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."categoria_subcategoria";
CREATE TABLE "inventario"."categoria_subcategoria" (
	"id" int4 NOT NULL,
	"id_categoria" int4 NOT NULL,
	"nombre" varchar(55) NOT NULL,
	"descripcion" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."categoria_subcategoria" OWNER TO "postgres";

-- ----------------------------
--  Table structure for salida_pos_venta
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."salida_pos_venta";
CREATE TABLE "inventario"."salida_pos_venta" (
	"id" int4 NOT NULL,
	"id_salida" int4 NOT NULL,
	"total" money NOT NULL,
	"pago_tipo" int4 NOT NULL,
	"pago_cantidad" money NOT NULL,
	"pago_devolucion" money NOT NULL,
	"promocion" int4 NOT NULL,
	"descuento" int4 NOT NULL,
	"iva" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."salida_pos_venta" OWNER TO "postgres";

-- ----------------------------
--  Table structure for pos
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."pos";
CREATE TABLE "inventario"."pos" (
	"id" int4 NOT NULL,
	"id_empresa" int4 NOT NULL,
	"id_empleado_encargado" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."pos" OWNER TO "postgres";

-- ----------------------------
--  Table structure for orden_compra
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."orden_compra";
CREATE TABLE "inventario"."orden_compra" (
	"id" int4 NOT NULL,
	"id_empresa" int4 NOT NULL,
	"id_empleado" int4 NOT NULL,
	"id_proveedor" int4 NOT NULL,
	"fecha_creacion" date NOT NULL,
	"fecha_requirida" date NOT NULL,
	"total" money NOT NULL,
	"descuento_general" int4,
	"status" int4 NOT NULL,
	"notas" varchar(255)
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."orden_compra" OWNER TO "postgres";

-- ----------------------------
--  Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS "inventario"."usuario";
CREATE TABLE "inventario"."usuario" (
	"id" int4 NOT NULL,
	"id_empleado" int4 NOT NULL,
	"id_usuario_nivel" int4 NOT NULL,
	"email" varchar(255) NOT NULL,
	"clave" varchar(255) NOT NULL,
	"alta" timestamp(6) NOT NULL,
	"status" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "inventario"."usuario" OWNER TO "postgres";

-- ----------------------------
--  Primary key structure for table empresa_tipo
-- ----------------------------
ALTER TABLE "inventario"."empresa_tipo" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table empresa_tipo
-- ----------------------------
CREATE UNIQUE INDEX  "empresa_tipo_id_key" ON "inventario"."empresa_tipo" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table empresa_tipo
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17369" AFTER DELETE ON "inventario"."empresa_tipo" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17369" ON "inventario"."empresa_tipo" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17370" AFTER UPDATE ON "inventario"."empresa_tipo" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17370" ON "inventario"."empresa_tipo" IS NULL;

-- ----------------------------
--  Primary key structure for table unidad
-- ----------------------------
ALTER TABLE "inventario"."unidad" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table unidad
-- ----------------------------
CREATE UNIQUE INDEX  "unidad_id_key" ON "inventario"."unidad" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table unidad
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17530" AFTER DELETE ON "inventario"."unidad" FROM "inventario"."receta_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17530" ON "inventario"."unidad" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17531" AFTER UPDATE ON "inventario"."unidad" FROM "inventario"."receta_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17531" ON "inventario"."unidad" IS NULL;

-- ----------------------------
--  Primary key structure for table usuario_nivel
-- ----------------------------
ALTER TABLE "inventario"."usuario_nivel" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table usuario_nivel
-- ----------------------------
CREATE UNIQUE INDEX  "usuario_nivel_id_key" ON "inventario"."usuario_nivel" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table usuario_nivel
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17578" AFTER DELETE ON "inventario"."usuario_nivel" FROM "inventario"."usuario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17578" ON "inventario"."usuario_nivel" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17579" AFTER UPDATE ON "inventario"."usuario_nivel" FROM "inventario"."usuario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17579" ON "inventario"."usuario_nivel" IS NULL;

-- ----------------------------
--  Primary key structure for table paquete
-- ----------------------------
ALTER TABLE "inventario"."paquete" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table paquete
-- ----------------------------
CREATE UNIQUE INDEX  "paquete_id_key" ON "inventario"."paquete" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table paquete
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17488" AFTER INSERT ON "inventario"."paquete" FROM "inventario"."categoria_subcategoria" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17488" ON "inventario"."paquete" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17489" AFTER UPDATE ON "inventario"."paquete" FROM "inventario"."categoria_subcategoria" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17489" ON "inventario"."paquete" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17584" AFTER DELETE ON "inventario"."paquete" FROM "inventario"."paquete_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17584" ON "inventario"."paquete" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17585" AFTER UPDATE ON "inventario"."paquete" FROM "inventario"."paquete_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17585" ON "inventario"."paquete" IS NULL;

-- ----------------------------
--  Primary key structure for table categoria
-- ----------------------------
ALTER TABLE "inventario"."categoria" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table categoria
-- ----------------------------
CREATE UNIQUE INDEX  "categoria_id_key" ON "inventario"."categoria" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table categoria
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17345" AFTER DELETE ON "inventario"."categoria" FROM "inventario"."categoria_subcategoria" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17345" ON "inventario"."categoria" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17346" AFTER UPDATE ON "inventario"."categoria" FROM "inventario"."categoria_subcategoria" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17346" ON "inventario"."categoria" IS NULL;

-- ----------------------------
--  Primary key structure for table entrada_ajuste
-- ----------------------------
ALTER TABLE "inventario"."entrada_ajuste" ADD PRIMARY KEY ("id_entrada");

-- ----------------------------
--  Triggers structure for table entrada_ajuste
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17591" AFTER INSERT ON "inventario"."entrada_ajuste" FROM "inventario"."entrada" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17591" ON "inventario"."entrada_ajuste" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17592" AFTER UPDATE ON "inventario"."entrada_ajuste" FROM "inventario"."entrada" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17592" ON "inventario"."entrada_ajuste" IS NULL;

-- ----------------------------
--  Primary key structure for table salida
-- ----------------------------
ALTER TABLE "inventario"."salida" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table salida
-- ----------------------------
CREATE UNIQUE INDEX  "salida_id_key" ON "inventario"."salida" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table salida
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17537" AFTER INSERT ON "inventario"."salida" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17537" ON "inventario"."salida" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17538" AFTER UPDATE ON "inventario"."salida" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17538" ON "inventario"."salida" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17542" AFTER INSERT ON "inventario"."salida" FROM "inventario"."almacen" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17542" ON "inventario"."salida" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17543" AFTER UPDATE ON "inventario"."salida" FROM "inventario"."almacen" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17543" ON "inventario"."salida" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17546" AFTER DELETE ON "inventario"."salida" FROM "inventario"."salida_ajuste" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17546" ON "inventario"."salida" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17547" AFTER UPDATE ON "inventario"."salida" FROM "inventario"."salida_ajuste" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17547" ON "inventario"."salida" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17552" AFTER DELETE ON "inventario"."salida" FROM "inventario"."salida_orden_venta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17552" ON "inventario"."salida" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17553" AFTER UPDATE ON "inventario"."salida" FROM "inventario"."salida_orden_venta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17553" ON "inventario"."salida" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17562" AFTER DELETE ON "inventario"."salida" FROM "inventario"."salida_pos_venta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17562" ON "inventario"."salida" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17563" AFTER UPDATE ON "inventario"."salida" FROM "inventario"."salida_pos_venta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17563" ON "inventario"."salida" IS NULL;

-- ----------------------------
--  Primary key structure for table contacto
-- ----------------------------
ALTER TABLE "inventario"."contacto" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table contacto
-- ----------------------------
CREATE UNIQUE INDEX  "contacto_id_key" ON "inventario"."contacto" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table contacto
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17374" AFTER DELETE ON "inventario"."contacto" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17374" ON "inventario"."contacto" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17375" AFTER UPDATE ON "inventario"."contacto" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17375" ON "inventario"."contacto" IS NULL;

-- ----------------------------
--  Primary key structure for table inventario_merma
-- ----------------------------
ALTER TABLE "inventario"."inventario_merma" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table inventario_merma
-- ----------------------------
CREATE UNIQUE INDEX  "inventario_merma_id_key" ON "inventario"."inventario_merma" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table inventario_merma
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17440" AFTER DELETE ON "inventario"."inventario_merma" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17440" ON "inventario"."inventario_merma" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17441" AFTER UPDATE ON "inventario"."inventario_merma" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17441" ON "inventario"."inventario_merma" IS NULL;

-- ----------------------------
--  Triggers structure for table paquete_detalle
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17586" AFTER INSERT ON "inventario"."paquete_detalle" FROM "inventario"."paquete" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17586" ON "inventario"."paquete_detalle" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17587" AFTER UPDATE ON "inventario"."paquete_detalle" FROM "inventario"."paquete" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17587" ON "inventario"."paquete_detalle" IS NULL;

-- ----------------------------
--  Primary key structure for table inventario_almacenaje
-- ----------------------------
ALTER TABLE "inventario"."inventario_almacenaje" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table inventario_almacenaje
-- ----------------------------
CREATE UNIQUE INDEX  "inventario_almacenaje_id_key" ON "inventario"."inventario_almacenaje" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table inventario_almacenaje
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17445" AFTER DELETE ON "inventario"."inventario_almacenaje" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17445" ON "inventario"."inventario_almacenaje" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17446" AFTER UPDATE ON "inventario"."inventario_almacenaje" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17446" ON "inventario"."inventario_almacenaje" IS NULL;

-- ----------------------------
--  Triggers structure for table entrada_orden_compra
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17407" AFTER INSERT ON "inventario"."entrada_orden_compra" FROM "inventario"."orden_embarque" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17407" ON "inventario"."entrada_orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17408" AFTER UPDATE ON "inventario"."entrada_orden_compra" FROM "inventario"."orden_embarque" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17408" ON "inventario"."entrada_orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17412" AFTER INSERT ON "inventario"."entrada_orden_compra" FROM "inventario"."entrada" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17412" ON "inventario"."entrada_orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17413" AFTER UPDATE ON "inventario"."entrada_orden_compra" FROM "inventario"."entrada" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17413" ON "inventario"."entrada_orden_compra" IS NULL;

-- ----------------------------
--  Primary key structure for table receta
-- ----------------------------
ALTER TABLE "inventario"."receta" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table receta
-- ----------------------------
CREATE UNIQUE INDEX  "receta_id_key" ON "inventario"."receta" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table receta
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17510" AFTER INSERT ON "inventario"."receta" FROM "inventario"."categoria_subcategoria" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17510" ON "inventario"."receta" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17511" AFTER UPDATE ON "inventario"."receta" FROM "inventario"."categoria_subcategoria" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17511" ON "inventario"."receta" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17520" AFTER DELETE ON "inventario"."receta" FROM "inventario"."receta_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17520" ON "inventario"."receta" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17521" AFTER UPDATE ON "inventario"."receta" FROM "inventario"."receta_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17521" ON "inventario"."receta" IS NULL;

-- ----------------------------
--  Primary key structure for table almacen_area
-- ----------------------------
ALTER TABLE "inventario"."almacen_area" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table almacen_area
-- ----------------------------
CREATE UNIQUE INDEX  "almacen_area_id_key" ON "inventario"."almacen_area" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table almacen_area
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17335" AFTER INSERT ON "inventario"."almacen_area" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17335" ON "inventario"."almacen_area" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17336" AFTER UPDATE ON "inventario"."almacen_area" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17336" ON "inventario"."almacen_area" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17423" AFTER DELETE ON "inventario"."almacen_area" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17423" ON "inventario"."almacen_area" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17424" AFTER UPDATE ON "inventario"."almacen_area" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17424" ON "inventario"."almacen_area" IS NULL;

-- ----------------------------
--  Triggers structure for table salida_ajuste
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17548" AFTER INSERT ON "inventario"."salida_ajuste" FROM "inventario"."salida" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17548" ON "inventario"."salida_ajuste" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17549" AFTER UPDATE ON "inventario"."salida_ajuste" FROM "inventario"."salida" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17549" ON "inventario"."salida_ajuste" IS NULL;

-- ----------------------------
--  Primary key structure for table almacen
-- ----------------------------
ALTER TABLE "inventario"."almacen" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table almacen
-- ----------------------------
CREATE UNIQUE INDEX  "almacen_id_key" ON "inventario"."almacen" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table almacen
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17329" AFTER INSERT ON "inventario"."almacen" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17329" ON "inventario"."almacen" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17330" AFTER UPDATE ON "inventario"."almacen" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17330" ON "inventario"."almacen" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17398" AFTER DELETE ON "inventario"."almacen" FROM "inventario"."entrada" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17398" ON "inventario"."almacen" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17399" AFTER UPDATE ON "inventario"."almacen" FROM "inventario"."entrada" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17399" ON "inventario"."almacen" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17418" AFTER DELETE ON "inventario"."almacen" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17418" ON "inventario"."almacen" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17419" AFTER UPDATE ON "inventario"."almacen" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17419" ON "inventario"."almacen" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17540" AFTER DELETE ON "inventario"."almacen" FROM "inventario"."salida" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17540" ON "inventario"."almacen" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17541" AFTER UPDATE ON "inventario"."almacen" FROM "inventario"."salida" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17541" ON "inventario"."almacen" IS NULL;

-- ----------------------------
--  Primary key structure for table orden_embarque
-- ----------------------------
ALTER TABLE "inventario"."orden_embarque" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table orden_embarque
-- ----------------------------
CREATE UNIQUE INDEX  "orden_embarque_id_key" ON "inventario"."orden_embarque" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table orden_embarque
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17405" AFTER DELETE ON "inventario"."orden_embarque" FROM "inventario"."entrada_orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17405" ON "inventario"."orden_embarque" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17406" AFTER UPDATE ON "inventario"."orden_embarque" FROM "inventario"."entrada_orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17406" ON "inventario"."orden_embarque" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17473" AFTER INSERT ON "inventario"."orden_embarque" FROM "inventario"."orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17473" ON "inventario"."orden_embarque" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17474" AFTER UPDATE ON "inventario"."orden_embarque" FROM "inventario"."orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17474" ON "inventario"."orden_embarque" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17478" AFTER INSERT ON "inventario"."orden_embarque" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17478" ON "inventario"."orden_embarque" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17479" AFTER UPDATE ON "inventario"."orden_embarque" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17479" ON "inventario"."orden_embarque" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17483" AFTER INSERT ON "inventario"."orden_embarque" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17483" ON "inventario"."orden_embarque" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17484" AFTER UPDATE ON "inventario"."orden_embarque" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17484" ON "inventario"."orden_embarque" IS NULL;

-- ----------------------------
--  Primary key structure for table tipo_pago
-- ----------------------------
ALTER TABLE "inventario"."tipo_pago" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table tipo_pago
-- ----------------------------
CREATE UNIQUE INDEX  "tipo_pago_id_key" ON "inventario"."tipo_pago" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table tipo_pago
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17385" AFTER DELETE ON "inventario"."tipo_pago" FROM "inventario"."empresa_pago" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17385" ON "inventario"."tipo_pago" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17386" AFTER UPDATE ON "inventario"."tipo_pago" FROM "inventario"."empresa_pago" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17386" ON "inventario"."tipo_pago" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17567" AFTER DELETE ON "inventario"."tipo_pago" FROM "inventario"."salida_pos_venta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17567" ON "inventario"."tipo_pago" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17568" AFTER UPDATE ON "inventario"."tipo_pago" FROM "inventario"."salida_pos_venta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17568" ON "inventario"."tipo_pago" IS NULL;

-- ----------------------------
--  Triggers structure for table receta_detalle
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17522" AFTER INSERT ON "inventario"."receta_detalle" FROM "inventario"."receta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17522" ON "inventario"."receta_detalle" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17523" AFTER UPDATE ON "inventario"."receta_detalle" FROM "inventario"."receta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17523" ON "inventario"."receta_detalle" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17527" AFTER INSERT ON "inventario"."receta_detalle" FROM "inventario"."articulo" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17527" ON "inventario"."receta_detalle" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17528" AFTER UPDATE ON "inventario"."receta_detalle" FROM "inventario"."articulo" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17528" ON "inventario"."receta_detalle" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17532" AFTER INSERT ON "inventario"."receta_detalle" FROM "inventario"."unidad" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17532" ON "inventario"."receta_detalle" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17533" AFTER UPDATE ON "inventario"."receta_detalle" FROM "inventario"."unidad" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17533" ON "inventario"."receta_detalle" IS NULL;

-- ----------------------------
--  Primary key structure for table orden_detalle
-- ----------------------------
ALTER TABLE "inventario"."orden_detalle" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table orden_detalle
-- ----------------------------
CREATE UNIQUE INDEX  "orden_detalle_id_key" ON "inventario"."orden_detalle" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table orden_detalle
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17468" AFTER INSERT ON "inventario"."orden_detalle" FROM "inventario"."orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17468" ON "inventario"."orden_detalle" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17469" AFTER UPDATE ON "inventario"."orden_detalle" FROM "inventario"."orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17469" ON "inventario"."orden_detalle" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17557" AFTER DELETE ON "inventario"."orden_detalle" FROM "inventario"."salida_orden_venta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17557" ON "inventario"."orden_detalle" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17558" AFTER UPDATE ON "inventario"."orden_detalle" FROM "inventario"."salida_orden_venta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17558" ON "inventario"."orden_detalle" IS NULL;

-- ----------------------------
--  Triggers structure for table salida_orden_venta
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17554" AFTER INSERT ON "inventario"."salida_orden_venta" FROM "inventario"."salida" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17554" ON "inventario"."salida_orden_venta" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17555" AFTER UPDATE ON "inventario"."salida_orden_venta" FROM "inventario"."salida" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17555" ON "inventario"."salida_orden_venta" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17559" AFTER INSERT ON "inventario"."salida_orden_venta" FROM "inventario"."orden_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17559" ON "inventario"."salida_orden_venta" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17560" AFTER UPDATE ON "inventario"."salida_orden_venta" FROM "inventario"."orden_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17560" ON "inventario"."salida_orden_venta" IS NULL;

-- ----------------------------
--  Primary key structure for table status
-- ----------------------------
ALTER TABLE "inventario"."status" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Primary key structure for table salida_pos_venta_detalle
-- ----------------------------
ALTER TABLE "inventario"."salida_pos_venta_detalle" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Triggers structure for table salida_pos_venta_detalle
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17504" AFTER INSERT ON "inventario"."salida_pos_venta_detalle" FROM "inventario"."salida_pos_venta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17504" ON "inventario"."salida_pos_venta_detalle" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17505" AFTER UPDATE ON "inventario"."salida_pos_venta_detalle" FROM "inventario"."salida_pos_venta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17505" ON "inventario"."salida_pos_venta_detalle" IS NULL;

-- ----------------------------
--  Primary key structure for table departamento
-- ----------------------------
ALTER TABLE "inventario"."departamento" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table departamento
-- ----------------------------
CREATE UNIQUE INDEX  "departamento_id_key" ON "inventario"."departamento" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table departamento
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17357" AFTER DELETE ON "inventario"."departamento" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17357" ON "inventario"."departamento" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17358" AFTER UPDATE ON "inventario"."departamento" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17358" ON "inventario"."departamento" IS NULL;

-- ----------------------------
--  Triggers structure for table empresa_pago
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17382" AFTER INSERT ON "inventario"."empresa_pago" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17382" ON "inventario"."empresa_pago" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17383" AFTER UPDATE ON "inventario"."empresa_pago" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17383" ON "inventario"."empresa_pago" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17387" AFTER INSERT ON "inventario"."empresa_pago" FROM "inventario"."tipo_pago" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17387" ON "inventario"."empresa_pago" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17388" AFTER UPDATE ON "inventario"."empresa_pago" FROM "inventario"."tipo_pago" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17388" ON "inventario"."empresa_pago" IS NULL;

-- ----------------------------
--  Primary key structure for table puesto
-- ----------------------------
ALTER TABLE "inventario"."puesto" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table puesto
-- ----------------------------
CREATE UNIQUE INDEX  "puesto_id_key" ON "inventario"."puesto" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table puesto
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17362" AFTER DELETE ON "inventario"."puesto" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17362" ON "inventario"."puesto" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17363" AFTER UPDATE ON "inventario"."puesto" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17363" ON "inventario"."puesto" IS NULL;

-- ----------------------------
--  Primary key structure for table inventario_proceso
-- ----------------------------
ALTER TABLE "inventario"."inventario_proceso" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table inventario_proceso
-- ----------------------------
CREATE UNIQUE INDEX  "inventario_proceso_id_key" ON "inventario"."inventario_proceso" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table inventario_proceso
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17428" AFTER DELETE ON "inventario"."inventario_proceso" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17428" ON "inventario"."inventario_proceso" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17429" AFTER UPDATE ON "inventario"."inventario_proceso" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17429" ON "inventario"."inventario_proceso" IS NULL;

-- ----------------------------
--  Primary key structure for table articulo
-- ----------------------------
ALTER TABLE "inventario"."articulo" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table articulo
-- ----------------------------
CREATE UNIQUE INDEX  "articulo_id_key" ON "inventario"."articulo" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table articulo
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17341" AFTER INSERT ON "inventario"."articulo" FROM "inventario"."categoria_subcategoria" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17341" ON "inventario"."articulo" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17342" AFTER UPDATE ON "inventario"."articulo" FROM "inventario"."categoria_subcategoria" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17342" ON "inventario"."articulo" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17525" AFTER DELETE ON "inventario"."articulo" FROM "inventario"."receta_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17525" ON "inventario"."articulo" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17526" AFTER UPDATE ON "inventario"."articulo" FROM "inventario"."receta_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17526" ON "inventario"."articulo" IS NULL;

-- ----------------------------
--  Primary key structure for table empleado
-- ----------------------------
ALTER TABLE "inventario"."empleado" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table empleado
-- ----------------------------
CREATE UNIQUE INDEX  "empleado_id_key" ON "inventario"."empleado" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table empleado
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17333" AFTER DELETE ON "inventario"."empleado" FROM "inventario"."almacen_area" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17333" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17334" AFTER UPDATE ON "inventario"."empleado" FROM "inventario"."almacen_area" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17334" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17354" AFTER INSERT ON "inventario"."empleado" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17354" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17355" AFTER UPDATE ON "inventario"."empleado" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17355" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17359" AFTER INSERT ON "inventario"."empleado" FROM "inventario"."departamento" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17359" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17360" AFTER UPDATE ON "inventario"."empleado" FROM "inventario"."departamento" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17360" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17364" AFTER INSERT ON "inventario"."empleado" FROM "inventario"."puesto" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17364" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17365" AFTER UPDATE ON "inventario"."empleado" FROM "inventario"."puesto" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17365" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17393" AFTER DELETE ON "inventario"."empleado" FROM "inventario"."entrada" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17393" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17394" AFTER UPDATE ON "inventario"."empleado" FROM "inventario"."entrada" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17394" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17455" AFTER DELETE ON "inventario"."empleado" FROM "inventario"."orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17455" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17456" AFTER UPDATE ON "inventario"."empleado" FROM "inventario"."orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17456" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17476" AFTER DELETE ON "inventario"."empleado" FROM "inventario"."orden_embarque" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17476" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17477" AFTER UPDATE ON "inventario"."empleado" FROM "inventario"."orden_embarque" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17477" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17481" AFTER DELETE ON "inventario"."empleado" FROM "inventario"."orden_embarque" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17481" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17482" AFTER UPDATE ON "inventario"."empleado" FROM "inventario"."orden_embarque" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17482" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17496" AFTER DELETE ON "inventario"."empleado" FROM "inventario"."pos" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17496" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17497" AFTER UPDATE ON "inventario"."empleado" FROM "inventario"."pos" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17497" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17535" AFTER DELETE ON "inventario"."empleado" FROM "inventario"."salida" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17535" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17536" AFTER UPDATE ON "inventario"."empleado" FROM "inventario"."salida" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17536" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17573" AFTER DELETE ON "inventario"."empleado" FROM "inventario"."usuario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17573" ON "inventario"."empleado" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17574" AFTER UPDATE ON "inventario"."empleado" FROM "inventario"."usuario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17574" ON "inventario"."empleado" IS NULL;

-- ----------------------------
--  Primary key structure for table inventario_clase
-- ----------------------------
ALTER TABLE "inventario"."inventario_clase" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table inventario_clase
-- ----------------------------
CREATE UNIQUE INDEX  "inventario_clase_id_key" ON "inventario"."inventario_clase" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table inventario_clase
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17433" AFTER DELETE ON "inventario"."inventario_clase" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17433" ON "inventario"."inventario_clase" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17434" AFTER UPDATE ON "inventario"."inventario_clase" FROM "inventario"."inventario" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17434" ON "inventario"."inventario_clase" IS NULL;

-- ----------------------------
--  Primary key structure for table empresa
-- ----------------------------
ALTER TABLE "inventario"."empresa" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Uniques structure for table empresa
-- ----------------------------
ALTER TABLE "inventario"."empresa" ADD CONSTRAINT "RFC" UNIQUE ("RFC");

-- ----------------------------
--  Indexes structure for table empresa
-- ----------------------------
CREATE UNIQUE INDEX  "empresa_id_key" ON "inventario"."empresa" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table empresa
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17327" AFTER DELETE ON "inventario"."empresa" FROM "inventario"."almacen" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17327" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17328" AFTER UPDATE ON "inventario"."empresa" FROM "inventario"."almacen" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17328" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17352" AFTER DELETE ON "inventario"."empresa" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17352" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17353" AFTER UPDATE ON "inventario"."empresa" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17353" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17371" AFTER INSERT ON "inventario"."empresa" FROM "inventario"."empresa_tipo" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17371" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17372" AFTER UPDATE ON "inventario"."empresa" FROM "inventario"."empresa_tipo" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17372" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17376" AFTER INSERT ON "inventario"."empresa" FROM "inventario"."contacto" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17376" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17377" AFTER UPDATE ON "inventario"."empresa" FROM "inventario"."contacto" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17377" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17380" AFTER DELETE ON "inventario"."empresa" FROM "inventario"."empresa_pago" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17380" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17381" AFTER UPDATE ON "inventario"."empresa" FROM "inventario"."empresa_pago" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17381" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17450" AFTER DELETE ON "inventario"."empresa" FROM "inventario"."orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17450" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17451" AFTER UPDATE ON "inventario"."empresa" FROM "inventario"."orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17451" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17460" AFTER DELETE ON "inventario"."empresa" FROM "inventario"."orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17460" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17461" AFTER UPDATE ON "inventario"."empresa" FROM "inventario"."orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17461" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17491" AFTER DELETE ON "inventario"."empresa" FROM "inventario"."pos" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17491" ON "inventario"."empresa" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17492" AFTER UPDATE ON "inventario"."empresa" FROM "inventario"."pos" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17492" ON "inventario"."empresa" IS NULL;

-- ----------------------------
--  Primary key structure for table entrada
-- ----------------------------
ALTER TABLE "inventario"."entrada" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table entrada
-- ----------------------------
CREATE UNIQUE INDEX  "entrada_id_key" ON "inventario"."entrada" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table entrada
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17395" AFTER INSERT ON "inventario"."entrada" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17395" ON "inventario"."entrada" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17396" AFTER UPDATE ON "inventario"."entrada" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17396" ON "inventario"."entrada" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17400" AFTER INSERT ON "inventario"."entrada" FROM "inventario"."almacen" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17400" ON "inventario"."entrada" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17401" AFTER UPDATE ON "inventario"."entrada" FROM "inventario"."almacen" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17401" ON "inventario"."entrada" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17410" AFTER DELETE ON "inventario"."entrada" FROM "inventario"."entrada_orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17410" ON "inventario"."entrada" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17411" AFTER UPDATE ON "inventario"."entrada" FROM "inventario"."entrada_orden_compra" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17411" ON "inventario"."entrada" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17589" AFTER DELETE ON "inventario"."entrada" FROM "inventario"."entrada_ajuste" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17589" ON "inventario"."entrada" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17590" AFTER UPDATE ON "inventario"."entrada" FROM "inventario"."entrada_ajuste" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17590" ON "inventario"."entrada" IS NULL;

-- ----------------------------
--  Primary key structure for table inventario
-- ----------------------------
ALTER TABLE "inventario"."inventario" ADD PRIMARY KEY ("clave");

-- ----------------------------
--  Triggers structure for table inventario
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17420" AFTER INSERT ON "inventario"."inventario" FROM "inventario"."almacen" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17420" ON "inventario"."inventario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17421" AFTER UPDATE ON "inventario"."inventario" FROM "inventario"."almacen" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17421" ON "inventario"."inventario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17425" AFTER INSERT ON "inventario"."inventario" FROM "inventario"."almacen_area" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17425" ON "inventario"."inventario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17426" AFTER UPDATE ON "inventario"."inventario" FROM "inventario"."almacen_area" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17426" ON "inventario"."inventario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17430" AFTER INSERT ON "inventario"."inventario" FROM "inventario"."inventario_proceso" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17430" ON "inventario"."inventario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17431" AFTER UPDATE ON "inventario"."inventario" FROM "inventario"."inventario_proceso" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17431" ON "inventario"."inventario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17435" AFTER INSERT ON "inventario"."inventario" FROM "inventario"."inventario_clase" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17435" ON "inventario"."inventario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17436" AFTER UPDATE ON "inventario"."inventario" FROM "inventario"."inventario_clase" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17436" ON "inventario"."inventario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17442" AFTER INSERT ON "inventario"."inventario" FROM "inventario"."inventario_merma" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17442" ON "inventario"."inventario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17443" AFTER UPDATE ON "inventario"."inventario" FROM "inventario"."inventario_merma" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17443" ON "inventario"."inventario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17447" AFTER INSERT ON "inventario"."inventario" FROM "inventario"."inventario_almacenaje" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17447" ON "inventario"."inventario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17448" AFTER UPDATE ON "inventario"."inventario" FROM "inventario"."inventario_almacenaje" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17448" ON "inventario"."inventario" IS NULL;

-- ----------------------------
--  Primary key structure for table categoria_subcategoria
-- ----------------------------
ALTER TABLE "inventario"."categoria_subcategoria" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table categoria_subcategoria
-- ----------------------------
CREATE UNIQUE INDEX  "categoria_subcategoria_id_key" ON "inventario"."categoria_subcategoria" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table categoria_subcategoria
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17339" AFTER DELETE ON "inventario"."categoria_subcategoria" FROM "inventario"."articulo" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17339" ON "inventario"."categoria_subcategoria" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17340" AFTER UPDATE ON "inventario"."categoria_subcategoria" FROM "inventario"."articulo" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17340" ON "inventario"."categoria_subcategoria" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17347" AFTER INSERT ON "inventario"."categoria_subcategoria" FROM "inventario"."categoria" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17347" ON "inventario"."categoria_subcategoria" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17348" AFTER UPDATE ON "inventario"."categoria_subcategoria" FROM "inventario"."categoria" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17348" ON "inventario"."categoria_subcategoria" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17486" AFTER DELETE ON "inventario"."categoria_subcategoria" FROM "inventario"."paquete" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17486" ON "inventario"."categoria_subcategoria" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17487" AFTER UPDATE ON "inventario"."categoria_subcategoria" FROM "inventario"."paquete" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17487" ON "inventario"."categoria_subcategoria" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17508" AFTER DELETE ON "inventario"."categoria_subcategoria" FROM "inventario"."receta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17508" ON "inventario"."categoria_subcategoria" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17509" AFTER UPDATE ON "inventario"."categoria_subcategoria" FROM "inventario"."receta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17509" ON "inventario"."categoria_subcategoria" IS NULL;

-- ----------------------------
--  Primary key structure for table salida_pos_venta
-- ----------------------------
ALTER TABLE "inventario"."salida_pos_venta" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table salida_pos_venta
-- ----------------------------
CREATE UNIQUE INDEX  "salida_pos_venta_id_key" ON "inventario"."salida_pos_venta" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table salida_pos_venta
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17502" AFTER DELETE ON "inventario"."salida_pos_venta" FROM "inventario"."salida_pos_venta_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17502" ON "inventario"."salida_pos_venta" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17503" AFTER UPDATE ON "inventario"."salida_pos_venta" FROM "inventario"."salida_pos_venta_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17503" ON "inventario"."salida_pos_venta" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17564" AFTER INSERT ON "inventario"."salida_pos_venta" FROM "inventario"."salida" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17564" ON "inventario"."salida_pos_venta" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17565" AFTER UPDATE ON "inventario"."salida_pos_venta" FROM "inventario"."salida" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17565" ON "inventario"."salida_pos_venta" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17569" AFTER INSERT ON "inventario"."salida_pos_venta" FROM "inventario"."tipo_pago" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17569" ON "inventario"."salida_pos_venta" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17570" AFTER UPDATE ON "inventario"."salida_pos_venta" FROM "inventario"."tipo_pago" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17570" ON "inventario"."salida_pos_venta" IS NULL;

-- ----------------------------
--  Primary key structure for table pos
-- ----------------------------
ALTER TABLE "inventario"."pos" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Triggers structure for table pos
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17493" AFTER INSERT ON "inventario"."pos" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17493" ON "inventario"."pos" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17494" AFTER UPDATE ON "inventario"."pos" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17494" ON "inventario"."pos" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17498" AFTER INSERT ON "inventario"."pos" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17498" ON "inventario"."pos" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17499" AFTER UPDATE ON "inventario"."pos" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17499" ON "inventario"."pos" IS NULL;

-- ----------------------------
--  Primary key structure for table orden_compra
-- ----------------------------
ALTER TABLE "inventario"."orden_compra" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Indexes structure for table orden_compra
-- ----------------------------
CREATE UNIQUE INDEX  "orden_compra_id_key" ON "inventario"."orden_compra" USING btree("id" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table orden_compra
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17452" AFTER INSERT ON "inventario"."orden_compra" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17452" ON "inventario"."orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17453" AFTER UPDATE ON "inventario"."orden_compra" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17453" ON "inventario"."orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17457" AFTER INSERT ON "inventario"."orden_compra" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17457" ON "inventario"."orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17458" AFTER UPDATE ON "inventario"."orden_compra" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17458" ON "inventario"."orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17462" AFTER INSERT ON "inventario"."orden_compra" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17462" ON "inventario"."orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17463" AFTER UPDATE ON "inventario"."orden_compra" FROM "inventario"."empresa" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17463" ON "inventario"."orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17466" AFTER DELETE ON "inventario"."orden_compra" FROM "inventario"."orden_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17466" ON "inventario"."orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17467" AFTER UPDATE ON "inventario"."orden_compra" FROM "inventario"."orden_detalle" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17467" ON "inventario"."orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17471" AFTER DELETE ON "inventario"."orden_compra" FROM "inventario"."orden_embarque" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17471" ON "inventario"."orden_compra" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17472" AFTER UPDATE ON "inventario"."orden_compra" FROM "inventario"."orden_embarque" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17472" ON "inventario"."orden_compra" IS NULL;

-- ----------------------------
--  Primary key structure for table usuario
-- ----------------------------
ALTER TABLE "inventario"."usuario" ADD PRIMARY KEY ("id");

-- ----------------------------
--  Triggers structure for table usuario
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17575" AFTER INSERT ON "inventario"."usuario" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17575" ON "inventario"."usuario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17576" AFTER UPDATE ON "inventario"."usuario" FROM "inventario"."empleado" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17576" ON "inventario"."usuario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17580" AFTER INSERT ON "inventario"."usuario" FROM "inventario"."usuario_nivel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17580" ON "inventario"."usuario" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_17581" AFTER UPDATE ON "inventario"."usuario" FROM "inventario"."usuario_nivel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_17581" ON "inventario"."usuario" IS NULL;

-- ----------------------------
--  Foreign keys structure for table paquete
-- ----------------------------
ALTER TABLE "inventario"."paquete" ADD CONSTRAINT "subcategoria" FOREIGN KEY ("id_subcategoria") REFERENCES "inventario"."categoria_subcategoria" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table entrada_ajuste
-- ----------------------------
ALTER TABLE "inventario"."entrada_ajuste" ADD CONSTRAINT "entrada" FOREIGN KEY ("id_entrada") REFERENCES "inventario"."entrada" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table salida
-- ----------------------------
ALTER TABLE "inventario"."salida" ADD CONSTRAINT "empleado" FOREIGN KEY ("id_empleado") REFERENCES "inventario"."empleado" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."salida" ADD CONSTRAINT "almacen" FOREIGN KEY ("id_almacen") REFERENCES "inventario"."almacen" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table paquete_detalle
-- ----------------------------
ALTER TABLE "inventario"."paquete_detalle" ADD CONSTRAINT "paquete" FOREIGN KEY ("id_paquete") REFERENCES "inventario"."paquete" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table entrada_orden_compra
-- ----------------------------
ALTER TABLE "inventario"."entrada_orden_compra" ADD CONSTRAINT "orden" FOREIGN KEY ("id_orden_embarque") REFERENCES "inventario"."orden_embarque" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."entrada_orden_compra" ADD CONSTRAINT "entrada" FOREIGN KEY ("id_entrada") REFERENCES "inventario"."entrada" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table receta
-- ----------------------------
ALTER TABLE "inventario"."receta" ADD CONSTRAINT "subcategoria" FOREIGN KEY ("id_subcategoria") REFERENCES "inventario"."categoria_subcategoria" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table almacen_area
-- ----------------------------
ALTER TABLE "inventario"."almacen_area" ADD CONSTRAINT "empleado" FOREIGN KEY ("id_empleado_encargado") REFERENCES "inventario"."empleado" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table salida_ajuste
-- ----------------------------
ALTER TABLE "inventario"."salida_ajuste" ADD CONSTRAINT "salida" FOREIGN KEY ("id_salida") REFERENCES "inventario"."salida" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table almacen
-- ----------------------------
ALTER TABLE "inventario"."almacen" ADD CONSTRAINT "empresa" FOREIGN KEY ("id_empresa") REFERENCES "inventario"."empresa" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table orden_embarque
-- ----------------------------
ALTER TABLE "inventario"."orden_embarque" ADD CONSTRAINT "compra" FOREIGN KEY ("id_orden_compra") REFERENCES "inventario"."orden_compra" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."orden_embarque" ADD CONSTRAINT "entrega" FOREIGN KEY ("id_empleado_entrego") REFERENCES "inventario"."empleado" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."orden_embarque" ADD CONSTRAINT "recibo" FOREIGN KEY ("id_empleado_recivo") REFERENCES "inventario"."empleado" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table receta_detalle
-- ----------------------------
ALTER TABLE "inventario"."receta_detalle" ADD CONSTRAINT "receta" FOREIGN KEY ("id_receta") REFERENCES "inventario"."receta" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."receta_detalle" ADD CONSTRAINT "articulo" FOREIGN KEY ("id_articulo") REFERENCES "inventario"."articulo" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."receta_detalle" ADD CONSTRAINT "unidad" FOREIGN KEY ("id_articulo_unidad") REFERENCES "inventario"."unidad" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table orden_detalle
-- ----------------------------
ALTER TABLE "inventario"."orden_detalle" ADD CONSTRAINT "orden" FOREIGN KEY ("id_orden") REFERENCES "inventario"."orden_compra" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table salida_orden_venta
-- ----------------------------
ALTER TABLE "inventario"."salida_orden_venta" ADD CONSTRAINT "salida" FOREIGN KEY ("id_salida") REFERENCES "inventario"."salida" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."salida_orden_venta" ADD CONSTRAINT "orden" FOREIGN KEY ("id_orden_detalle") REFERENCES "inventario"."orden_detalle" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table salida_pos_venta_detalle
-- ----------------------------
ALTER TABLE "inventario"."salida_pos_venta_detalle" ADD CONSTRAINT "salida" FOREIGN KEY ("id_salida_pos_venta") REFERENCES "inventario"."salida_pos_venta" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table empresa_pago
-- ----------------------------
ALTER TABLE "inventario"."empresa_pago" ADD CONSTRAINT "empresa" FOREIGN KEY ("id_empresa") REFERENCES "inventario"."empresa" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."empresa_pago" ADD CONSTRAINT "pago" FOREIGN KEY ("id_tipo_pago") REFERENCES "inventario"."tipo_pago" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table articulo
-- ----------------------------
ALTER TABLE "inventario"."articulo" ADD CONSTRAINT "subcategoria" FOREIGN KEY ("id_subcategoria") REFERENCES "inventario"."categoria_subcategoria" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table empleado
-- ----------------------------
ALTER TABLE "inventario"."empleado" ADD CONSTRAINT "empresa" FOREIGN KEY ("id_empresa") REFERENCES "inventario"."empresa" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."empleado" ADD CONSTRAINT "departamento" FOREIGN KEY ("id_departamento") REFERENCES "inventario"."departamento" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."empleado" ADD CONSTRAINT "puesto" FOREIGN KEY ("id_puesto") REFERENCES "inventario"."puesto" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table empresa
-- ----------------------------
ALTER TABLE "inventario"."empresa" ADD CONSTRAINT "tipo" FOREIGN KEY ("id_empresa_tipo") REFERENCES "inventario"."empresa_tipo" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."empresa" ADD CONSTRAINT "contacto" FOREIGN KEY ("id_contacto") REFERENCES "inventario"."contacto" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table entrada
-- ----------------------------
ALTER TABLE "inventario"."entrada" ADD CONSTRAINT "empleado" FOREIGN KEY ("id_empleado") REFERENCES "inventario"."empleado" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."entrada" ADD CONSTRAINT "almacen" FOREIGN KEY ("id_almacen") REFERENCES "inventario"."almacen" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table inventario
-- ----------------------------
ALTER TABLE "inventario"."inventario" ADD CONSTRAINT "almacen" FOREIGN KEY ("id_almacen") REFERENCES "inventario"."almacen" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."inventario" ADD CONSTRAINT "area" FOREIGN KEY ("id_almacen_area") REFERENCES "inventario"."almacen_area" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."inventario" ADD CONSTRAINT "proceso" FOREIGN KEY ("id_inventario_proceso") REFERENCES "inventario"."inventario_proceso" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."inventario" ADD CONSTRAINT "clase" FOREIGN KEY ("id_inventario_clase") REFERENCES "inventario"."inventario_clase" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."inventario" ADD CONSTRAINT "merma" FOREIGN KEY ("id_inventario_merma") REFERENCES "inventario"."inventario_merma" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."inventario" ADD CONSTRAINT "almacenaje" FOREIGN KEY ("id_almacenamiento") REFERENCES "inventario"."inventario_almacenaje" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table categoria_subcategoria
-- ----------------------------
ALTER TABLE "inventario"."categoria_subcategoria" ADD CONSTRAINT "categoria" FOREIGN KEY ("id_categoria") REFERENCES "inventario"."categoria" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table salida_pos_venta
-- ----------------------------
ALTER TABLE "inventario"."salida_pos_venta" ADD CONSTRAINT "salida" FOREIGN KEY ("id_salida") REFERENCES "inventario"."salida" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."salida_pos_venta" ADD CONSTRAINT "pago" FOREIGN KEY ("pago_tipo") REFERENCES "inventario"."tipo_pago" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table pos
-- ----------------------------
ALTER TABLE "inventario"."pos" ADD CONSTRAINT "empresa" FOREIGN KEY ("id_empresa") REFERENCES "inventario"."empresa" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."pos" ADD CONSTRAINT "encargado" FOREIGN KEY ("id_empleado_encargado") REFERENCES "inventario"."empleado" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table orden_compra
-- ----------------------------
ALTER TABLE "inventario"."orden_compra" ADD CONSTRAINT "empresa" FOREIGN KEY ("id_empresa") REFERENCES "inventario"."empresa" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."orden_compra" ADD CONSTRAINT "empleado" FOREIGN KEY ("id_empleado") REFERENCES "inventario"."empleado" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."orden_compra" ADD CONSTRAINT "proveedor" FOREIGN KEY ("id_proveedor") REFERENCES "inventario"."empresa" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table usuario
-- ----------------------------
ALTER TABLE "inventario"."usuario" ADD CONSTRAINT "empleado" FOREIGN KEY ("id_empleado") REFERENCES "inventario"."empleado" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "inventario"."usuario" ADD CONSTRAINT "nivel" FOREIGN KEY ("id_usuario_nivel") REFERENCES "inventario"."usuario_nivel" ("id") ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

