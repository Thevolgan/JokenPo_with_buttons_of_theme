import 'package:flutter/material.dart';
import 'dart:math';
//importar para animações

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  //Botões e mudança de background:
  var color;
  mudarCor(int Binario) {
    switch (Binario) {
      case 1:
        return color = 1;
        break;

      case 2:
        return color = 2;
        break;

      default:
        return color = 0;
    }
  }

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Opção Selecionada: " + escolhaUsuario);
    print("Opção do App: " + escolhaApp);

// exibe  a imageme da escolha do app:
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }

    //validação:
// caso o usuário ganhe:

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        this._mensagem = "Você ganhou! 😁";
      });

//caso o app ganhe:
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
      setState(() {
        this._mensagem = "Você perdeu! 😢";
      });

//caso dê empate:
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "pedra") ||
        (escolhaApp == "papel" && escolhaUsuario == "papel") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "tesoura")) {
      setState(() {
        this._mensagem = "Empatee! 😮";
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    var i = 117;
    return Scaffold(
      backgroundColor: color == 0
          ? Colors.white
          : color == 1
              ? Color.fromARGB(255, 38, 98, 146)
              : Color.fromARGB(255, 105, 17, 11),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 5, 173),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.back_hand_outlined),
            SizedBox(
              width: 10,
            ),
            Text("JokenPo"),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "O App escolheu:",
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 3,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Image(
            image: this._imagemApp,
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 3,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("imagens/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100),
              ),
            ],
          ),

          //Botões:
          TextButton(
              /*child: Text("Ir para Azul"),
              color: Colors.blue,*/
              style: 
                TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 39, 111, 153),
                  elevation: 15,
                  shadowColor: Colors.green),
                  
              child: Text(
                'Ir para Azul',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              
              onPressed: () {
                setState(() {
                  mudarCor(1);
                });
              }),


           TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 138, 25, 25),
                elevation: 15,
                shadowColor: Colors.purple,
              ),
              child: Text(
                'Ir paraVermelho',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 254, 254),
                ),
              ),
              onPressed: () {
                setState(() {
                  mudarCor(2);
                });
              }),

          /*Image.asset("imagens/pac.gif"),*/
          /*
          Lottie.network(
              'https://assets4.lottiefiles.com/private_files/lf30_aYiP6b.json', ),*/

          Text(
            "By Franklin Volgan",
            style: TextStyle(
                color: Color.fromARGB(255, 236, 236, 236),
                fontSize: 14,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }
}
