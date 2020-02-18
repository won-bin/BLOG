--------------------------------------------------------
--  파일이 생성됨 - 화요일-2월-18-2020   
--------------------------------------------------------
DROP SEQUENCE "BM_SEQ";
DROP SEQUENCE "B_SEQ";
DROP SEQUENCE "CMT_SEQ";
DROP SEQUENCE "CTG_SEQ";
DROP TABLE "BLOG_B" cascade constraints;
DROP TABLE "BLOG_CATEGORY" cascade constraints;
DROP TABLE "BLOG_CMT" cascade constraints;
DROP TABLE "BLOG_LIST_CATEGORY" cascade constraints;
DROP TABLE "BLOG_M" cascade constraints;
--------------------------------------------------------
--  DDL for Sequence BM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 34 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence B_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "B_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 150 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence CMT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CMT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 36 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Sequence CTG_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CTG_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 28 NOCACHE  NOORDER  NOCYCLE   ;
--------------------------------------------------------
--  DDL for Table BLOG_B
--------------------------------------------------------

  CREATE TABLE "BLOG_B" 
   (	"B_NO" NUMBER, 
	"BM_NO" NUMBER, 
	"B_TITLE" VARCHAR2(100), 
	"B_CON" VARCHAR2(4000), 
	"B_DT" DATE DEFAULT sysdate, 
	"B_HIT" NUMBER DEFAULT 0, 
	"DEL_YN" NUMBER DEFAULT 0, 
	"CTG_NO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table BLOG_CATEGORY
--------------------------------------------------------

  CREATE TABLE "BLOG_CATEGORY" 
   (	"CTG_NO" NUMBER, 
	"CTG_NAME" VARCHAR2(200), 
	"BM_NO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table BLOG_CMT
--------------------------------------------------------

  CREATE TABLE "BLOG_CMT" 
   (	"CMT_NO" NUMBER, 
	"B_NO" NUMBER, 
	"BM_NO" NUMBER, 
	"CMT_CON" VARCHAR2(1000), 
	"CMT_DT" DATE DEFAULT sysdate
   ) ;
--------------------------------------------------------
--  DDL for Table BLOG_LIST_CATEGORY
--------------------------------------------------------

  CREATE TABLE "BLOG_LIST_CATEGORY" 
   (	"L_CTG_NO" NUMBER, 
	"L_CTG_NAME" VARCHAR2(200)
   ) ;
--------------------------------------------------------
--  DDL for Table BLOG_M
--------------------------------------------------------

  CREATE TABLE "BLOG_M" 
   (	"BM_NO" NUMBER, 
	"ID" VARCHAR2(100), 
	"PW" VARCHAR2(200), 
	"NAME" VARCHAR2(50), 
	"BM_DT" DATE DEFAULT sysdate, 
	"DEL_YN" NUMBER DEFAULT 0, 
	"BLOG_NAME" VARCHAR2(20), 
	"L_CTG_NO" NUMBER
   ) ;
REM INSERTING into BLOG_B
SET DEFINE OFF;
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (90,27,'글 쓰기','테스트',to_date('20/01/08','RR/MM/DD'),0,0,null);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (141,27,'ㅇㅇ','ㅇㅇ',to_date('20/01/13','RR/MM/DD'),0,0,null);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (145,29,'테스트2-2','테스트2-2',to_date('20/01/13','RR/MM/DD'),0,0,null);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (143,28,'test1','test1',to_date('20/01/13','RR/MM/DD'),0,0,null);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (82,27,'CCCCCCc','CCCC',to_date('20/01/02','RR/MM/DD'),0,0,null);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (83,27,'테스트테스트테스트테스트테스트테스트테스트테스트','내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용',to_date('20/01/02','RR/MM/DD'),0,0,null);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (89,27,'test','test<br />test<br />test',to_date('20/01/02','RR/MM/DD'),0,0,null);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (87,27,'안녕하세요.','안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.안녕하세요.',to_date('20/01/02','RR/MM/DD'),0,0,null);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (144,29,'테스트2','테스트2',to_date('20/01/13','RR/MM/DD'),0,0,null);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (147,27,'으아아아아앙','<span style="color:#f1c40f">아아아아아아앙</span>',to_date('20/01/15','RR/MM/DD'),0,0,3);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (146,27,'BBB','BBB',to_date('20/01/14','RR/MM/DD'),0,0,3);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (148,29,'테스트2 테스트2 테스트2 테스트2','테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2테스트2 테스트2 테스트2 테스트2',to_date('20/01/16','RR/MM/DD'),0,0,7);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (149,32,'eeeeeee','dddddd',to_date('20/01/20','RR/MM/DD'),0,0,25);
Insert into BLOG_B (B_NO,BM_NO,B_TITLE,B_CON,B_DT,B_HIT,DEL_YN,CTG_NO) values (142,27,'글 제목글 제목글 제목','글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용글내용',to_date('20/01/13','RR/MM/DD'),0,0,5);
REM INSERTING into BLOG_CATEGORY
SET DEFINE OFF;
Insert into BLOG_CATEGORY (CTG_NO,CTG_NAME,BM_NO) values (7,'테스트 카테고리',29);
Insert into BLOG_CATEGORY (CTG_NO,CTG_NAME,BM_NO) values (4,'CCC',27);
Insert into BLOG_CATEGORY (CTG_NO,CTG_NAME,BM_NO) values (5,'AAA',27);
Insert into BLOG_CATEGORY (CTG_NO,CTG_NAME,BM_NO) values (6,'DDD',27);
Insert into BLOG_CATEGORY (CTG_NO,CTG_NAME,BM_NO) values (26,'aaaa',32);
Insert into BLOG_CATEGORY (CTG_NO,CTG_NAME,BM_NO) values (27,'게임',33);
Insert into BLOG_CATEGORY (CTG_NO,CTG_NAME,BM_NO) values (25,'aaa',32);
Insert into BLOG_CATEGORY (CTG_NO,CTG_NAME,BM_NO) values (3,'BBB',27);
REM INSERTING into BLOG_CMT
SET DEFINE OFF;
REM INSERTING into BLOG_LIST_CATEGORY
SET DEFINE OFF;
Insert into BLOG_LIST_CATEGORY (L_CTG_NO,L_CTG_NAME) values (1,'게임');
Insert into BLOG_LIST_CATEGORY (L_CTG_NO,L_CTG_NAME) values (2,'여행');
Insert into BLOG_LIST_CATEGORY (L_CTG_NO,L_CTG_NAME) values (3,'맛집');
Insert into BLOG_LIST_CATEGORY (L_CTG_NO,L_CTG_NAME) values (4,'IT');
Insert into BLOG_LIST_CATEGORY (L_CTG_NO,L_CTG_NAME) values (5,'자동차');
Insert into BLOG_LIST_CATEGORY (L_CTG_NO,L_CTG_NAME) values (7,'패션');
Insert into BLOG_LIST_CATEGORY (L_CTG_NO,L_CTG_NAME) values (8,'동물');
REM INSERTING into BLOG_M
SET DEFINE OFF;
Insert into BLOG_M (BM_NO,ID,PW,NAME,BM_DT,DEL_YN,BLOG_NAME,L_CTG_NO) values (30,'aaaa','m/RvEY2EIPPWJOafzDHF3Q==','aaaa',to_date('20/01/20','RR/MM/DD'),0,'aaaa',null);
Insert into BLOG_M (BM_NO,ID,PW,NAME,BM_DT,DEL_YN,BLOG_NAME,L_CTG_NO) values (28,'test1','VJBCkbvPl8XBycA0vLcX4A==','ㅇ아ㅏ아아아',to_date('20/01/03','RR/MM/DD'),0,'으르르르를',1);
Insert into BLOG_M (BM_NO,ID,PW,NAME,BM_DT,DEL_YN,BLOG_NAME,L_CTG_NO) values (31,'aaaa','m/RvEY2EIPPWJOafzDHF3Q==','aaaa',to_date('20/01/20','RR/MM/DD'),0,'aaaa',null);
Insert into BLOG_M (BM_NO,ID,PW,NAME,BM_DT,DEL_YN,BLOG_NAME,L_CTG_NO) values (32,'asdf','m/RvEY2EIPPWJOafzDHF3Q==','cccc',to_date('20/01/20','RR/MM/DD'),1,'cccc',null);
Insert into BLOG_M (BM_NO,ID,PW,NAME,BM_DT,DEL_YN,BLOG_NAME,L_CTG_NO) values (33,'cccc','m/RvEY2EIPPWJOafzDHF3Q==','cccc',to_date('20/01/20','RR/MM/DD'),0,'cccc',null);
Insert into BLOG_M (BM_NO,ID,PW,NAME,BM_DT,DEL_YN,BLOG_NAME,L_CTG_NO) values (29,'test2','LsyC1p8kkd3PHN2lWg0xYw==','테스트2',to_date('20/01/13','RR/MM/DD'),0,'테스트2',2);
Insert into BLOG_M (BM_NO,ID,PW,NAME,BM_DT,DEL_YN,BLOG_NAME,L_CTG_NO) values (27,'test','ScodMx7+jRWMxJOLoEXWZQ==','서원빈',to_date('19/12/30','RR/MM/DD'),0,'브르르르1412',1);
--------------------------------------------------------
--  DDL for Index BLOG_M_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_M_PK" ON "BLOG_M" ("BM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index BLOG_LIST_CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_LIST_CATEGORY_PK" ON "BLOG_LIST_CATEGORY" ("L_CTG_NO") 
  ;
--------------------------------------------------------
--  DDL for Index BLOG_CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_CATEGORY_PK" ON "BLOG_CATEGORY" ("CTG_NO") 
  ;
--------------------------------------------------------
--  DDL for Index BLOG_B_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_B_PK" ON "BLOG_B" ("B_NO") 
  ;
--------------------------------------------------------
--  DDL for Index BLOG_CMT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BLOG_CMT_PK" ON "BLOG_CMT" ("CMT_NO") 
  ;
--------------------------------------------------------
--  Constraints for Table BLOG_B
--------------------------------------------------------

  ALTER TABLE "BLOG_B" MODIFY ("B_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" ADD CONSTRAINT "BLOG_B_PK" PRIMARY KEY ("B_NO")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_B" MODIFY ("BM_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" MODIFY ("B_TITLE" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" MODIFY ("B_CON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" MODIFY ("B_DT" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" MODIFY ("B_HIT" NOT NULL ENABLE);
  ALTER TABLE "BLOG_B" MODIFY ("DEL_YN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG_CATEGORY
--------------------------------------------------------

  ALTER TABLE "BLOG_CATEGORY" MODIFY ("CTG_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORY" MODIFY ("CTG_NAME" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CATEGORY" ADD CONSTRAINT "BLOG_CATEGORY_PK" PRIMARY KEY ("CTG_NO")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_CATEGORY" MODIFY ("BM_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG_M
--------------------------------------------------------

  ALTER TABLE "BLOG_M" MODIFY ("BM_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_M" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "BLOG_M" MODIFY ("PW" NOT NULL ENABLE);
  ALTER TABLE "BLOG_M" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "BLOG_M" MODIFY ("BM_DT" NOT NULL ENABLE);
  ALTER TABLE "BLOG_M" MODIFY ("DEL_YN" NOT NULL ENABLE);
  ALTER TABLE "BLOG_M" ADD CONSTRAINT "BLOG_M_PK" PRIMARY KEY ("BM_NO")
  USING INDEX  ENABLE;
  ALTER TABLE "BLOG_M" MODIFY ("BLOG_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLOG_LIST_CATEGORY
--------------------------------------------------------

  ALTER TABLE "BLOG_LIST_CATEGORY" MODIFY ("L_CTG_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LIST_CATEGORY" MODIFY ("L_CTG_NAME" NOT NULL ENABLE);
  ALTER TABLE "BLOG_LIST_CATEGORY" ADD CONSTRAINT "BLOG_LIST_CATEGORY_PK" PRIMARY KEY ("L_CTG_NO")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BLOG_CMT
--------------------------------------------------------

  ALTER TABLE "BLOG_CMT" MODIFY ("CMT_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CMT" MODIFY ("B_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CMT" MODIFY ("BM_NO" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CMT" MODIFY ("CMT_CON" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CMT" MODIFY ("CMT_DT" NOT NULL ENABLE);
  ALTER TABLE "BLOG_CMT" ADD CONSTRAINT "BLOG_CMT_PK" PRIMARY KEY ("CMT_NO")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_B
--------------------------------------------------------

  ALTER TABLE "BLOG_B" ADD CONSTRAINT "BLOG_B_BM_NO" FOREIGN KEY ("BM_NO")
	  REFERENCES "BLOG_M" ("BM_NO") ENABLE;
  ALTER TABLE "BLOG_B" ADD CONSTRAINT "BLOG_B_CTG_NO" FOREIGN KEY ("CTG_NO")
	  REFERENCES "BLOG_CATEGORY" ("CTG_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_CATEGORY
--------------------------------------------------------

  ALTER TABLE "BLOG_CATEGORY" ADD CONSTRAINT "BLOG_CATEGORY_FK1" FOREIGN KEY ("BM_NO")
	  REFERENCES "BLOG_M" ("BM_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_CMT
--------------------------------------------------------

  ALTER TABLE "BLOG_CMT" ADD CONSTRAINT "BM_NO_FK" FOREIGN KEY ("BM_NO")
	  REFERENCES "BLOG_M" ("BM_NO") ENABLE;
  ALTER TABLE "BLOG_CMT" ADD CONSTRAINT "B_NO_FK" FOREIGN KEY ("B_NO")
	  REFERENCES "BLOG_B" ("B_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BLOG_M
--------------------------------------------------------

  ALTER TABLE "BLOG_M" ADD CONSTRAINT "BLOG_M_FK1" FOREIGN KEY ("L_CTG_NO")
	  REFERENCES "BLOG_LIST_CATEGORY" ("L_CTG_NO") ON DELETE CASCADE ENABLE;
