# Tutorial e funções para extrair dados dos campos controlados da Flora do Brasil

Nesse repositório estão algumas funções e um script para a extração dos dados controlados do site da Flora do Brasil. 

## Requisitos

Para a extração dos dados iremos utilizar alguns programas (fazer o download e/ou instalar):

* [R](https://cran.r-project.org/)
* [Rstudio Desktop](https://rstudio.com/products/rstudio/download/)
* [PhantomJS](https://phantomjs.org/download.html)

As seguintes funções e script:

* [Zip com as funções e um script exemplo](https://github.com/mreginato/Extrair_dados_Flora/raw/main/flora.zip)

E os seguintes dados:

* [Data as Dwc-File do site da Flora do Brasil](http://ipt.jbrj.gov.br/jbrj/resource?r=lista_especies_flora_brasil)

## Turorial

Depois de intalar o R e o Rstudio, coloque o conteúdo do Zip e o programa phantomjs.exe dentro de um diretório. Coloque também neste mesmo diretório o arquivo "Taxon.txt" disponível no arquivo Dwc-File da Flora do Brasil. Esse será o nosso Working Directory no R.

Depois disso é só seguir o script. Segue um vídeo com uma demonstração.


[<img src="https://img.youtube.com/vi/wx_9C8i8MRY/maxresdefault.jpg" width="90%">](http://htmlpreview.github.io/?https://github.com/mreginato/Extrair_dados_Flora/blob/main/video.html)

Talvez seja de interesse também. Segue um vídeo de como gerar uma chave interativa com o pacote monographaR.

[<img src="https://img.youtube.com/vi/rGAd8iC8aCw/maxresdefault.jpg" width="90%">](http://htmlpreview.github.io/?https://github.com/mreginato/Extrair_dados_Flora/blob/main/video_chave.html)


