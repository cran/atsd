#library("atsd", quietly = TRUE, verbose = FALSE)
cat("\n")

context("Test connection management.")

test_that("set_connection() correctly changes connection variables", {
  skip_on_cran()
  sink("/dev/null")
  
  # set all variables from arguments
  set_connection(user = "user01")
  set_connection(encryption = "tls1")
  set_connection(url = "http://host_name:port_number")
  set_connection(verify = "yes")
  set_connection(password = "qwerty")
  connection_txt <- capture.output(show_connection())
  expected <- c("url = http://host_name:port_number", "user = user01",
                "password = qwerty", "verify = yes", "encryption = tls1")
  expect_equal(connection_txt, expected)
  
  # change some of variables
  set_connection(verify = "no")
  set_connection(encryption = "ssl3")
  connection_txt <- capture.output(show_connection())
  expected <- c("url = http://host_name:port_number", "user = user01",
                "password = qwerty", "verify = no", "encryption = ssl3")
  expect_equal(connection_txt, expected)
  
  # set connection from a file
  set_connection(file = "configuration/connection.txt")
  connection_txt <- capture.output(show_connection())
  expected <- c("url = http://localhost:8088", "user = user",
                "password = password", "verify = no", "encryption = ssl3")
  expect_equal(connection_txt, expected)
  sink()
})

test_that("save_connection() correctly save connection variables to file", {
  skip_on_cran()
  sink("/dev/null")
  
  # save current values of connection parameters into configuration file - they should be the same as in configuration/connection.txt
  save_connection()
  
  # change user and url and check
  set_connection(user = "masha")
  set_connection(url = "")
  connection_txt <- capture.output(show_connection())
  expected <- c("url = ", "user = masha",
                "password = password", "verify = no", "encryption = ssl3")
  expect_equal(connection_txt, expected)
  
  # set connection from configuration file and check
  set_connection()
  connection_txt <- capture.output(show_connection())
  expected <- c("url = http://localhost:8088", "user = user",
                "password = password", "verify = no", "encryption = ssl3")
  expect_equal(connection_txt, expected)
  
  # save parameters from arguments
  save_connection(user = "masha", url = "")
  # set connection from configuration file and check
  set_connection()
  connection_txt <- capture.output(show_connection())
  expected <- c("url = NA", "user = masha",
                "password = password", "verify = no", "encryption = ssl3")
  expect_equal(connection_txt, expected)
  
  # set connection from file, and save it in configuration file
  set_connection(file = "configuration/fake_connection.txt")
  save_connection()
  
  # set all variables to empty strings and check
  set_connection(url = "", user = "", password = "", verify = "", encryption = "")
  connection_txt <- capture.output(show_connection())
  expected <- c("url = ", "user = ", "password = ", "verify = NA", "encryption = ")
  expect_equal(connection_txt, expected)
  
  # set fake connection from configuration file and check
  set_connection()
  connection_txt <- capture.output(show_connection())
  expected <- c("url = http://fake_host:fake_port", "user = fake_user", "password = fake_password", 
                "verify = yes", "encryption = tls1")

  # make configuration file clean
  set_connection(file = "configuration/connection.txt")
  save_connection()
  sink()
})

test_that("set_connection() throw error for wrong file argument", {
  skip_on_cran()
  sink("/dev/null")
  # try set connection from non-existing file
  expect_error(
    suppressMessages(
      suppressWarnings(
        set_connection(file = "configuration/wrong_file_name.txt"))))
  # the connection variables should be the same
  connection_txt <- capture.output(show_connection())
  expect_equal(connection_txt[1], "url = http://localhost:8088")
  expect_equal(connection_txt[2], "user = user")
  expect_equal(connection_txt[3], "password = password")
  expect_equal(connection_txt[4], "verify = no")
  sink()
})

