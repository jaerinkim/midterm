#' Rasch Method for Print
#' 
#' Prints expectation of a posteriori.
#' 
#' @param x An object of "Rasch" class
#'  
#' @return Name and expected a posteriori value of the object
#' @author Jaerin Kim
#' @note This function is just for the exam.
#' @examples
#' atesttaker<-new("Rasch", a=c(1:10), yj=rep(c(1,0),5))
#' print(atesttaker)
#' @seealso
#' @rdname print.Rasch
#' @aliases print.Rasch,ANY-method

#' @export
setMethod("print", signature(x="Rasch"),
          ##Using x instead of RaschObj. print function required x as the input.
          ##Setting default lower and upper bound, as instructed.
          function(x){
            ##Return the list of name and eap value
            return(list(Name=x@name,
                         EAP=eap(x,-Inf,Inf)))
          })