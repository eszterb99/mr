#' Query historical exchange rates for any currency for the past number of days
#'
#' @param base base currency
#' @param symbol currency to convert to
#' @param days number of days to go back from current date
#' @export
#' @importFrom jsonlite fromJSON
#' @importFrom data.table data.table
#' @examples
#' convert_currency('EUR', 'USD', 10)
convert_currency <- function(base, symbol, days) {

  print('empty function')

}
