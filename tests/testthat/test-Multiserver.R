test_that( "the Multiserver package works", {
  expect_length(Multiserver(bank$arrival_time, bank$service_time, 1), 4)
  expect_error(Multiserver(-1, 1, 1))
})
