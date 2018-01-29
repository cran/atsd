context("Test the get_entities() function.")

test_that("get_entities() works with http connection", {
  skip_on_cran()
  sink("/dev/null")
  set_connection(file = "configuration/connection.txt")
  e <- get_entities(limit = 1, expression = "name like 'test_entity*'")
  expect_equal(nrow(e), 1)
  expect_match(e$name, "test_entity*")
  sink()
})

# test_that("get_entities() works with https connection with sertificate checking", {
#   skip_on_cran()
#   connection4 <- "/home/user001/4_connection.txt"
#   capture.output(set_connection(file = connection4), file = 'NUL')
#   capture.output(e <- get_entities(limit = 2, expression = "name like 'nur*'"),
#                  file = 'NUL')
#   expect_equal_to_reference(e$name, "get_entities1.rds")
#   capture.output(e <- get_entities(limit = 10, active = TRUE), file = 'NUL')
#   expect_equal(nrow(e), 10)
#   expect_equal(e$enabled[1], TRUE)
# })

# connection8088 <- "/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/8088_connection.txt"
# connection8443 <- "/home/mikhail/axibase/scripts/reading_data/atsd-api-r/trunk/tests/8443_connection.txt"
# 
# ## test http
# 
# # good requests
# set_connection(file = connection8088)
# e1 <- get_entities(limit = 2, expression = "name like 'nur*'")
# e2 <- get_entities(limit = 2, expression = "name like 'nur*' and lower(tags.app) like '*hbase*'", tags = "app")
# e3 <- get_entities(expression = "name like '*nur*'")
