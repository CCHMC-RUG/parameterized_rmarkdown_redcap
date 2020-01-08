

### 'simple' - one parameter (year) render commands

dir <- getwd()
rmd_doc <- paste0(dir, "/rug_weather/", "weather_params_simple.Rmd")

rm_doc # filepath of .Rmd file 

### render .Rmd document for single year
rmarkdown::render(rmd_doc, params = list(year = 2010), envir = new.env())

## render .Rmd document for multiple years
rmarkdown::render(rmd_doc, params = list(year = c(2010, 2019)), envir = new.env())

## call GUI with `rmarkdown::render`
rmarkdown::render(rmd_doc, params = "ask", envir = new.env())

### create a function

render_weather <- function(input_year) {
  rmarkdown::render(rmd_doc, 
                    params = list(
                      year = input_year),
                    envir = new.env(),
                    output_file = paste0("Weather_", input_year, ".html"))
}

render_weather(2019)
