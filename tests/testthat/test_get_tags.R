context("Test the get_series_tags() function.")

test_that("get_series_tags() works with http connection", {
  skip_on_cran();
  sink("/dev/null")
  st <- get_series_tags(metric = "test_metric")
  expect_equal(st[1, "tags.tag_name"], "tag_value")
  sink()
})

#test_that("get_series_tags() works with https connection without certificate checking", {
#  skip_on_cran();
#  sink("/dev/null")
#  set_connection(file = "configuration/secure_connection.txt")
#  st <- get_series_tags(metric = "test_metric")
#  expect_equal(st[1, "tags.tag_name"], "tag_value")
#  sink()
#})

# 
# test_dir <- "/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/"
# connection8088 <- "/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/8088_connection.txt"
# connection8443 <- "/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/8443_connection.txt"
# 
# set_connection(file = connection8088)
# t1 <- get_tags(metric = "disk_used_percent")
# t2 <- get_tags(metric = "disk_used_percent", entity = "nurswgvml007")
# 
# set_connection(file = connection8443)
# t3 <- get_tags(metric = "jvm_memory_used")
# t4 <- get_tags(metric = "message_writes_per_second", entity = "atsd")
# t5 <- get_tags(metric = "metric_writes_per_second")
