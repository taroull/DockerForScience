SET NWorkers=2
SET CNT=0
:bucle
IF %CNT% LSS %NWorkers% (
  SET /A CNT=%CNT%+1
  start runworker.bat -h
  goto :bucle
  )
