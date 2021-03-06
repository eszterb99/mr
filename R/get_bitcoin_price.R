#' Hitting the Binance API to get the most recent price of a Bitcoin in USD
#'
#' This is a wrapper around the \code{binancer} package ...
#' @export
#' @param retried the number if retries previously done before the exponential backoff sleep
#' @importFrom binancer binance_coins_prices
get_bitcoin_price <- function(retried = 0) {
  tryCatch(
    ## not using data.table syntax here and falling back to data.frame
    ## so that this could run on systems without data.table as well
    data <- binance_coins_prices(),
    subset(data, symbol == 'BTC')$usd,
    error = function(e) {
      ## exponential backoff retries
      Sys.sleep(1 + retried^2)
      get_bitcoin_price(retried = retried + 1)
    })
}
