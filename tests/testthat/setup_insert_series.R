
skip_on_cran()
sink("/dev/null")
set_connection(file = "configuration/connection.txt")
dfr <- data.frame(
  time = 1516976896,
  value = 111
)
save_series(dfr, time_col = "time", "time_format" = "sec", "metric_col" = "value",
            metric_name = "test_metric", entity = "test_entity", tags = "tag_name = tag_value",
            verbose = FALSE)
sink()
