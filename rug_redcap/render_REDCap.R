
dir <- getwd()
rmd_doc <- paste0(dir, "./rug_redcap/REDCap_params.Rmd")

### render .Rmd document for multiple participants

rmarkdown::render(rmd_doc, params = list(id = 101:110), envir = new.env())



### use purr::walk to create multiple reports for a series of IDs

ids <- c(102, 103, 105, 115, 120)

purrr::walk(c(ids),
            ~ rmarkdown::render(rmd_doc,
                                params = list(id = .x),
                                envir = new.env(),
                                output_file =
                                  paste0(dir, "./rug_redcap/individual_redcap_reports/", 'Participant_', .x,
                                                     '_', "OGTT_Results", '.html')))


purrr::walk(c(last_ids),
            ~ rmarkdown::render('./PUFP_ufp_only_param.Rmd',
                                params = list(participant_id_string = .x,
                                              exposure_period_string = exposure_period_string),
                                envir = new.env(),
                                output_file = paste0(report_path, 'UFP_only_Period_', exposure_period_string,
                                                     '_', .x, '.html')))
