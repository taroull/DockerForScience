RSetUpConfig <- function() {
  install.packages('devtools', repos='https://cloud.r-project.org/')
  install.packages('RCurl', repos='https://cloud.r-project.org/')
  library(devtools)
  install_github('IRkernel/repr')
  install_github('IRkernel/IRdisplay')
  install_github('IRkernel/IRkernel')
  }
MakingAvalaible <- function() {
  IRkernel::installspec(user = FALSE)
}

if (!require("devtools")) {
  RSetUpConfig()
}
MakingAvalaible()
