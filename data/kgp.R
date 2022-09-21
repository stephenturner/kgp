delayedAssign("kgpe", local({
  if (requireNamespace("tibble", quietly = TRUE)) {
    tibble::as_tibble(kgp:::kgpe)
  } else {
    kgp:::kgpe
  }
}))

delayedAssign("kgp3", local({
  if (requireNamespace("tibble", quietly = TRUE)) {
    tibble::as_tibble(kgp:::kgp3)
  } else {
    kgp:::kgp3
  }
}))

delayedAssign("kgpmeta", local({
  if (requireNamespace("tibble", quietly = TRUE)) {
    tibble::as_tibble(kgp:::kgpmeta)
  } else {
    kgp:::kgpmeta
  }
}))

delayedAssign("allmeta", local({
  if (requireNamespace("tibble", quietly = TRUE)) {
    tibble::as_tibble(kgp:::allmeta)
  } else {
    kgp:::allmeta
  }
}))
