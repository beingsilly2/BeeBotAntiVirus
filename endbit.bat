@echo off
SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (`Type %SystemDrive%\%root%\Files`) DO (
  SET var!count!=%%F
powershell get-filehash %var!count!% -Algorithm SHA1 >> %SystemDrive%\%root%\hashD
powershell get-filehash %var!count!% -Algorithm SHA256 >> %SystemDrive%\%root%\hashD
powershell get-filehash %var!count!% -Algorithm SHA384 >> %SystemDrive%\%root%\hashD
powershell get-filehash %var!count!% -Algorithm SHA512 >> %SystemDrive%\%root%\hashD
powershell get-filehash %var!count!% -Algorithm MACTripleDES >> %SystemDrive%\%root%\hashD
powershell get-filehash %var!count!% -Algorithm MD5 >> %SystemDrive%\%root%\hashD
powershell get-filehash %var!count!% -Algorithm RIPEMD160 >> %SystemDrive%\%root%\hashD
  SET /a count=!count!+1
)
SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (`type %SystemDrive%\%root%\VirusDataBaseHash.dbf`) DO (
  SET var!count!=%%F
type hashD|findstr /c:"%var!count!%"
type hashD|findstr /c:"%var!count!%" >> %SystemDrive%\%root%\found
  SET /a count=!count!+1
)
SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (`%SystemDrive%\%root%\found`) DO (
  SET var!count!=%%F
del %var!count!%
  SET /a count=!count!+1
)
