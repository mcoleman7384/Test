cd /d %2

REM ---------------------------------------------------------------------------
REM                             DO NOT CHANGE
REM                Following sets variables for NDM and DMS
REM ---------------------------------------------------------------------------

echo %computername%  
echo %1%
echo %2%

REM: %computername% -- 2018-06-01T00:19:41.4566523Z E:\BuildAgentVSTS_Apollo\_work\r3\a\Apollo-Ent-Database\Drop>echo PHXIOVSTSMSP01 
REM: %computername% -- 2018-06-01T00:19:41.4566629Z PHXIOVSTSMSP01
REM: %1% -- 2018-06-01T00:19:41.4566802Z E:\BuildAgentVSTS_Apollo\_work\r3\a\Apollo-Ent-Database\Drop>echo AGL_AP_QA1 
REM: %1% -- 2018-06-01T00:19:41.4566996Z AGL_AP_QA1
REM ---------------------------------------------------------------------------

IF "%1"=="AGL_AP_PRD1" goto :PRD
IF "%1"=="AGL_AP_UAT1" goto :UAT
IF "%1"=="AGL_AP_QA1"  goto :QA
IF "%1"=="AGL_AP_DEV1" goto :DEV

goto :finish

REM IF "%computername:~-4,1%"=="U" goto :UAT
REM IF "%computername:~-4,1%"=="P" goto :PROD
REM ---------------------------------------------------------------------------

:PRD
   SET DMS="AGl_AP_PRD1.internal.mcmcg.com"
   SET NDM="AGl_NDM_PRD1.internal.mcmcg.com"
   SET SSIS="AGl_SSIS_PRD.internal.mcmcg.com"
   SET NDMCONNECT="PHXIODMSQLP02"
	
   goto finish:

:UAT
   SET DMS="AGL_AP_UAT1.internal.mcmcg.com"
   SET NDM="AGL_NDM_UAT1.internal.mcmcg.com"
   SET SSIS="AGL_SSIS_UAT1.internal.mcmcg.com"
   SET NDMCONNECT="PHXIODMSQLU02"
	
   goto finish:
   
:QA
   SET DMS="AGL_AP_QA1.internal.mcmcg.com"
   SET NDM="AGL_NDM_QA1.internal.mcmcg.com"
   SET SSIS="AGL_SSIS_QA1.internal.mcmcg.com"
   SET NDMCONNECT="PHXIODMSQLQ01"
   
   goto finish:

:DEV
   SET DMS="agl_ap_dev1.internal.mcmcg.com"
   SET NDM="agl_ndm_dev1.internal.mcmcg.com"
   SET SSIS="AGL_SSIS_DEV1"
   SET NDMCONNECT="PHXIODMSQLD03"

:finish

sqlcmd -S %NDM% -E -i ".\a.sql"

REM ---------------------------------------------------------------------------
REM                          DO NOT CHANGE - ABOVE
REM ---------------------------------------------------------------------------

REM ---------------------------------------------------------------------------
REM -- <PBI_NAME>
REM ---------------------------------------------------------------------------
REM <SQL_EXEC_COMMAND> sqlcmd -S %<DB_NAME>% -E -i  ".\<FILE_NAME>"
REM <SQL_CMD_TEMPLATE>


REM ---------------------------------------------------------------------------
REM -- DO NOT CHANGE - BELOW
REM ---------------------------------------------------------------------------

sqlcmd -S %NDM% -E -i ".\a.sql"
