# data from https://www.kaggle.com/kemical/kickstarter-projects
df_2018 <- read.csv("ks-projects-201801.csv")
df_2018 <- subset(df_2018, launched > "1971-01-01")
df_2018 <- subset(df_2018, deadline > "1971-01-01")
min(df_2018$launched)
min(df_2018$deadline)

keep_cols <- c(
  "ID", "name", "main_category", "category",
  "country", "launched", "deadline", "backers",
  "usd_pledged_real", "usd_goal_real", "state"
)

df_2018 <- df_2018[, keep_cols]
names(df_2018) <- gsub("_real", "", names(df_2018), fixed = TRUE)

write.csv(df_2018, "data/kickstarter.csv", row.names = FALSE)
