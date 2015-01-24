--<ScriptOptions statementTerminator=";"/>

ALTER TABLE "santosh"."COLLEGE_MEMBERS" DROP CONSTRAINT "COLLEGE_MEMBERS_PK";

DROP TABLE "santosh"."COLLEGE_MEMBERS";

CREATE TABLE "santosh"."COLLEGE_MEMBERS" (
		"ENROLLMENT_NO" VARCHAR(15) NOT NULL,
		"NAME" VARCHAR(30) NOT NULL,
		"EMAIL" VARCHAR(30) NOT NULL
	)
	DATA CAPTURE NONE 
	IN "USERSPACE1";

ALTER TABLE "santosh"."COLLEGE_MEMBERS" ADD CONSTRAINT "COLLEGE_MEMBERS_PK" PRIMARY KEY
	("ENROLLMENT_NO");

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='08104001027',
		VALCOUNT=1,
		DISTCOUNT=1
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'ENROLLMENT_NO' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='08104001028',
		VALCOUNT=2,
		DISTCOUNT=2
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'ENROLLMENT_NO' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='08104001036',
		VALCOUNT=3,
		DISTCOUNT=3
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'ENROLLMENT_NO' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=3;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='08104001056',
		VALCOUNT=4,
		DISTCOUNT=4
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'ENROLLMENT_NO' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=4;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='08104001084',
		VALCOUNT=5,
		DISTCOUNT=5
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'ENROLLMENT_NO' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=5;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='ANWESHA ROY',
		VALCOUNT=1
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='ARPAN DEY',
		VALCOUNT=2
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='SANTOSH GHOSH',
		VALCOUNT=3
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=3;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='ZINNIA MUKHERJEE',
		VALCOUNT=4
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=4;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='ZINNIA MUKHERJEE',
		VALCOUNT=5
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=5;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='arpandey26@gmail.com',
		VALCOUNT=1
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=1;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='ghosh.santosh91@gmail.com',
		VALCOUNT=2
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=2;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='me_anwesha@yahoo.co.in',
		VALCOUNT=3
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=3;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='zinnia.rulezz@gmail.com',
		VALCOUNT=4
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=4;

UPDATE SYSSTAT.COLDIST 
	SET COLVALUE='zinnia.rulezz@gmail.com',
		VALCOUNT=5
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh'
	AND TYPE='Q'
	AND SEQNO=5;

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=5,
		HIGH2KEY='08104001056',
		LOW2KEY='08104001028',
		AVGCOLLEN=15,
		NUMNULLS=0
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'ENROLLMENT_NO' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=5,
		HIGH2KEY='SATINATH GHOSH',
		LOW2KEY='ARPAN DEY',
		AVGCOLLEN=17,
		NUMNULLS=0
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'NAME' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.COLUMNS 
	SET COLCARD=5,
		HIGH2KEY='sati@gmail.com',
		LOW2KEY='ghosh.santosh91@gmail.com',
		AVGCOLLEN=25,
		NUMNULLS=0
	WHERE TABNAME ='COLLEGE_MEMBERS' AND COLNAME = 'EMAIL' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.INDEXES 
	SET NLEAF=1,
		NLEVELS=1,
		FIRSTKEYCARD=5,
		FIRST2KEYCARD=-1,
		FULLKEYCARD=5,
		CLUSTERRATIO=100,
		SEQUENTIAL_PAGES=0,
		DENSITY=0,
		NUMRIDS=5,
		NUMRIDS_DELETED=0,
		NUM_EMPTY_LEAFS=0,
		AVERAGE_RANDOM_PAGES=1.0,
		AVERAGE_SEQUENCE_GAP=0.0,
		AVERAGE_SEQUENCE_PAGES=0.0,
		DATAPARTITION_CLUSTERFACTOR=1.0,
		INDCARD=5
	WHERE TABNAME ='COLLEGE_MEMBERS' AND INDNAME = 'COLLEGE_MEMBERS_PK' AND TABSCHEMA='santosh';

UPDATE SYSSTAT.TABLES 
	SET CARD=5,
		NPAGES=1,
		FPAGES=1,
		OVERFLOW=0,
		ACTIVE_BLOCKS=0,
		AVGCOMPRESSEDROWSIZE=0,
		AVGROWCOMPRESSIONRATIO=0.0,
		PCTROWSCOMPRESSED=0.0,
		PCTPAGESSAVED=0.0
	WHERE TABNAME ='COLLEGE_MEMBERS' AND TABSCHEMA='santosh';

