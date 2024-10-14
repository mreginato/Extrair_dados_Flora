# Tutorial e funções para extrair dados dos campos controlados da Flora do Brasil

Nesse repositório estão algumas funções e um script para a extração dos dados controlados do site da Flora do Brasil. 

## Requisitos

Para a extração dos dados iremos utilizar alguns programas (fazer o download e/ou instalar):

* [R](https://cran.r-project.org/)
* [Rstudio Desktop](https://rstudio.com/products/rstudio/download/)


As seguintes funções: (disponível em [/functions](https://github.com/mreginato/Extrair_dados_Flora/tree/main/functions))

* buidMatrix.R
* extractDescriptions.R
* getFloraTaxa.R

E o seguinte script: 

extract.flora.data.R

* [Zip com as funções e um script exemplo](https://github.com/mreginato/Extrair_dados_Flora/raw/main/flora.zip)

Além disso precisamos dos dados disponíveis no site da Flora (fazer o download):

* [Data as Dwc-File do site da Flora do Brasil](http://ipt.jbrj.gov.br/jbrj/resource?r=lista_especies_flora_brasil)

## Turorial

Depois de intalar o R e o Rstudio, coloque neste mesmo diretório o arquivo "Taxon.txt" disponível no arquivo Dwc-File da Flora do Brasil. Esse será o nosso Working Directory no R.

Depois disso é só seguir o script (extract.flora.data.R).

## Chave interativa 

Talvez seja de interesse também. Segue um vídeo de como gerar uma chave interativa com o pacote monographaR.

[<img src="https://img.youtube.com/vi/rGAd8iC8aCw/maxresdefault.jpg" width="90%">](http://htmlpreview.github.io/?https://github.com/mreginato/Extrair_dados_Flora/blob/main/video_chave.html)


