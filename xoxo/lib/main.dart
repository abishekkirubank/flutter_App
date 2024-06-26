import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( Xoxo());
}

class Xoxo extends StatelessWidget {
  const Xoxo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicTacToe(),
    );
  }
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  late List<List<String>> _board;
  late String _currentPlayer;
  late bool _gameOver;

  @override
  void initState() {
    super.initState();
    _initBoard();
  }

  void _initBoard() {
    _board = List.generate(3, (_) => List.filled(3, ''));
    _currentPlayer = 'X';
    _gameOver = false;
  }

  void _markTile(int row, int col) {
    if (_board[row][col] == '' && !_gameOver) {
      setState(() {
        _board[row][col] = _currentPlayer;
        _checkWinner();
        _currentPlayer = (_currentPlayer == 'X') ? 'O' : 'X';
      });
    }
  }

  void _checkWinner() {
    for (int i = 0; i < 3; i++) {
      if (_board[i][0] == _board[i][1] &&
          _board[i][0] == _board[i][2] &&
          _board[i][0] != '') {
        _showDialog(_board[i][0]);
      }
      if (_board[0][i] == _board[1][i] &&
          _board[0][i] == _board[2][i] &&
          _board[0][i] != '') {
        _showDialog(_board[0][i]);
      }
    }
    if (_board[0][0] == _board[1][1] &&
        _board[0][0] == _board[2][2] &&
        _board[0][0] != '') {
      _showDialog(_board[0][0]);
    }
    if (_board[0][2] == _board[1][1] &&
        _board[0][2] == _board[2][0] &&
        _board[0][2] != '') {
      _showDialog(_board[0][2]);
    }
    if (!_board.any((row) => row.any((cell) => cell == '')) && !_gameOver) {
      _showDialog('Draw');
    }
  }

  void _showDialog(String winner) {
    setState(() {
      _gameOver = true;
    });
    String message =
        (winner == 'Draw') ? 'It\'s a Draw!' : 'Player $winner wins!';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Game Over',style: GoogleFonts.acme()),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _initBoard();
              });
            },
            child: Text('Play Again',style: GoogleFonts.acme()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe',style: GoogleFonts.acme(),),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                int row = index ~/ 3;
                int col = index % 3;
                return GestureDetector(
                  onTap: () => _markTile(row, col),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        _board[row][col],
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
