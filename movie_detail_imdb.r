
#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
library(rvest)
library(XML)
library(plyr)

movie=function(movie_name){
  mn=gsub(pattern = " ",replacement = "+",x = movie_name)
  link <- paste0("http://www.imdb.com/find?ref_=nv_sr_fn&q=",mn,"&s=all")
  consumer <- read_html(link)
  z=consumer %>% html_nodes("a") %>% html_attr("href")
  y=z[grep("/title/",z)[1]]
  link1=paste0("http://www.imdb.com",y)
  shell.exec(link1)
}

movie(args[1])
