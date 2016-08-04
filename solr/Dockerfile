FROM solr:6.1.0 
MAINTAINER Abey Tom <abey.tom@appdynamics.com>

RUN cp -r /opt/solr/example/example-DIH/solr/solr /opt/solr/server/solr
RUN mv /opt/solr/server/solr/solr /opt/solr/server/solr/accounts_core
RUN sed -i -- 's/solr/accounts_core/g' /opt/solr/server/solr/accounts_core/core.properties 

RUN cp -r /opt/solr/example/example-DIH/solr/solr /opt/solr/server/solr
RUN mv /opt/solr/server/solr/solr /opt/solr/server/solr/catalogs_core
RUN sed -i -- 's/solr/catalogs_core/g' /opt/solr/server/solr/catalogs_core/core.properties

RUN cp -r /opt/solr/example/example-DIH/solr/solr /opt/solr/server/solr
RUN mv /opt/solr/server/solr/solr /opt/solr/server/solr/pref_core
RUN sed -i -- 's/solr/pref_core/g' /opt/solr/server/solr/pref_core/core.properties
