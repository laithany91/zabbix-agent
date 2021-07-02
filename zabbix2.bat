Echo off
    set "textfile=zabbix_agent2.conf"
    set "tempfile=filenametemp.conf"
    (for /f "delims=" %%i in (%textfile%) do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        set "line=!line:zabbix.acfc.com.vn=zabbix.acfcvn.com.vn!"
        echo(!line!
        endlocal
    ))>"%tempfile%"
    del %textfile%
    rename %tempfile%  %textfile%
net stop "Zabbix Agent 2"
net start "Zabbix Agent 2"