library(srvitae)
library(purrr)
library(tidyverse)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

bib <- bibliography_entries("papers.bib")

bib$author <- bold_me(bib$author)

x <- bib[1]

x <- bib$author[1][[1]][1]
y <- x[[1]][1]
z <- unlist(y)
a <- csl_name(z)
a

bold_me <- function(x) {
    a <- list()
    for(nms in x) {
        b <- list()
        for(n in nms) {
            if(n$family == "Rowan" & n$given == "Sebastian"){
                c <- csl_name("ROWAN", "SEBASTIAN")
            } else {
                c <- csl_name(n$family, n$given)
            }
            b <- c(b, list(c))
        }
        b <- list_of_csl_names(csl_names(b))
        a <- c(a, list(b))
    }
    a <- list_of_csl_names(a)
    print(a)
}
bib$author <- bold_me(bib$author)
