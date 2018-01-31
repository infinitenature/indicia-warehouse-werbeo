FROM infinitenature/indicia-warehouse:1.32.0

COPY dump.sql dump.sql

USER postgres
RUN echo $HOME
RUN /etc/init.d/postgresql start && sleep 5 &&\
    PGPASSWORD="indicia_user_pass" psql --host=localhost --dbname=indicia --username=indicia_user < dump.sql

USER root
#CMD ["/usr/bin/supervisord"]
