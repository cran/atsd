context("Test the save_series() function.")

test_that("save_series() works with http connection", {
  skip_on_cran()
  sink("/dev/null")
  q <- query(metric = "test_metric", selection_interval = "2-Year", end_time = "date('2020-01-01')")
  expect_equal(nrow(q), 1)
  expect_equal(q$Value[1], 111)
  expect_equal(q$Metric[1], "test_metric")
  expect_equal(q$Entity[1], "test_entity")
  expect_equal(q$tag_name[1], "tag_value")
  sink()
})


# 
# 
# 
# dfr <- read.csv("/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/series_data.csv", stringsAsFactors = FALSE)
# 
# # TRUE until time_format not checked
# check_save_series_arguments(dfr, time_col = 2, time_format = "numeric", metric_col = c(3, 4, 5),
#                             entity_col = 1, entity = NA, tags_col = c(6, 7), tags = "tag3=value3", verbose = TRUE)
# 
# # TRUE until time_format not checked
# check_save_series_arguments(dfr, time_col = "time", time_format = "numeric", metric_col = c(3, 4, 5),
#                             entity_col = 1, entity = NA, tags_col = c("t_two", "t_three"), tags = "tag3=value3", verbose = TRUE)
# 
# # TRUE until time_format not checked
# check_save_series_arguments(dfr, time_col = 2, time_format = "numeric", metric_col = c(3, 4, 5),
#                             entity_col = 1, entity = NA, tags_col = c(6, 7), tags = "tag3=value3", verbose = TRUE)
# 
# # Error time_col out of range
# check_save_series_arguments(dfr, time_col = 9, time_format = "numeric", metric_col = c(3, 4, 5),
#                             entity_col = 1, entity = NA, tags_col = c(6, 7), tags = "tag3=value3", verbose = TRUE)
# 
# # Error time_col out of range
# check_save_series_arguments(dfr, time_col = "timestamp", time_format = "numeric", metric_col = c(3, 4, 5),
#                             entity_col = 1, entity = NA, tags_col = c(6, 7), tags = "tag3=value3", verbose = TRUE)
# 
# 
# 
# 
# 
# 
# 
# dfr <- read.csv("/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/series_data.csv", stringsAsFactors = FALSE)
# 
# 
# connection8088 <- "/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/8088_connection.txt"
# connection8443 <- "/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/8443_connection.txt"
# 
# set_connection(file = connection8443);
# 
# dfr <- read.csv("/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/series_data.csv", stringsAsFactors = FALSE)
# save_series(dfr, time_col = 2, time_format = "ms", metric_col = c(3, 4, 5),
#                             entity_col = 1, entity = NA, tags_col = c(6, 7), tags = "r_test_tag3=value3", verbose = TRUE)
# 
# dfr <- read.csv("/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/series_data_Date.csv", 
#                 colClasses = c("character" ,"Date", "numeric", "numeric", "numeric", "character", "integer", "integer"),
#                 stringsAsFactors = FALSE)
# save_series(dfr, time_col = 2, metric_col = c(3, 4, 5),
#             entity_col = 1, entity = NA, tags_col = c(6, 7), tags = "r_test_tag3=value3", verbose = TRUE)
# 
# dfr <- read.csv("/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/series_data_POSIX.csv", 
#                 colClasses = c("character" ,"character", "numeric", "numeric", "numeric", "character", "integer", "integer"),
#                 stringsAsFactors = FALSE)
# dfr$time <- as.POSIXct(dfr$time, tz = "Europe/Moscow")
# save_series(dfr, time_col = 2, metric_col = c(3, 4, 5),
#             entity_col = 1, entity = NA, tags_col = c(6, 7), tags = "r_test_tag3=value3", verbose = TRUE)
# 
# require("chron")
# dfr <- read.csv("/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/series_data_POSIX.csv", 
#                 colClasses = c("character" ,"character", "numeric", "numeric", "numeric", "character", "integer", "integer"),
#                 stringsAsFactors = FALSE)
# dfr$time <- as.chron(dfr$time)
# save_series(dfr, time_col = 2, metric_col = c(3, 4, 5),
#             entity_col = 1, entity = NA, tags_col = c(6, 7), tags = "r_test_tag3=value3", verbose = TRUE)
# detach("package:chron", unload = TRUE)
# 
# require("timeDate")
# dfr <- read.csv("/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/series_data_POSIX.csv", 
#                 colClasses = c("character" ,"character", "numeric", "numeric", "numeric", "character", "integer", "integer"),
#                 stringsAsFactors = FALSE)
# dfr$time <- timeDate(dfr$time, format  = "%Y-%m-%d %H:%M:%S", FinCenter = "Asia/Irkutsk")
# save_series(dfr, time_col = 2, metric_col = c(3, 4, 5),
#             entity_col = 1, entity = NA, tags_col = c(6, 7), tags = "r_test_tag3=value3", verbose = TRUE)
# detach("package:timeDate", unload = TRUE)
# 
# dfr <- read.csv("/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/series_data_format.csv", 
#                 colClasses = c("character" ,"character", "numeric", "numeric", "numeric", "character", "integer", "integer"),
#                 stringsAsFactors = FALSE)
# save_series(dfr, time_col = 2, time_format = "%Y/%m/%d %H:%M:%S", tz = "Europe/Riga", metric_col = c(3, 4, 5),
#             entity_col = 1, entity = NA, tags_col = c(6, 7), tags = "r_test_tag3=value3", verbose = TRUE)
# 
# 
# # Test time zone
# dfr <- read.csv("/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/test_time_zone.csv", 
#                 colClasses = c("character" ,"character", "numeric", "numeric", "numeric", "character", "integer", "integer"),
#                 stringsAsFactors = FALSE)
# res <- save_series(dfr, time_col = 2, time_format = "%Y/%m/%d %H:%M:%S", tz = "Australia/Darwin", metric_col = c(3, 4, 5),
#             entity_col = 1, entity = NA, tags_col = c(6, 7), tags = "r_test_tag3=value3", verbose = TRUE)
