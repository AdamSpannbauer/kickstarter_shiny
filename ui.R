library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      # TODO: add ability to filter by date
      dateRangeInput("selected_date_range", label = "Select date range", start=min(ks_df$launched), end=max(ks_df$launched), min=min(ks_df$launched), max=max(ks_df$launched))
      # TODO: add ability to filter by state

      # TODO: add ability to filter by main_category
    ),
    mainPanel(
      plotOutput("ts_plot")
    )
  )
)
