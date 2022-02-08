library(shiny)
library(fpp3)

server <- function(input, output, session) {
  plot_df <- reactive({
    minDate <- input$dateRange[1]
    maxDate <- input$dateRange[2]

    filtered_df <- ks_df[ks_df$launched_week >= minDate & ks_df$launched_week <= maxDate,]
    print(filtered_df)

    # TODO: add ability to filter by state

    # TODO: add ability to filter by main_category

    #------------------------
    ks_df_agg <- aggregate(
      usd_pledged ~ deadline_week + main_category, filtered_df, sum
    )


    ts_df <- as_tsibble(
      ks_df_agg,
      key = "main_category",
      index = "deadline_week"
    )

    names(ts_df) <- c("Week Launched", "Main Category", "Money Raised (USD)")

    ts_df
  })

  output$ts_plot <- renderPlot({
    autoplot(plot_df())
  })
}
