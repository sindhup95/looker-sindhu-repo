view: taxi_zone_geom {
  sql_table_name: `bigquery-public-data.new_york_taxi_trips.taxi_zone_geom`
    ;;

  dimension: borough {
    type: string
    description: "Borough containing the taxi zone"
    sql: ${TABLE}.borough ;;
  }

  dimension: zone_geom {
    type: string
    description: "Geometric outline that defines the taxi zone suitable for GIS analysis."
    sql:ST_NUMPOINTS(${TABLE}.zone_geom);;
  }

  dimension: zone_id {
    type: string
    description: "Unique ID number of each taxi zone. Corresponds with the pickup_location_id and dropoff_location_id in each of the trips tables"
    sql: ${TABLE}.zone_id ;;
  }

  dimension: zone_name {
    type: string
    description: "Full text name of the taxi zone"
    sql: ${TABLE}.zone_name ;;
  }

  measure: count {
    type: count
    drill_fields: [zone_name]
  }
}
