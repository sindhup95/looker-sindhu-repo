connection: "bigquery_test_db_connection"

# include all the views
include: "/views/**/*.view"

datagroup: newyork_taxi_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: newyork_taxi_default_datagroup

explore: taxi_zone_geom {
  join: tlc_fhv_trips {
    type: left_outer
    sql_on: ${taxi_zone_geom.zone_name} = ${tlc_fhv_trips.zone} ;;
    relationship: many_to_one
  }
}

explore: tlc_fhv_trips_2015 {
  sql_always_where: ${pickup_datetime_year} = 2015 ;;
}

explore: tlc_fhv_trips_2016 {
  sql_always_where: ${pickup_datetime_year} = 2016 ;;
}

explore: tlc_fhv_trips_2017 {
  sql_always_where: ${pickup_datetime_year} = 2017 AND ${dropoff_datetime_year} = 2017;;
}

explore: tlc_green_trips {
  sql_always_where: ${pickup_datetime_year} >= 2014 AND ${pickup_datetime_year} < 2017 AND
    ${dropoff_datetime_year} >= 2014 AND ${dropoff_datetime_year} < 2017 ;;

}

explore: tlc_green_trips_2014 {
  sql_always_where: ${pickup_datetime_year} = 2014 AND ${dropoff_datetime_year} = 2014;;
}

explore: tlc_green_trips_2015 {
  sql_always_where: ${pickup_datetime_year} = 2015 AND ${dropoff_datetime_year} = 2015 ;;
}

explore: tlc_green_trips_2016 {
  sql_always_where: ${pickup_datetime_year} = 2016 AND ${dropoff_datetime_year} = 2016 ;;

}

explore: tlc_green_trips_2017 {
  sql_always_where: ${pickup_datetime_year} = 2017 AND ${dropoff_datetime_year} = 2017 ;;

}


explore: tlc_green_trips_2018 {
  sql_always_where: ${pickup_datetime_year} = 2018 AND ${dropoff_datetime_year} = 2018 ;;

}

explore: tlc_yellow_trips {
  sql_always_where: ${pickup_datetime_year} >= 2015 AND ${pickup_datetime_year} <= 2017 AND
  ${dropoff_datetime_year} >= 2015 AND ${dropoff_datetime_year} <= 2017 ;;

}

explore: tlc_yellow_trips_2015 {
  sql_always_where: ${pickup_datetime_year} = 2015 AND ${dropoff_datetime_year} = 2015 ;;

}

explore: tlc_yellow_trips_2016 {
  sql_always_where: ${pickup_datetime_year} = 2016 AND ${dropoff_datetime_year} = 2016 ;;

}

explore: tlc_yellow_trips_2017 {
  sql_always_where: ${pickup_datetime_year} = 2017 AND ${dropoff_datetime_year} = 2017 ;;

}

explore: tlc_yellow_trips_2018 {
  sql_always_where: ${pickup_datetime_year} = 2018 AND ${dropoff_datetime_year} = 2018 ;;

}
