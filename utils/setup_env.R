install.packages("renv", repos = "https://cloud.r-project.org")
renv::consent(provided = TRUE) # consent to write to filesystem

# Record packages/deps
new_libraries <- scan('requirements.txt', what = "")
record_packages <- renv::record(new_libraries)
# END Record packages/deps

renv::restore(prompt = FALSE) # install all packages for project from renv.lock file
renv::snapshot(prompt = FALSE) # note newly installed packages
# renv::upgrade(prompt = FALSE) # upgrade renv version
# renv::update(prompt = FALSE) # update packages
