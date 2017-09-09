
adv3 <- hflights %>%  
  group_by(Dest,UniqueCarrier) %>% 
  summarize( n=n()) %>% 
  mutate(rank=rank(desc(n))) %>% 
  filter(rank==1) 
adv3
