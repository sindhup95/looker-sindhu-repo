view: tlc_green_trips {
  derived_table: {
    sql:
      SELECT * FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2014
      UNION ALL
      SELECT * FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2015
      UNION ALL
      SELECT * FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2016 ;;
      # UNION
      # SELECT * FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2017
      # UNION
      # SELECT * FROM bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018 ;;
    }
    dimension: distance_between_service {
      type: number
      sql: ${TABLE}.distance_between_service ;;
    }

    dimension_group: dropoff_datetime {
      type: time
      datatype: datetime
      description: "The date and time when the meter was disengaged."
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
      hidden: no
      description: "Latitude where the meter was timed off."
      sql: ${TABLE}.dropoff_latitude ;;
    }

    dimension: dropoff_longitude {
      type: number
      hidden: no
      description: "Longitude where the meter was timed off"
      sql: ${TABLE}.dropoff_longitude ;;
    }

    dimension: dropoff_location {
      type: location
      sql_latitude: ${dropoff_latitude} ;;
      sql_longitude: ${dropoff_longitude} ;;
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
      hidden: no
      description: "The time-and-distance fare calculated by the meter"
      sql: ABS(${TABLE}.fare_amount) ;;
    }

    measure:  total_fare_amount{
      type: sum
      sql: ${fare_amount} ;;
      value_format: "0.000,\" K\""
      drill_fields: [pickup_datetime_year,vendor_id,count,total_fare_amount]
      link: {
        label: "Show as bar chart"
        url: "{% assign vis= '{\"x_axis_gridlines\":false,
\"y_axis_gridlines\":true,
\"show_view_names\":false,
\"show_y_axis_labels\":true,
\"show_y_axis_ticks\":true,
\"y_axis_tick_density\":\"default\",
\"y_axis_tick_density_custom\":5,
\"show_x_axis_label\":true,
\"show_x_axis_ticks\":true,
\"y_axis_scale_mode\":\"linear\",
\"x_axis_reversed\":true,
\"y_axis_reversed\":false,
\"plot_size_by_field\":false,
\"trellis\":\"\",
\"stacking\":\"\",
\"limit_displayed_rows\":false,
\"legend_position\":\"center\",
\"point_style\":\"none\",
\"show_value_labels\":false,
\"label_density\":25,
\"x_axis_scale\":\"auto\",
\"y_axis_combined\":true,
\"ordering\":\"none\",
\"show_null_labels\":false,
\"show_totals_labels\":false,
\"show_silhouette\":false,
\"totals_color\":\"#808080\",
\"color_application\":{\"collection_id\":\"b43731d5-dc87-4a8e-b807-635bef3948e7\",
\"palette_id\":\"fb7bb53e-b77b-4ab6-8274-9d420d3d73f3\",
\"options\":{\"steps\":5}},
\"y_axes\":[{\"label\":\"\",
\"orientation\":\"bottom\",
\"series\":[{\"axisId\":\"tlc_green_trips.count\",
\"id\":\"2016 - tlc_green_trips.count\",
\"name\":\"2016 - Green Trips Count\"},
{\"axisId\":\"tlc_green_trips.total_fare_amount\",
\"id\":\"2016 - tlc_green_trips.total_fare_amount\",
\"name\":\"2016 - Green Trips Total Fare Amount\"},
{\"axisId\":\"tlc_green_trips.count\",
\"id\":\"2015 - tlc_green_trips.count\",
\"name\":\"2015 - Green Trips Count\"},
{\"axisId\":\"tlc_green_trips.total_fare_amount\",
\"id\":\"2015 - tlc_green_trips.total_fare_amount\",
\"name\":\"2015 - Green Trips Total Fare Amount\"},
{\"axisId\":\"tlc_green_trips.count\",
\"id\":\"2014 - tlc_green_trips.count\",
\"name\":\"2014 - Green Trips Count\"},
{\"axisId\":\"tlc_green_trips.total_fare_amount\",
\"id\":\"2014 - tlc_green_trips.total_fare_amount\",
\"name\":\"2014 - Green Trips Total Fare Amount\"}],
\"showLabels\":true,
\"showValues\":true,
\"valueFormat\":\"\",
\"unpinAxis\":false,
\"tickDensity\":\"custom\",
\"tickDensityCustom\":25,
\"type\":\"linear\"}],
\"limit_displayed_rows_values\":{\"show_hide\":\"hide\",
\"first_last\":\"first\",
\"num_rows\":0},
\"hidden_series\":[],
\"hide_legend\":false,
\"series_types\":{},
\"series_colors\":{},
\"series_labels\":{\"2014 - tlc_green_trips.total_fare_amount\":\"2014 - Green Trips Total Fare Amount\",
\"2015 - tlc_green_trips.total_fare_amount\":\"2015 - Green Trips Total Fare Amount\",
\"2016 - tlc_green_trips.total_fare_amount\":\"2016 - Green Trips Total Fare Amount\",
\"2016 - tlc_green_trips.count\":\"2016 - Green Trips Count\",
\"2015 - tlc_green_trips.count\":\"2015 - Green Trips Count\",
\"2014 - tlc_green_trips.count\":\"2014 - Green Trips Count\"},
\"swap_axes\":false,
\"show_null_points\":false,
\"interpolation\":\"linear\",
\"discontinuous_nulls\":false,
\"type\":\"looker_bar\",
\"show_row_numbers\":true,
\"transpose\":false,
\"truncate_text\":true,
\"hide_totals\":false,
\"hide_row_totals\":false,
\"size_to_fit\":true,
\"table_theme\":\"white\",
\"enable_conditional_formatting\":false,
\"header_text_alignment\":\"left\",
\"header_font_size\":12,
\"rows_font_size\":12,
\"conditional_formatting_include_totals\":false,
\"conditional_formatting_include_nulls\":false,
\"defaults_version\":1,
\"value_labels\":\"legend\",
\"label_type\":\"labPer\",
\"custom_color_enabled\":true,
\"show_single_value_title\":true,
\"show_comparison\":false,
\"comparison_type\":\"value\",
\"comparison_reverse_colors\":false,
\"show_comparison_label\":true,
\"hidden_fields\":[\"percent_of_fare_amount\"],
\"hidden_points_if_no\":[],
\"up_color\":false,
\"down_color\":false,
\"total_color\":false,
\"truncate_column_names\":false}' %}

{% assign dynamic_fields= '[{\"_kind_hint\":\"measure\",
\"table_calculation\":\"percent_of_fare_amount\",
\"_type_hint\":\"number\",
\"category\":\"table_calculation\",
\"expression\":\"${tlc_green_trips.count}/${tlc_green_trips.total_fare_amount}\",
\"label\":\"Percent of Fare Amount\",
\"value_format\":null,
\"value_format_name\":\"percent_2\"}]' %}

{{link}}&pivots=tlc_green_trips.pickup_datetime_year&vis={{vis | encode_uri}}&dynamic_fields={{dynamic_fields | encode_uri}}"
      }
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
      type: string
      description: "A numeric code signifying how the passenger paid for the trip. 1= Credit card 2= Cash 3= No charge 4= Dispute 5= Unknown 6= Voided trip"
      case: {
        when: {
          sql: ${TABLE}.payment_type= 1 ;;
          label: "Credit card"
        }
        when: {
          sql: ${TABLE}.payment_type = 2 ;;
          label: "Cash"
        }
        when: {
          sql: ${TABLE}.payment_type = 3 ;;
          label: "No charge"
        }
        when: {
          sql: ${TABLE}.payment_type = 4 ;;
          label: "Dispute"
        }
        when: {
          sql: ${TABLE}.payment_type = 5 ;;
          label: "Unknown"
        }
        else: "Voided trip"
      }
      html:
      {% if value == "Credit card" %}
         <p><img src="https://static9.depositphotos.com/1062085/1241/i/950/depositphotos_12416200-stock-photo-credit-card-collection-isolated.jpg" height=25 width=25>{{ rendered_value }}</p>
      {% elsif value == "Cash" %}
        <p><img src="https://image.shutterstock.com/image-photo/money-600w-696138958.jpg" height=25 width=25>{{ rendered_value }}</p>
      {% elsif value == "No charge" %}
        <p><img src="https://thumbs.dreamstime.com/z/no-charge-rubber-stamp-grunge-design-dust-scratches-effects-can-be-easily-removed-clean-crisp-look-color-easily-84537598.jpg" height=25 width=25>{{ rendered_value }}</p>
      {% elsif value == "Dispute" %}
        <p><img src="https://image.shutterstock.com/image-illustration/examine-study-dispute-showed-magnify-600w-1889278105.jpg" height=25 width=25>{{ rendered_value }}</p>
      {% elsif value == "Unknown" %}
        <p><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1lid2IQc_bA-NGm-9CFx5jpB7TAO1zs1djg&usqp=CAU" height=25 width=25>{{ rendered_value }}</p>
      {% else %}
        <p><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuKX4UOG_NjD4ru2xCjzBv8aYMIS97BoRGKg&usqp=CAU" height=25 width=25>{{ rendered_value }}</p>
      {% endif %}
      ;;
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
      hidden: yes
      description: "Latitude where the meter was engaged."
      sql: ${TABLE}.pickup_latitude ;;
    }

    dimension: pickup_longitude {
      type: number
      hidden: yes
      description: "Longitude where the meter was engaged."
      sql: ${TABLE}.pickup_longitude ;;
    }

    dimension: pickup_location {
      type: location
      sql_latitude: ${pickup_latitude} ;;
      sql_longitude: ${pickup_longitude} ;;
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
      sql: ABS(TIMESTAMP_DIFF(TIMESTAMP(${dropoff_datetime_time}),TIMESTAMP(${pickup_datetime_time}), HOUR));;
    }

    dimension: time_between_service_tier {
      label: "Time Between Service in Hours"
      type: tier
      tiers: [1,6,11,16,25]
      style: integer
      sql: ${time_between_service} ;;
    }

    dimension: tip_amount {
      type: number
      description: "Tip amount – This field is automatically populated for credit card tips. Cash tips are not included."
      sql: ${TABLE}.tip_amount ;;
    }

    measure: total_tip_amount {
      type: sum
      sql:  ${tip_amount};;
      value_format: "#,##0.0"
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

    measure: total_trip_amount {
      type: sum
      sql:  ${total_amount};;
      value_format: "#,##0.0"
      html:
      {% if payment_type._value == "Credit card" %}
      <p style="background-color: aqua; font-size: 100%">{{ rendered_value }}</p>
      {% elsif payment_type._value == "Cash" %}
      <p style="background-color: lightgreen; font-size:100%">{{ rendered_value }}</p>
      {% elsif payment_type._value == "No charge" %}
      <p style="background-color: powderblue; font-size:100%">{{ rendered_value }}</p>
      {% elsif payment_type._value == "Dispute" %}
      <p style="background-color: red; font-size:100%">{{ rendered_value }}</p>
      {% elsif payment_type._value == "Unknown" %}
      <p style="background-color: orange; font-size:100%">{{ rendered_value }}</p>
      {% else %}
      <p style="background-color: lightpink; font-size:100%">{{ rendered_value }}</p>
      {% endif %};;
    }

    dimension: trip_distance {
      type: number
      description: "The elapsed trip distance in miles reported by the taximeter"
      sql: ${TABLE}.trip_distance ;;
    }

    dimension: trip_distance_tier {
      label: "Trip Distance in Miles"
      type: tier
      tiers: [0,20,40,60,80,100,150,200,300,400,500,600]
      style: integer
      sql: ${trip_distance} ;;
    }

    dimension: trip_type {
      type: string
      description: "A code indicating whether the trip was a street-hail or a dispatch that is automatically assigned based on the metered rate in use but can be altered by the driver. 1= Street-hail 2= Dispatch"
      case: {
        when: {
          sql: ${TABLE}.trip_type = 1;;
          label: "Street-hail"
        }
        when: {
          sql: ${TABLE}.trip_type = 2;;
          label: "Dispatch"
        }
        else: "Unknown"
      }
    }



    dimension: vendor_id {
      type: string
      label: "Vendor Name"
      description: "A code indicating the LPEP provider that provided the record. 1= Creative Mobile Technologies, LLC; 2= VeriFone Inc."
      case: {
        when: {
          sql: ${TABLE}.vendor_id = "1" ;;
          label: "Creative Mobile Technologies"
        }
        else: "VeriFone Inc"
      }
    }

    measure: count {
      type: count
      drill_fields: []
    }
  }
