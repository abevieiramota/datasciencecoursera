if(!file.exists("data")) {
        dir.create("data")
}

if(!file.exists("./data/cameras.csv")) {

        csvFileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
        download.file(fileUrl, destfile = "./data/cameras.csv")
        dateDownloaded <- date()
}

if(!file.exists("./data/cameras.xlsx")) {
        
        xlsxFileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
        download.file(xlsxFileUrl, destfile = "./data/cameras.xlsx")
        dateDownloaded <- date()
}

if(!file.exists("./data/simple.xml")) {
        
        xmlFileUrl <- "http://www.w3schools.com/xml/simple.xml"
        download.file(xmlFileUrl, destfile = "./data/simple.xml")
        dateDownloaded <- date()
}

if(!file.exists("./data/repos.json")) {
        
        jsonFileUrl <- "https://api.github.com/users/jtleek/repos"
        download.file(jsonFileUrl, destfile = "./data/repos.json")
        dateDownloaded <- date()
}
