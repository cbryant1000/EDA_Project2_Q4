
loadRDS <- function(obj, filename) {
  if (!is.data.frame(obj)) {
    obj <- readRDS(filename)
  }
  obj
}