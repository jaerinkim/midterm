#' Prior
#' 
#' The function calculating prior per given theta
#' 
#' @param theta A proposed value of theta
#'  
#' @return a value
#' @author Jaerin Kim
#' @note This function is just for the exam.
#' @examples
#' prior(2)
#' @seealso
#' @rdname prior
#' @aliases prior,ANY-method



#' @export
setGeneric("prior",function(theta){return("Wrong usage of the function. Refer to the documentation.")})
#' @export
setMethod("prior", signature(theta="numeric"),
          function(theta){
            ## The height of normal distribution function at theta, which has mean=0 & sd=3
            return(dnorm(theta,0,3))
          })