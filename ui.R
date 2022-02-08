library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      # TODO: add ability to filter by date
      dateRangeInput(inputId = "selected_range",
                     label = "Select Date Range",
                     start = min(ks_df$launched_week),
                     end = max(ks_df$launched_week),
                     min = min(ks_df$launched_week),
                     max = max(ks_df$launched_week)
                     )

      # TODO: add ability to filter by state

      # TODO: add ability to filter by main_category
    ),
    mainPanel(
      plotOutput("ts_plot")
    )
  )
)
