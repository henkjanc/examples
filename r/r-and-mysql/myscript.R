t <- runif( 2000, 0,100);
summary( t )
library(DBI)

library(RMySQL)

m<-dbDriver("MySQL");
con<-dbConnect(m,user='root',password='',host='127.0.0.1',dbname='zapaday_copy');

# Users data
res<-dbSendQuery(con, "select id,email,month(datecreated) as month_of_year,dayofyear(datecreated) as day_of_year ,isverified from user where datecreated > '2012-01-01'")
users<- fetch(res, n = -1)


# Editors data
res<-dbSendQuery(con, "select id,(select username from user where createuser_id=user.id) as username,month(createtime) as month_of_year,dayofyear(createtime) as day_of_year  from event where createtime > '2012-01-01'")
editordata<- fetch(res, n = -1)

