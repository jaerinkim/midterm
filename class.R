#' Rasch Class
#' 
#' Defines class Rasch
#' 
#' @param name The test taker's name
#' @param a A vector of question-item parameters
#' @param yj A vector of answers for the respondent
#' 
#' @author Jaerin Kim
#' @note This class is just for the exam.
#' @examples
#' atesttaker<-new("Rasch", a=c(1:10), yj=rep(c(1,0),5))
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
                 ## yj should be binary. Unless we have partial credits.
                 if(sum(object@yj%in%0:1)!=length(object@yj)){
                   return("The answer should be either right or wrong.")
                 }
              ## No other validity issues. Non-character names cannot be assigned,
                 ## even without validity test.
               })