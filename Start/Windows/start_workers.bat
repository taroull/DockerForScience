IF EXIST %~s1 goto :default
IF NOT EXIST %~s1 goto :custom
:default
  SET NWorkers=2
  SET CNT=0

:custom
  SET NWorkers=%~s1
  SET CNT=0

:bucle
  IF %CNT% LSS %NWorkers% (
    SET /A CNT=%CNT%+1
    start runworker.bat -h
    goto :bucle
    )
