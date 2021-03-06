--<ScriptOptions statementTerminator=";"/>

ALTER TABLE "santosh"."REGISTERED_MEMBERS" DROP CONSTRAINT "REGISTERED_MEMBERS_PK";

DROP TABLE "santosh"."REGISTERED_MEMBERS";

CREATE TABLE "santosh"."REGISTERED_MEMBERS" (
		"RID" VARCHAR(20) NOT NULL,
		"NAME" VARCHAR(20) NOT NULL,
		"DEPARTMENT" VARCHAR(20),
		"PASSWORD" VARCHAR(50) NOT NULL,
		"TYPE" VARCHAR(10) NOT NULL,
		"PICTURE_PATH" VARCHAR(50),
		"YEAR" INTEGER,
		"EMAIL" VARCHAR(50) NOT NULL,
		"ACTIVATED" VARCHAR(5) DEFAULT NULL,
		"REG_DATE" DATE DEFAULT CURRENT DATE
	)
	DATA CAPTURE NONE 
	IN "USERSPACE1";

ALTER TABLE "santosh"."REGISTERED_MEMBERS" ADD CONSTRAINT "REGISTERED_MEMBERS_PK" PRIMARY KEY
	("RID");

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='',
		VALCOUNT=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'PICTURE_PATH' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'PICTURE_PATH' AND TABSCHEMA='santosh'
	AND TYPE='F'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'PICTURE_PATH' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='1',
		VALCOUNT=1,
		DISTCOUNT=1
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'RID' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='123',
		VALCOUNT=1
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'PASSWORD' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='14',
		VALCOUNT=2,
		DISTCOUNT=2
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'RID' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='2012-03-18',
		VALCOUNT=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'REG_DATE' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='2012-03-18',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'REG_DATE' AND TABSCHEMA='santosh'
	AND TYPE='F'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='2012-03-18',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'REG_DATE' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='2012-03-19',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'REG_DATE' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=3;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='2012-03-19',
		VALCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'REG_DATE' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=4;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='21',
		VALCOUNT=3,
		DISTCOUNT=3
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'RID' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=3;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='3',
		VALCOUNT=4,
		DISTCOUNT=4
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'RID' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=4;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='4',
		VALCOUNT=5,
		DISTCOUNT=5
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'RID' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=5;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='5',
		VALCOUNT=6,
		DISTCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'RID' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=6;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='6',
		VALCOUNT=7,
		DISTCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'RID' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=7;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='ANWESHA ROYY',
		VALCOUNT=1
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='ARPAN DEYY',
		VALCOUNT=2
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='CSE',
		VALCOUNT=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'DEPARTMENT' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='CSE',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'DEPARTMENT' AND TABSCHEMA='santosh'
	AND TYPE='F'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='CSE',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'DEPARTMENT' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='LWFN6lc+RprTgUcSz16odKcDzyg=',
		VALCOUNT=1
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'PASSWORD' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='LWFN6lc+RprTgUcSz16odKcDzyg=',
		VALCOUNT=5
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'PASSWORD' AND TABSCHEMA='santosh'
	AND TYPE='F'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='LWFN6lc+RprTgUcSz16odKcDzyg=',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'PASSWORD' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=3;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='SAGNIK BANERJEE',
		VALCOUNT=3
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=3;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='SANTOSH GHOSH',
		VALCOUNT=4
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=4;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='SATINATH GHOSH',
		VALCOUNT=5
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=5;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='YES',
		VALCOUNT=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'ACTIVATED' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='YES',
		VALCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'ACTIVATED' AND TABSCHEMA='santosh'
	AND TYPE='F'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='YES',
		VALCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'ACTIVATED' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='arpanB',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=6;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='arpanB',
		VALCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=7;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='arpandey26@gmail.com',
		VALCOUNT=1
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='cse',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'DEPARTMENT' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=3;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='cse',
		VALCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'DEPARTMENT' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=4;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='ghosh.santosh91@gmail.com',
		VALCOUNT=2
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='iem',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'PASSWORD' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=4;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='iem',
		VALCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'PASSWORD' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=5;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='me_anwesha@yahoo.com',
		VALCOUNT=3
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=3;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='s@gmail.com',
		VALCOUNT=4
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=4;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='sati@gmail.com',
		VALCOUNT=5
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=5;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='student',
		VALCOUNT=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'TYPE' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='student',
		VALCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'TYPE' AND TABSCHEMA='santosh'
	AND TYPE='F'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='student',
		VALCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'TYPE' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='zinnia.rulezz@gmail.com',
		VALCOUNT=6
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=6;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='zinnia.rulezz@gmail.com',
		VALCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=7;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE=4,
		VALCOUNT=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'YEAR' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE=4,
		VALCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'YEAR' AND TABSCHEMA='santosh'
	AND TYPE='F'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE=4,
		VALCOUNT=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'YEAR' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=1,
		AVGCOLLEN=11,
		NUMNULLS=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'TYPE' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=1,
		AVGCOLLEN=5,
		NUMNULLS=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'YEAR' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=1,
		AVGCOLLEN=8,
		NUMNULLS=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'ACTIVATED' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=2,
		AVGCOLLEN=5,
		NUMNULLS=1
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'PICTURE_PATH' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=2,
		HIGH2KEY='2012-03-19',
		LOW2KEY='2012-03-18',
		AVGCOLLEN=5,
		NUMNULLS=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'REG_DATE' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=2,
		HIGH2KEY='cse',
		LOW2KEY='CSE',
		AVGCOLLEN=8,
		NUMNULLS=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'DEPARTMENT' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=3,
		HIGH2KEY='iem',
		LOW2KEY='123',
		AVGCOLLEN=25,
		NUMNULLS=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'PASSWORD' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=7,
		HIGH2KEY='5',
		LOW2KEY='14',
		AVGCOLLEN=5,
		NUMNULLS=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'RID' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=7,
		HIGH2KEY='ZINNIA MUKHERJEE',
		LOW2KEY='ARPAN DEYY',
		AVGCOLLEN=16,
		NUMNULLS=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=7,
		HIGH2KEY='sssssssss',
		LOW2KEY='ghosh.santosh91@gmail.com',
		AVGCOLLEN=21,
		NUMNULLS=0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.INDEXES 
	SET NLEAF=1,
		NLEVELS=1,
		FIRSTKEYCARD=7,
		FIRST2KEYCARD=-1,
		FULLKEYCARD=7,
		CLUSTERRATIO=100,
		SEQUENTIAL_PAGES=0,
		DENSITY=0,
		NUMRIDS=7,
		NUMRIDS_DELETED=0,
		NUM_EMPTY_LEAFS=0,
		AVERAGE_RANDOM_PAGES=1.0,
		AVERAGE_SEQUENCE_GAP=0.0,
		AVERAGE_SEQUENCE_PAGES=0.0,
		DATAPARTITION_CLUSTERFACTOR=1.0,
		INDCARD=7
	WHERE TABNAME ='REGISTERED_MEMBERS' AND INDNAME = 'REGISTERED_MEMBERS_PK' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.TABLES 
	SET CARD=7,
		NPAGES=1,
		FPAGES=1,
		OVERFLOW=0,
		ACTIVE_BLOCKS=0,
		AVGCOMPRESSEDROWSIZE=0,
		AVGROWCOMPRESSIONRATIO=0.0,
		PCTROWSCOMPRESSED=0.0,
		PCTPAGESSAVED=0.0
	WHERE TABNAME ='REGISTERED_MEMBERS' AND TABSCHEMA='santosh';

