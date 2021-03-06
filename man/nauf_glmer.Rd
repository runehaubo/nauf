% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nauf_freq_regs.R
\name{nauf_glmer}
\alias{nauf_glmer}
\alias{nauf_glmer.nb}
\alias{nauf_lmer}
\title{Fit a mixed effects regression using \code{nauf} contrasts.}
\usage{
nauf_glmer(formula, data = NULL, family = gaussian,
  control = lme4::glmerControl(), start = NULL, verbose = 0L, nAGQ = 1L,
  subset, weights, na.action = na.pass, offset, contrasts = NULL, mustart,
  etastart, devFunOnly = FALSE, ncs_scale = attr(formula,
  "standardized.scale"), ...)

nauf_lmer(formula, data = NULL, REML = TRUE,
  control = lme4::lmerControl(), start = NULL, verbose = 0L, subset,
  weights, na.action = na.pass, offset, contrasts = NULL,
  devFunOnly = FALSE, ncs_scale = attr(formula, "standardized.scale"), ...)

nauf_glmer.nb(..., interval = log(th) + c(-3, 3), tol = 5e-05,
  verbose = FALSE, nb.control = NULL, initCtrl = list(limit = 20, eps = 2
  * tol, trace = verbose))
}
\arguments{
\item{formula, data, subset, weights, offset, control, start, devFunOnly, verbose, REML, family, etastart, mustart, nAGQ, interval, tol, nb.control, initCtrl, ...}{See
\code{\link[lme4]{lmer}}, \code{\link[lme4]{glmer}}, and
\code{\link[lme4]{glmer.nb}}.  Note that many arguments that are passed to
\code{nauf_glmer} are passed to \code{nauf_glmer.nb} through \code{...},
including \code{ncs_scale}.}

\item{na.action, contrasts}{Changes to the default values for these arguments
are ignored with a warning.  See \code{\link{nauf_model.frame}}.}

\item{ncs_scale}{A positive number to be passed as the \code{scale} argument
to \code{\link[standardize]{named_contr_sum}} for all unordered factors.
See \code{\link{nauf_model.frame}}.  For \code{nauf_glmer.nb},
\code{ncs_scale} is passed through \code{...}.}
}
\value{
A fitted model of class \code{\linkS4class{nauf.lmerMod}}
  (\code{nauf_lmer}) or \code{\linkS4class{nauf.glmerMod}} (\code{nauf_glmer}
  and \code{nauf_glmer.nb}).
}
\description{
The mixed effects regression functions \code{nauf_lmer}, \code{nauf_glmer.nb},
and \code{nauf_glmer} fit linear, negative binomial, and other generalized
linear mixed effects models, respectively, impelementing
\code{\link{nauf_contrasts}}.
}
\details{
\code{nauf_lmer}, \code{nauf_glmer}, and \code{nauf_glmer.nb} are based on
the \code{lme4} functions \code{\link[lme4]{lmer}}, \code{\link[lme4]{glmer}},
and \code{\link[lme4]{glmer.nb}}, respectively, but implement
\code{\link{nauf_contrasts}}.  The \code{nauf} functions have all the same
arguments as the functions they are based on, but additionally
\code{ncs_scale}, which is passed to \code{\link{nauf_model.frame}}.  Other
than \code{ncs_scale}, the arguments have the same functions as they do in
the functions they are based on.  The default values for \code{na.action} and
\code{contrasts} cannot be changed (see \code{\link{nauf_model.frame}}).
}
\examples{
\dontrun{
dat <- plosives
dat$spont[dat$dialect == "Valladolid"] <- NA
sobj <- standardize(intdiff ~ voicing * dialect * spont +
  (1 + voicing * spont | speaker) + (1 + dialect | item), dat)
mod <- nauf_lmer(sobj$formula, sobj$data)
}

}
\seealso{
\code{\link{nauf_contrasts}} for a description of the contrasts
  applied to unordered factors; and \code{\link[lme4]{lmer}},
  \code{\link[lme4]{glmer}}, and \code{\link[lme4]{glmer.nb}} for argument
  definitions.
}

