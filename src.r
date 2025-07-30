library(magick)
library(dplyr)
library(sf)
library(ggplot2)
library(readr)

setwd("C:/Users/N.Abdrazakuly/Desktop/Example")

shapes <- read_sf("C:/Users/N.Abdrazakuly/Desktop/Geo_kz/geokz-main/maps/kaz_admbnda_adm2_2024.shp")
shapes$name <- gsub("[^a-zA-Z0-9]", "_", shapes$ADM2_EN)

set.seed(123)
sample_names <- sample(shapes$name, 5)
jpg_files <- paste0("C:/Users/N.Abdrazakuly/Desktop/11/satellite/", sample_names, ".jpg")


colors <- data.frame()
for (i in seq_along(jpg_files)) {
  if (file.exists(jpg_files[i])) {
    img <- image_read(jpg_files[i])
    img <- image_transparent(img, "#FFFFFF", fuzz = 0)
    img <- image_scale(img, "1x1!")
    color <- paste0("#", paste(image_data(img)[1:3], collapse = ""))
    colors <- bind_rows(colors, data.frame(name = sample_names[i], color = color))
  }
}

write_csv(colors, "colors_kazakhstan.csv")
colors <- read_csv("colors_kazakhstan.csv")
shapes_test <- filter(shapes, name %in% sample_names)
shapes_test <- left_join(shapes_test, colors, by = "name")

ggplot(shapes_test) +
  geom_sf(aes(fill = I(color)), color = "white", linewidth = 0.15) +
  scale_fill_identity(na.value = "white") +
  theme_void()

ggsave("avg_color_kz_sample.png", width = 10, height = 8, dpi = 300)
