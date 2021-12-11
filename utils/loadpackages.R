new_libraries <- scan('requirements.txt', what = "")
lapply(new_libraries, library, character.only = TRUE)
