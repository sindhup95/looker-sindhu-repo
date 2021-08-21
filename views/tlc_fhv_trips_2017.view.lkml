view: tlc_fhv_trips_2017 {
  sql_table_name: `bigquery-public-data.new_york_taxi_trips.tlc_fhv_trips_2017`
    ;;

  dimension: borough {
    type: string
    description: "This is Pickup borough"
    sql: ${TABLE}.borough ;;
  }

  dimension: dispatching_base_num {
    type: string
    description: "The TLC Base License Number of the base that dispatched the trip."
    sql: ${TABLE}.dispatching_base_num ;;
  }

  dimension: dropoff_borough {
    type: string
    sql: ${TABLE}.dropoff_borough ;;
  }

  dimension_group: dropoff_datetime {
    type: time
    datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dropoff_datetime ;;
  }

  dimension: dropoff_location_id {
    type: number
    sql: ${TABLE}.dropoff_location_id ;;
  }

  dimension: dropoff_service_zone {
    type: string
    sql: ${TABLE}.dropoff_service_zone ;;
  }

  dimension: dropoff_zone {
    type: string
    sql: ${TABLE}.dropoff_zone ;;
  }

  dimension: location_id {
    type: number
    description: "The TLC taxi zone of the trip pick-up"
    sql: ${TABLE}.location_id ;;
  }

  dimension_group: pickup_datetime {
    type: time
    datatype: datetime
    description: "The date and time of the trip pick-up."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.pickup_datetime ;;
  }

  dimension: service_zone {
    type: string
    description: "This is Pickup service_zone"
    sql: ${TABLE}.service_zone ;;
  }

  dimension: zone {
    type: string
    description: "This is Pickup zone"
    sql: ${TABLE}.zone ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
