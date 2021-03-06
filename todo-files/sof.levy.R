#' Levy function
#'
#' @template arg_dimensions
#' @template ret_smoof_single
#' @export
makeLevyFunction = function(dimensions) {
  assertCount(dimensions)
  global.opt.params = as.list(rep(1, dimensions))
  names(global.opt.params) = paste("x", seq(dimensions), sep = "")
  makeSingleObjectiveFunction(
    name = paste(dimensions, "-d Levy function", sep = ""),
    fn = function(x) {
      n = length(x)
      w = 1 + (x - 1) / 4
      ww = w[-n]
      a = sin(3.1415 * w[1])
      b = sum((ww - 1)^2 * (1 + 10 * sin(3.1415 * ww + 1)^2))
      c = (w[n] - 1)^2 * (1 + sin(2 * 3.1415 * w[n])^2)
      return(a + b + c)
    },
    par.set = makeNumericParamSet(
      len = dimensions,
      id = "x",
      lower = rep(-10, dimensions),
      upper = rep(10, dimensions),
      vector = TRUE
    ),
    global.opt.params = global.opt.params,
    global.opt.value = 0
  )
}
