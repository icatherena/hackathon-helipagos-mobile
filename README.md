<h1>Desafío Técnico - Hackathon Mobile Helipagos</h1> 
Se trata de una aplicación mobile capaz de consumir datos a partir de una petición GET a una CryptoAPI. La navegación inicia en una primera pantalla donde se retorna un listado de Coins, con su nombre y símbolo. Al hacer onTap sobre el floating action button, se desplegará un diálogo en el cual el usuario será capaz de ingresar un valor. Si este valor coincide con el nombre o símbolo de alguna Coin, será retornado en la pantalla. No se logró consumir la petición a la API para traer detalles de cada Coin como su image debido a la dificultad para transmitir de una pantalla a la siguiente el id de la Coin en tal index y añadirla a la uri de la API para peticionar esos datos y devolverlos en la pantalla del detalle. Se modificó el splashscren como peticionado en la documentación del Hackathon.
En un inicio, main.dart renderiza MyApp() la cual declara las rutas a todas las pantallas. Es en /screens donde se declara CoinList y CoinDetail. En /model se declaran los tipos de datos que se recibirán en las peticiones a la API. En /common, HttpHandler() declara los métodos que llamarán a la API. En cada pantalla se consumen esas peticiones y se setean las variables que van a retornarse dentro de ListView/Card.
APK: https://drive.google.com/drive/folders/1T3p8CVxfz8INuXH-ee-ozQXjz-FcckEV?usp=drive_link
