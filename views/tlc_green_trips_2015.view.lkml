view: tlc_green_trips_2015 {
  sql_table_name: `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2015`
    ;;

  dimension: distance_between_service {
    type: number
    sql: ${TABLE}.distance_between_service ;;
  }

  dimension_group: dropoff_datetime {
    type: time
    datatype: datetime
    description: "The date and time when the meter was disengaged."
    timeframes: [raw,
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
    description: "Latitude where the meter was timed off."
    sql: ${TABLE}.dropoff_latitude ;;
  }

  dimension: dropoff_longitude {
    type: number
    description: "Longitude where the meter was timed off"
    sql: ${TABLE}.dropoff_longitude ;;
  }

  dimension: ehail_fee {
    type: number
    sql: ${TABLE}.ehail_fee ;;
  }

  dimension: extra {
    type: number
    description: "Miscellaneous extras and surcharges. Currently, this only includes the $0.50 and $1 rush hour and overnight charges"
    sql: ${TABLE}.extra ;;
  }

  dimension: fare_amount {
    type: number
    description: "The time-and-distance fare calculated by the meter"
    sql: ${TABLE}.fare_amount ;;
  }

  dimension: imp_surcharge {
    type: number
    description: "$0.30 improvement surcharge assessed on hailed trips at the flag drop. The improvement surcharge began being levied in 2015."
    sql: ${TABLE}.imp_surcharge ;;
  }

  dimension: mta_tax {
    type: number
    description: "$0.50 MTA tax that is automatically triggered based on the metered rate in use."
    sql: ${TABLE}.mta_tax ;;
  }

  dimension: passenger_count {
    type: number
    description: "The number of passengers in the vehicle. This is a driver-entered value"
    sql: ${TABLE}.passenger_count ;;
  }

  dimension: payment_type {
    type: number
    description: "A numeric code signifying how the passenger paid for the trip. 1= Credit card 2= Cash 3= No charge 4= Dispute 5= Unknown 6= Voided trip"
    sql: ${TABLE}.payment_type ;;
  }

  dimension_group: pickup_datetime {
    type: time
    datatype: datetime
    description: "The date and time when the meter was engaged."
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

  dimension: pickup_latitude {
    type: number
    description: "Latitude where the meter was engaged."
    sql: ${TABLE}.pickup_latitude ;;
  }

  dimension: pickup_longitude {
    type: number
    description: "Longitude where the meter was engaged."
    sql: ${TABLE}.pickup_longitude ;;
  }

  dimension: rate_code {
    type: number
    description: "The final rate code in effect at the end of the trip. 1= Standard rate 2=JFK 3=Newark 4=Nassau or Westchester 5=Negotiated fare 6=Group ride"
    sql: ${TABLE}.rate_code ;;
  }

  dimension: store_and_fwd_flag {
    type: string
    description: "This flag indicates whether the trip record was held in vehicle memory before sending to the vendor, aka “store and forward,” because the vehicle did not have a connection to the server. Y= store and forward trip N= not a store and forward trip"
    sql: ${TABLE}.store_and_fwd_flag ;;
  }

  dimension: time_between_service {
    type: number
    sql: ${TABLE}.time_between_service ;;
  }

  dimension: tip_amount {
    type: number
    description: "Tip amount – This field is automatically populated for credit card tips. Cash tips are not included."
    sql: ${TABLE}.tip_amount ;;
  }

  dimension: tolls_amount {
    type: number
    description: "Total amount of all tolls paid in trip"
    sql: ${TABLE}.tolls_amount ;;
  }

  dimension: total_amount {
    type: number
    description: "The total amount charged to passengers. Does not include cash tips"
    sql: ${TABLE}.total_amount ;;
  }

  dimension: trip_distance {
    type: number
    description: "The elapsed trip distance in miles reported by the taximeter"
    sql: ${TABLE}.trip_distance ;;
  }

  dimension: trip_type {
    type: number
    description: "A code indicating whether the trip was a street-hail or a dispatch that is automatically assigned based on the metered rate in use but can be altered by the driver. 1= Street-hail 2= Dispatch"
    sql: ${TABLE}.trip_type ;;
  }

  dimension: vendor_id {
    type: string
    description: "A code indicating the LPEP provider that provided the record. 1= Creative Mobile Technologies, LLC; 2= VeriFone Inc."
    sql: ${TABLE}.vendor_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
