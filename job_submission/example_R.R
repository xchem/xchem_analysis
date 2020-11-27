cmd_args <- commandArgs(TRUE)

x <- cmd_args[1]
y <- cmd_args[2]

myfun <- function(x,y)
  return(x+y)

myfun(x,y)