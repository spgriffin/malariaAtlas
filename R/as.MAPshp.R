#' Convert SpatialPolygon objects into MAPshp objects
#'
#' \code{as.MAPshp} converts a SpatialPolygon or SpatialPolygonsDataframe object downloaded using getShp into a 'MAPshp object (data.frame) for easy plotting with ggplot.
#'
#' @param object SpatialPolygon or SpatialPolygonsDataframe object to convert into a 'MAPshp'.
#'
#' @return \code{as.MAPshp} returns a MAPshp object (data.frame) containing the below columns.
#'
#' \enumerate{
#' \item \code{COUNTRY_ID} ISO-3 code of given administrative unit (or the ISO code of parent unit for administrative-level 1 units).
#' \item \code{GAUL_CODE} GAUL code of given administrative unit.
#' \item \code{ADMN_LEVEL} administrative level of the given administrative unit - either 0 (national) or 1 (first-level division)
#' \item \code{PARENT_ID} GAUL code of parent administrative unit of a given polygon (for admin0 polygons, PARENT_ID = 0).
#' \item \code{PARENT_ID} GAUL code of parent administrative unit of a given polygon (for admin0 polygons, PARENT_ID = 0).
#' \item \code{country_level} composite \code{ISO3}_\code{ADMN_LEVEL} field.
#' }
#'
#' @examples
#' #Download shapefiles for Madagascar and visualise these on a map.
#'
#' \dontrun{
#' MDG_shp <- getShp(ISO = "MDG", admin_level = "admin0")
#' MDG_shp <- as.MAPshp(MDG_shp)
#' autoplot(MDG_shp)
#' }
#'
#' @seealso
#' \code{\link{autoplot.MAPshp}}
#'
#' to download rasters directly from MAP.
#'
#' @export


as.MAPshp <- function(object){

  object@data$id <- rownames(object@data)
  object_df <- ggplot2::fortify(object)
  object_df <- merge(object_df, object@data, by = "id")
  class(object_df) <- c(class(object_df), "MAPshp")

  return(object_df)

}




