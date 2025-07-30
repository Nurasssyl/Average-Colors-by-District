# Average Colors by District 🇰🇿

This project generates a **color map of Kazakhstan** by calculating the *average satellite color* for each district using Sentinel-2 imagery.

---

## 🔧 What It Does

- Loads district boundaries from a shapefile (`kaz_admbnda_adm2_2024.shp`)
- Reads `.jpg` satellite snapshots per district
- Extracts the average color by resizing each image to 1×1 pixel
- Joins color data with spatial boundaries
- Outputs a choropleth-style map with custom fill per district

---

## 📁 Output Files

The following files are generated automatically:

- `colors_kazakhstan.csv` — extracted hex colors for each district
- `avg_color_kz_map.png` — full color-coded map of Kazakhstan
- `Average Colors by District, Kazakhstan.jpg` — final exported visual (external file)

---

## 🖼️ Preview

### Full Map  
![Full Map](https://github.com/Nurasssyl/Average-Colors-by-District/blob/main/Average%20Colors%20by%20District%2C%20Kazakhstan.jpg)

---

## 📦 Requirements

Make sure you have the following R packages installed:

```r
install.packages(c("sf", "ggplot2", "magick", "dplyr", "readr"))
