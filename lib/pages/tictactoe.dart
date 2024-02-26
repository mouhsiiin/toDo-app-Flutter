import 'package:flutter/material.dart';


class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}


class _TicTacToeState extends State<TicTacToe> {
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  bool isX = true;
  String winner = "";
  int xScore = 0;
  int oScore = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (board[index] == "" && winner == "") {
                      setState(() {
                        if (isX) {
                          board[index] = "X";
                        } else {
                          board[index] = "O";
                        }
                        isX = !isX;
                        filledBoxes++;
                        checkWinner();
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      color: Colors.grey[300],
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Text(
            winner == ""
                ? "It's ${isX ? 'X' : 'O'}'s turn"
                : winner == "draw"
                    ? "It's a draw"
                    : "The winner is $winner",
            style:  TextStyle(
              fontSize: winner == "" ? 20 : 30,
              fontWeight: FontWeight.bold,
              backgroundColor: winner == "" ? Colors.white : Colors.yellow,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "X",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    xScore.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Text(
                    "O",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    oScore.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () {
              setState(() {
                board = ["", "", "", "", "", "", "", "", ""];
                winner = "";
                filledBoxes = 0;
              });
            },
            child: const Text(
              "Reset",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }


  void checkWinner() {
    if (board[0] == board[1] && board[0] == board[2] && board[0] != "") {
      setState(() {
        winner = board[0];
        if (winner == "X") {
          xScore++;
        } else {
          oScore++;
        }
      });
    } else if (board[3] == board[4] && board[3] == board[5] && board[3] != "") {
      setState(() {
        winner = board[3];
        if (winner == "X") {
          xScore++;
        } else {
          oScore++;
        }
      });
    } else if (board[6] == board[7] && board[6] == board[8] && board[6] != "") {
      setState(() {
        winner = board[6];
        if (winner == "X") {
          xScore++;
        } else {
          oScore++;
        }
      });
    } else if (board[0] == board[3] && board[0] == board[6] && board[0] != "") {
      setState(() {
        winner = board[0];
        if (winner == "X") {
          xScore++;
        } else {
          oScore++;
        }
      });
    } else if (board[1] == board[4] && board[1] == board[7] && board[1] != "") {
      setState(() {
        winner = board[1];
        if (winner == "X") {
          xScore++;
        } else {
          oScore++;
        }
      });
    } else if (board[2] == board[5] && board[2] == board[8] && board[2] != "") {
      setState(() {
        winner = board[2];
        if (winner == "X") {
          xScore++;
        } else {
          oScore++;
        }
      });
    } else if (board[0] == board[4] && board[0] == board[8] && board[0] != "") {
      setState(() {
        winner = board[0];
        if (winner == "X") {
          xScore++;
        } else {
          oScore++;
        }
      });
    } else if (board[2] == board[4] && board[2] == board[6] && board[2] != "") {
      setState(() {
        winner = board[2];
        if (winner == "X") {
          xScore++;
        } else {
          oScore++;
        }
      });
    } else if (filledBoxes == 9) {
      setState(() {
        winner = "draw";
      });
    }


  }

}
