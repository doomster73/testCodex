FROM mcr.microsoft.com/mssql/server:2022-latest
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Your_password123
COPY init.sql /init.sql
CMD /bin/bash -c "/opt/mssql/bin/sqlservr & sleep 20 && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P ${SA_PASSWORD} -i /init.sql && tail -f /dev/null"
