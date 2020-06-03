
test_that("forint() returns the input number with 'HUF' added", {
  expect_equal(forint(42), "42 HUF")
})
