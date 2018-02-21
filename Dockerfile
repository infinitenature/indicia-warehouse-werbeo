FROM infinitenature/indicia-warehouse:v-1.32.0-003

COPY dump.sql dump.sql

USER postgres
RUN echo $HOME
RUN /etc/init.d/postgresql start && sleep 20 &&\
    PGPASSWORD="indicia_user_pass" psql --host=localhost --dbname=indicia --username=indicia_user < dump.sql

USER root
#CMD ["/usr/bin/supervisord"]
