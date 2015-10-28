#'  \code{make_similarity_matrix}
#'
#'  Produce adjacency matrix for similarity on input argument
#'
#'  @param attrx vector of attributes for nodes, length n
#'
#'  @return n x n array of (binary) similarity on attrx
#'
#'  @export
#'
make_similarity_matrix <- function(attrx)
{
  n <- length(attrx)
  mat <- array(0, dim = c(n, n))
  for (i in seq_len(n)) {
    for (j in seq_len(n)) {
      mat[i, j] <- as.numeric(attrx[i] == attrx[j])
    }
  }
  mat
}
