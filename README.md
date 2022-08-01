# match_regex

A couple of functions similar to `match` and `%in%` but focused on matching regular expressions.

## Example

Given a `string` and a vector of regex `patterns`, return the index of `patterns` that matches `string`:

```
a_string <- "123abc456"

patterns <- c("^[0-9]{3}[a-z]{3}$", "^[0-9]{3}[a-z]{3}[0-9]{3}$", "^[a-z]")

match_regex(a_string, patterns)
#> 2

a_string %in_regex% patterns
#> TRUE
```
