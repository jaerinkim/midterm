#' Rasch Class
#' 
#' Defines class Rasch
#' 
#' @param name The test taker's name
#' @param a A vector of question-item parameters
#' @param yj A vector of answers for the respondent
#' 
#' @return the output containing
#' \item{outputa}{first output}
#' \item{outputb}{second output}
#' @author Jaerin Kim
#' @note This class is just for the exam.
#' @examples
#' atesttaker<-new("Rasch", name="Jaerin", a=c(1:10), yj=c(1:10))
#' atesttaker
#' 
#' @seealso
#' @rdname Rasch
#' @aliases Rasch,ANY-method
#' @export
Rasch<-setClass(Class="Rasch", #Making the object "Rasch" to make further coding easier.

                ## It seems name is a character and the rest are numeric objects.
               slots=c(name="character",
                       a="numeric",
                       yj="numeric"),

               ## Setting the prototype
               prototype=list(name="Anonymous", a=c(), yj=c()),
               
               ## Checks the validity of the function.
               validity=function(object){
               ## The most obvious error should be when the student solved too much or too less.
                 if(length(object@a)!=length(object@yj)){       
                   return("Solve more problems! Or less.")
                 }
              ## No other validity issues. Non-character names cannot be assigned,
                 ## even without validity test.
               })