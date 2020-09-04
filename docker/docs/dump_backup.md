This is how you create a psql database dump.

 # dump DB
    PGPASSWORD=mate20mg pg_dump -U spryker SH_development_zed > dump_psql.sql
    gzip dump_psql.sql

 # restore DB
    PGPASSWORD=mate20mg pgsql -U spryker SH_development_zed < dump_psql.sql
    gzip dump_psql.sql

 # drop DB
    export PGPASSWORD=mate20mg && dropdb -h localhost -p 5432 -U spryker SH_development_zed
    
 # create DB
    export PGPASSWORD=mate20mg && createdb -h localhost -p 5432 -U spryker DE_development_zed
