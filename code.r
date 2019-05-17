library(tidyverse)
library(RPostgreSQL)

conn = dbConnect(PostgreSQL(), host='localhost', port=5432, user='postgres',
                 password='ti@t$jm4converge2019(@)', dbname='lanl')

dbListTables(conn)

dbGetQuery(conn, 'select * from dns limit 3;')

dbGetQuery(conn, 'select * from ports WHERE CAST(name as integer) > 65535 limit 3;')
dbGetQuery(conn, "select * from ports WHERE name like 'N%' limit 3;")

dbGetQuery(conn, "select COUNT(*) from computers;")

dbGetQuery(conn, "select COUNT(*) from auths;")

dbGetQuery(conn, "select COUNT(*) from flows;")
dbGetQuery(conn, "select * from flows limit 3;")
dbGetQuery(conn, "select src_comp, dest_comp, count(*) from flows GROUP BY src_comp, dest_comp ORDER BY count(*) desc limit 5")

ggplot(cnt_by_day, aes(x = day, y = n / 1e6)) + 
  geom_line() + 
  geom_point() +
  scale_y_continuous(breaks = seq(10,30), labels = seq(10,30),
                     limits = c(10,30), expand=c(0,0)) +
  scale_x_continuous(breaks = seq(1,59, by = 2), labels = seq(1,59,by=2),
                     limits = c(1,59)) +
  labs(x = "Day", y = "Authorizations (in millions)") +
  theme(panel.background = element_blank(),
        panel.grid.major = element_line(color = 'gray90'),
        axis.line = element_line(color = "black"))


dbGetQuery(conn, 'select * from dns limit 3;')