#' Query historical exchange rates
#'
#' Query historical exchange rates for any currency for the past number of days from https://exchangeratesapi.io/.
#' @param base base currency
#' @param symbol currency to convert to
#' @param days number of days to go back from current date
#' @export
#' @importFrom jsonlite fromJSON
#' @importFrom data.table data.table
#' @importFrom httr content
#' @examples
#' convert_currency('EUR', 'HUF', 10)
convert_currency <- function(base, symbol, days) {

  dt <- content(GET(
    'https://api.exchangeratesapi.io/history',
    query = list(
      start_at = Sys.Date() - days,
      end_at   = Sys.Date(),
      base     = base,
      symbols  = symbol
    )))$rates

  dt <- data.table(date = as.Date(names(dt)),
                       rate = unlist(dt))[order(date)]

  return(dt)
}
