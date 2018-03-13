#' Expected a posteriori value
#' 
#' The function calculating EAP
#' 
#' @param RaschObj An object of "Rasch" class
#' @param lower Lower limit of integration (default=-6)
#' @param upper Upper limit of integration (default=6)
#'  
#' @return Expected a posteriori value
#' @author Jaerin Kim
#' @note This function is just for the exam.
#' @examples
#' atesttaker<-new("Rasch", a=c(1:10), yj=rep(c(1,0),5))
#' eap(atesttaker,-Inf,Inf)
#' @seealso
#' @rdname eap
#' @aliases eap,ANY-method

#' @export
setMethod("print", signature(x="Rasch"),
          ##
          ##Setting default lower and upper bound, as instructed.
          function(x){
            return(list(Name=x@name,
                         EAP=eap(x,-Inf,Inf)))
          })