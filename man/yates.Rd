\name{yates}
\alias{yates}
\alias{gyates}


\title{Yates's algorithm}
\description{
Implementations os Yates's method for obtaining factor effects; and reverse Yates's method for recovering response values; and a generalization for balanced unreplicated experiments having other than two-level factors.
}
\usage{
yates(y, labels = LETTERS, sep = "")
gyates(y, nlevels)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{
Numeric vector of response values or effects, in standard order. See Details.
}
  \item{labels}{
Character labels for 2-level factors to use when \code{y} contains resoponse values. The first \eqn{log_2(n)} are used, where \eqn{n} is \code{length(y).}
}
  \item{sep}{
Character to use between labels for interaction effects.
}
  \item{nlevels}{
Numeric vector of numbers of levels. The number of observations is assumed to be \code{prod(nlevels).}  
}
}


\details{
These functions implement a method for computing factor effects for balanced, unreplicated designs without need for a matrix of predictor levels. Instead, the responses must be arranged in standard order. The method is described in Yates (1937) for the case where all factors have two levels (as implemented in \code{yates}), and its generalization (\code{gyates}) can be found in Good (1958). Both are described in Drum (2005). In this implementation, \code{gyates()} uses orthonormal (unitary) matrices, rather than keeping track of needed divisors. 

Standard order (also called Yates order) is that in which the first factor varies the fastest and the last varies the slowest. The \code{\link{expand.grid}} function creates factor combinations in standard order. The \code{yates} function is for experiments with all factors having two levels. The returned effects are also in standard order: with the default labels in \code{yates}, the order of the returned effects is (intercept), A, B, AB, C, AC, BC, ABC, D, etc.: note that absence or presence of each factor proceeds in standard order.

In both \code{yates} and \code{gyates}, if the length of \code{y} is one less than expected, \code{y} is assumed to be a set of effects, without the intercept. In that instance, the algorithm is reversed and the response values are recovered from the effects. Since the intercept is absent, the mean is arbitrary. If \code{y} has a \code{"mean"} attribute, the mean is adjusted to that value; otherwise, the recovered responses have a mean of zero.

Effects are scaled to all have the same variance. In \code{yates}, we apply the same convention as in most design texts, e.g., Box et al. (2005): effect = (mean at "+" level) - (mean at "-" level), which is twice the regression coefficient one obtains by regressing \code{y} on predictors of -1s and +1s. In \code{gyates}, effects are computed using orthonormal contrasts, making the squared effects equal to their ANOVA sums of squares. When effects are reversed, the same scaling is assumed. Also, if the elements of \code{y} are independent, so are the effects.
}

\value{
If \code{length(y)} is a power of two (in \code{yates}) or the product of \code{nlevels} (in \code{gyates}), a vector of \code{length(y) - 1} effects is returned (the intercept is omitted). In addition, the returned value has a \code{"mean"} attribute set equal to \code{mean(y)}. The effects from \code{yates} are named in standard order using the labels provided. The effects from \code{gyates} are labeled using patterns of the characters \code{.LQC456789}. For example, with 3 factors, the effect named \code{.L.} is the linear effect of the second factor, and the one named \code{QC.} is the interaction of the first quadratic effect and the second cubic effect.

If \code{length(y)} is one less than a power of two or the product of levels, then a vector one longer of response values is returned. The names of the returned responses are symbol combinations from \code{-+} for \code{yates}, and \code{123456789} from \code{gyates}. For example, in \code{yates} with \code{length(y) = 7}, the returned values are labeled \code{---, +--, -+-, ++-, --+, +-+, -++, +++}; and \code{gyates} with 5 effects and \code{nlevels = c(3, 2)}, the returned effects are labeled \code{11, 21, 31, 12, 22, 32}.
}

\references{
Box, GEP, Hunter, JS, and Hunter, WG (2005)
\emph{Statistics for Experimenters} (2nd ed)
New York: John Wiley & Sons

Drum, M (2005)
Yates's Algorithm. \emph{Encyclopedia of Biostatistics}, 8. Wiley.

Good, IJ (1958)
The interaction algorithm and practical Fourier analysis.
\emph{Journal of the Royal Statistical Society, Series B} 20, 361–372.

Yates, F (1937) The design and analysis of factorial experiments. Technical Communication of the Commonwealth Bureau of Soils, 35, Commonwealth Agricultural Bureau, Farnham Royal
}
\author{
Russell V. Lenth
}

%%\note{}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%%\seealso{}

\examples{
require("unrepx")

# pilot-plant example, BH^2 p. 177
yates(c(60, 72, 54, 68,  52, 83, 45, 80), labels = c("T", "C", "K"))

# recover shrinkage data
yates(shnkEff)

# A 3 x 2 x 4 example
y <- c( 214, 193, 207,   193, 178, 188, 
        225, 206, 213,   221, 214, 216, 
        227, 213, 221,   231, 215, 225, 
        228, 203, 206,   190, 178, 195 )
yeff <- gyates(y, c(3,2,4))
head(eff.test(yeff))  ## Show the biggest few effects
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{design}
