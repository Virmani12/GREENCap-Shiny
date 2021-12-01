# GREENCap-Shiny
RShiny Web Application for GREENCap UI

## Requirements
Install R and RShiny

Install Python3

Install DTale

Install GREENCap package: https://github.com/tshanebuckley/GREENCap
```bash
pip install --user git+https://github.com/tshanebuckley/GREENCap.git
```

Install GREENCap API:
```bash
git clone git+https://github.com/tshanebuckley/GREENCap-API.git
```


## Launch

1. Run API:
```bash
uvicorn main:app --reload
```

2. Run App:
```bash
R -e "shiny::runApp('~/GREENCap/GREENCap/gui/RShiny/redcap_webapp.R')"
```




