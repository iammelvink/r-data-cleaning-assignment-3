download_data <- function(url) {
  # Check if dir "data" DOES NOT exist, then create
  if (!file.exists("data")) {
    dir.create("data")
  }

  # Download data set
  fileUrl <- as.character(url)
  download.file(fileUrl,
                destfile = "./data/getdata_projectfiles_UCI HAR Dataset.zip",
                method = "auto",
                mode = "wb")
  unzip(zipfile = "./data/getdata_projectfiles_UCI HAR Dataset.zip", exdir = "./data")

  # Record date downloaded
  (dateDownloaded <- date())
}
