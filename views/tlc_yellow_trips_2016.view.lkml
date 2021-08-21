view: tlc_yellow_trips_2016 {
  sql_table_name: `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2016`
    ;;

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

  dimension: dropoff_latitude {
    type: number
    sql: ${TABLE}.dropoff_latitude ;;
  }

  dimension: dropoff_longitude {
    type: number
    sql: ${TABLE}.dropoff_longitude ;;
  }

  dimension: extra {
    type: number
    sql: ${TABLE}.extra ;;
  }

  dimension: fare_amount {
    type: number
    sql: ${TABLE}.fare_amount ;;
  }

  dimension: imp_surcharge {
    type: number
    sql: ${TABLE}.imp_surcharge ;;
  }

  dimension: mta_tax {
    type: number
    sql: ${TABLE}.mta_tax ;;
  }

  dimension: passenger_count {
    type: number
    sql: ${TABLE}.passenger_count ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension_group: pickup_datetime {
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
    sql: ${TABLE}.pickup_datetime ;;
  }

  dimension: pickup_geom {
    type: string
    sql: ${TABLE}.pickup_geom ;;
  }

  dimension: pickup_latitude {
    type: number
    sql: ${TABLE}.pickup_latitude ;;
  }

  dimension: pickup_longitude {
    type: number
    sql: ${TABLE}.pickup_longitude ;;
  }

  dimension: rate_code {
    type: number
    description: "The final rate code in effect at the end of the trip. 1= Standard rate 2=JFK 3=Newark 4=Nassau or Westchester 5=Negotiated fare 6=Group ride"
    sql: ${TABLE}.rate_code ;;
  }

  dimension: store_and_fwd_flag {
    type: string
    sql: ${TABLE}.store_and_fwd_flag ;;
  }

  dimension: tip_amount {
    type: number
    sql: ${TABLE}.tip_amount ;;
  }

  dimension: tolls_amount {
    type: number
    sql: ${TABLE}.tolls_amount ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }

  dimension: trip_distance {
    type: number
    sql: ${TABLE}.trip_distance ;;
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
