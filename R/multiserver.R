#' Multiserver
#'
#' @description This function will stimulate how customers will go through a first come, first serve queuing system as long as 'fate' has already decided when each customer will arrive and their service times.
#'
#' @param Arrivals Number of customer arrivals.
#'
#' @param ServiceTimes How long the service will take for the customer
#' @param NumServers How many servers there will be. For this case, it will be set to 1
#'
#' @return table data
#' @export
#'
#'@example
#' Multiserver(Arrivals = bank$arrival_time, ServiceTimes = bank$service_time, 1)
Multiserver <- function(Arrivals, ServiceTimes, NumServers = 1) {
  if (any(Arrivals <= 0 | ServiceTimes <= 0) || NumServers <= 0){
    stop("Arrivals, ServiceTimes must be positive & NumServers must be positive" )
  }
  if (length(Arrivals) != length(ServiceTimes)){
    stop("Arrivals and ServiceTimes must have the same length")
  }
  # Feed customers through a multiserver queue system to determine each
  # customer's transition times.

  NumCust = length(Arrivals)  #  number of customer arrivals
  # When each server is next available (this will be updated as the simulation proceeds):
  AvailableFrom <- rep(0, NumServers)
  # i.e., when the nth server will next be available

  # These variables will be filled up as the simulation proceeds:
  ChosenServer <- ServiceBegins <- ServiceEnds <- rep(0, NumCust)

  # ChosenServer = which server the ith customer will use
  # ServiceBegins = when the ith customer's service starts
  # ServiceEnds = when the ith customer's service ends

  # This loop calculates the queue system's "Transitions by Customer":
  for (i in seq_along(Arrivals)){
    # go to next available server
    avail <-  min(AvailableFrom)
    ChosenServer[i] <- which.min(AvailableFrom)
    # service begins as soon as server & customer are both ready
    ServiceBegins[i] <- max(avail, Arrivals[i])
    ServiceEnds[i] <- ServiceBegins[i] + ServiceTimes[i]
    # server becomes available again after serving ith customer
    AvailableFrom[ChosenServer[i]] <- ServiceEnds[i]
  }
  out <- dplyr::tibble(Arrivals, ServiceBegins, ChosenServer, ServiceEnds)
  return(out)
}


