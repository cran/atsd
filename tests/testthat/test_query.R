# ## test http
# 
# # good requests
# q2 <- query(metric = "disk_used_percent", selection_interval = "1-Minute")
# q3 <- query(  metric = "disk_used_percent",
#                 entity = "awsswgvml001",
#                 entity_group = "nur-entities-name",
#                 tags = c("file_system=/dev/xvda1", "file_system=/dev/xvdh1", "mount_point=/data", "mount_point=/dev"),  
#                 selection_interval = "1-Day",
#                 end_time = "date('2014-11-23')",
#                 aggregate_interval = "1-Minute",
#                 interpolation = "Linear",
#                 aggregate_statistics = c("Count", "StDev", "WAvg"))
# q4 <- query(  metric = "disk_used_percent",
#                 entity = "nurswgvml006",
#                 entity_group = "nur-entities-name",
#                 selection_interval = "1-Minute",
#                 end_time = "date('2014-11-23')")
# q5 <- query(export_type = "Data",
#                 metric = "disk_used_percent",
#                 entity = "nurswgvml006",
#                 entity_group = "Linux",
#                 tags = c("mount_point-/boot", "file_system=/dev/sda1"),  
#                 selection_interval = "1-Day",
#                 aggregate_interval = "1-Minute",
#                 interpolation = "Linear",
#                 aggregate_statistics = c("Avg", "Min", "Max"))
# q6 <- query(    metric = "disk_used_per",
#                 entity = "nurswgvml006",
#                 entity_group = "Linux",
#                 tags = c("mount_point=/boot", "file_system=/dev/sda1"),  
#                 selection_interval = "1-Day",
#                 aggregate_interval = "1-Minute",
#                 interpolation = "Linear",
#                 aggregate_statistics = c("Avg", "Min", "Max"))
# q7 <- query(    metric = "disk_used_percent",
#                 entity = "nurswgvml007",
#                 selection_interval = "1-Week",
#                 aggregate_interval = "15-Minute",
#                 interpolation = "None",
#                 aggregate_statistics = c("Max"))
# 
# q8 <- query(metric = "disk_used_percent", entity_group = "nmon-linux", selection_interval = "2-Minute")
# q9 <- query(metric = "disk_used_percent", entity_expression = "name like '*1'", selection_interval = "2-Minute")
# q10 <- query(metric = "disk_used_percent", entity = "nurswgvml011", selection_interval = "2-Minute")
# 
# q8 <- dquery(metric = "disk_used_percent", selection_interval = "1-Hour")
# 
# dfr9 <- fquery(metric = "disk_used_percent",
#               selection_interval = "1-Hour")
# 
# dfr10 <- adquery(metric = "disk_used_per",
#                 entity = "nurswgvml006",
#                 entity_group = "Linux",
#                 tags = c("mount_point=/boot", "file_system=/dev/sda1"),  
#                 selection_interval = "1-Day",
#                 aggregation_interval = "1-Minute",
#                 interpolation = "Linear",
#                 aggregate_statistics = c("Avg", "Min", "Max"))
# 
# dfr11 <- adquery(metric = "disk_used_percent",
#                  entity = "nurswgvml006",
#                  entity_group = "Linux",
#                  tags = c("mount_point=/boot", "file_system=/dev/sda1"),  
#                  selection_interval = "1-Week",
#                  aggregation_interval = "1-Minute",
#                  interpolation = "Linear",
#                  aggregate_statistics = c("Avg", "Min", "Max"))
# 
# dfr12 <- afquery(metric = "disk_used_percent",
#                  entity = "nurswgvml006",
#                  entity_group = "Linux",
#                  tags = c("mount_point=/boot", "file_system=/dev/sda1"),  
#                  selection_interval = "1-Week",
#                  aggregation_interval = "1-Minute",
#                  interpolation = "Linear",
#                  aggregate_statistics = c("Avg", "Min", "Max"))
# 
# dfr13 <- query(metric = "disk_used_percent",
#                  entity = "nurswgvml006",
#                  tags = c("mount_point/boot", "file_system=/dev/sda1"),  
#                  selection_interval = "1-Week",
#                  aggregation_interval = "1--Minute",
#                  interpolation = "Linear",
#                  aggregate_statistics = c("Avg", "Min", "Max"))
# 
# dfr14 <- query()
# 
# dfr15 <- query(user = "axibase",
#               export_type = "Data",
#               metric = "disk_used_percent",
#               entity = "nurswgvml006",
#               entity_group = "Linux",
#               tags = c("mount_point=/boot", "file_system=/dev/sda1"),  
#               selection_interval = "1-Day",
#               aggregation_interval = "1-Minute",
#               interpolation = "Linear",
#               aggregate_statistics = c("Avg", "Min", "Max"))
# 
# dfr16 <- query(user = "axibase",
#                export_type = "Data",
#                metric = "disk_used_percent",
#                selection_interval = "1-Hur")
# 
# dfr17 <- query(export_type = "Data",
#               metric = "disk_used_percent",
#               selection_interval = "1-Hour")
# 
# dfr18 <- fquery(metric = "disk_used_percent",
#                 entity = "nurswgvml007",
#                 selection_interval = "2-Hour",
#                 end_time = "next_day")
# 
# dfr19 <- afquery(metric = "disk_used_percent", 
#                  selection_interval = "1-Week",
#                  end_time = "next_day",
#                  aggregation_interval = "30-Minute",
#                  interpolation = "Linear",
#                  aggregate_statistics = c("Avg", "Min", "Max"))
# 
# dfr20 <- query( export_type = "Data",
#                metric = "cpu_usage",
#                entity = "host-383",
#                selection_interval = "1-Day",
#                end_time = "date('2014-02-10 10:15:03')")
# 
# 
# dfr100 <- query( export_type = "Data",
#                 metric = "message_writes_per_second",
#                 selection_interval = "1-Day")
