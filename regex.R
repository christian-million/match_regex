#' Match Character Against Multiple Regular Expressions
#'
#' These functions are designed similarly to `match` and `%in%`, but use `grepl` to match on regex patterns
#' instead of equality.
#'
#' `match_regex` determines which regex pattern a string first matches when compared against one or more regex patterns.
#'
#' `%in_regex%` shows if a string matches any of the patterns provided.
#'
#' @return
#' `match_regex` returns the integer position of `pattern` that `string` matches, using `grepl`. Returns `NA` when a string doesn't match against any pattern.
#'
#' `%in_regex%` returns a logical vector indicating if `string` is detected in any `pattern`.
#'
#' @param string the string(s) to match
#' @param pattern the regex pattern(s) to match against
#' @param ... additional arguments passed to `grepl`
#'
#' @examples
#' files <- c("one.csv", "two.csv", "three.xml", "img.jpg", "dat.tsv", "joy.png")
#' patterns <- c(csv = ".csv$", tsv = ".tsv$", xml = ".xml$")
#'
#'
#' match_regex(files, patterns)
#' names(patterns[match_regex(files_patterns)])
#'
#' files %in_regex% patterns
#'
#' @export
match_regex <- function(string, patterns, ...){
    unlist(lapply(string, which_regex, patterns = patterns, ...))
}

# For a single string
which_regex <- function(string, patterns, ...){
    x <- unlist(lapply(patterns, grepl, x = string, ...))
    ind <- which(x, useNames = FALSE)
    ifelse(length(ind) == 0, NA_integer_, ind)
}

#' @export
#' @rdname match_regex
`%in_regex%` <- function(string, patterns){
    match_regex(string, patterns) > 0L
}

