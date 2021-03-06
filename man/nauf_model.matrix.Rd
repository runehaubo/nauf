% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nauf_trms_fr_x_z.R
\name{nauf_model.matrix}
\alias{nauf_model.matrix}
\title{Create a fixed effects model matrix using \code{nauf} contrasts.}
\usage{
nauf_model.matrix(object = NULL, data = NULL, ...)
}
\arguments{
\item{object}{A \code{nauf.frame} or a regression formula.
See 'Details'.}

\item{data}{A \code{nauf.frame} or a \code{data.frame}
containing the variables in \code{object} if \code{object} is a regression
formula. See 'Details'.}

\item{...}{Further arguments to be passed to \code{\link{nauf_model.frame}}
when \code{object} is a regression formula and \code{data} is a
\code{data.frame}. See 'Details'.}
}
\value{
A fixed effects model matrix that implements
  \code{\link{nauf_contrasts}}.  Unlike the default
  \code{\link[stats]{model.matrix}} method, the model matrix does not have a
  \code{contrasts} attribute, since multiple sets of contrasts may be
  required for some unordered factors.
}
\description{
\code{nauf_model.matrix} creates a model matrix which employs
\code{\link{nauf_contrasts}} for unordered factors.
}
\details{
Exactly what happens depends on the values of \code{object} and \code{data}.
The following possibilities are evaluated in the order listed:
\describe{
  \item{object is a nauf.frame}{All arguments besides \code{object} are
    ignored, and the information in \code{object} is used to create the model
    matrix.}
  \item{data is a nauf.frame}{All arguments besides \code{data} are ignored,
    and the information in \code{data} is used to create the model matrix.}
  \item{object is a formula and data is a data.frame}{
    \code{\link{nauf_model.frame}} is called with \code{formula = object}
    and \code{data = data}, passing along any additional arguments in
    \code{...} (including \code{ncs_scale}).  Then the model matrix is
    created using the information in the resulting
    \code{nauf.frame}.}
  \item{any other argument values}{An error is returned.}
}
}
\examples{
dat <- plosives
dat$spont[dat$dialect == "Valladolid"] <- NA
form <- intdiff ~ voicing * dialect * spont +
  (1 + voicing * spont | speaker) + (1 + dialect | item)
sobj <- standardize(form, dat)
mf <- nauf_model.frame(sobj$formula, sobj$data)

## the following all result in the same model matrix
mm1 <- nauf_model.matrix(mf)
mm2 <- nauf_model.matrix(form, mf)  # 'form' ignored
mm3 <- nauf_model.matrix(sobj$formula, sobj$data)

}
\seealso{
\code{\link{nauf_contrasts}} for a description of the contrasts
  applied to unordered factors, \code{\link{nauf_model.frame}} for creating a
  model frame with \code{nauf} contrasts, and \code{\link{nauf_glFormula}}
  for obtaining both fixed effects and random effects model matrices.
}

