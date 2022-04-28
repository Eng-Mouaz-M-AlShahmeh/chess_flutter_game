/// Developed by Eng Mouaz M AlShahmeh
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 8 squares in each row
  int row = 8;

  // 64 squares in total
  int totalNumberOfSquares = 64;

  // currently selected piece
  bool isTapped = false;
  int indexOfCurrentSelectedPiece = -1;

  // dead pieces
  List<String> deadWhitePieces = ['', '', '', '', '', '', '', '', '', '', '',
    '', '', '', '', ''];
  List<String> deadBlackPieces = ['', '', '', '', '', '', '', '', '', '', '',
    '', '', '', '', ''];
  bool whiteTurn = true; // white goes first, then black goes
  bool isWithinTheBoard = true;

  List<int> blackSquares = [0, -1, 2, -1, 4, -1, 6, -1, -1, 9, -1, 11, -1, 13,
    -1, 15, 16, -1, 18, -1, 20, -1, 22, -1, -1, 25, -1, 27, -1, 29, -1, 31, 32,
    -1, 34, -1, 36, -1, 38, -1, -1, 41, -1, 43, -1, 45, -1, 47, 48, -1, 50, -1,
    52, -1, 54, -1, -1, 57, -1, 59, -1, 61, -1, 63];

  // pieces
  var pieces = [
    // [position, piece, color, selected, possible kill]
    // black pieces
    [0, 'rook', 'black', 'unselected', ''],
    [1, 'knight', 'black', 'unselected', ''],
    [2, 'bishop', 'black', 'unselected', ''],
    [3, 'queen', 'black', 'unselected', ''],
    [4, 'king', 'black', 'unselected', ''],
    [5, 'bishop', 'black', 'unselected', ''],
    [6, 'knight', 'black', 'unselected', ''],
    [7, 'rook', 'black', 'unselected', ''],
    [8, 'pawn', 'black', 'unselected', ''],
    [9, 'pawn', 'black', 'unselected', ''],
    [10, 'pawn', 'black', 'unselected', ''],
    [11, 'pawn', 'black', 'unselected', ''],
    [12, 'pawn', 'black', 'unselected', ''],
    [13, 'pawn', 'black', 'unselected', ''],
    [14, 'pawn', 'black', 'unselected', ''],
    [15, 'pawn', 'black', 'unselected', ''],
    // open spaces -> x = blank, o = possible move, k = possible kill
    [16, 'x', '', '', ''],
    [17, 'x', '', '', ''],
    [18, 'x', '', '', ''],
    [19, 'x', '', '', ''],
    [20, 'x', '', '', ''],
    [21, 'x', '', '', ''],
    [22, 'x', '', '', ''],
    [23, 'x', '', '', ''],
    [24, 'x', '', '', ''],
    [25, 'x', '', '', ''],
    [26, 'x', '', '', ''],
    [27, 'x', '', '', ''],
    [28, 'x', '', '', ''],
    [29, 'x', '', '', ''],
    [30, 'x', '', '', ''],
    [31, 'x', '', '', ''],
    [32, 'x', '', '', ''],
    [33, 'x', '', '', ''],
    [34, 'x', '', '', ''],
    [35, 'x', '', '', ''],
    [36, 'x', '', '', ''],
    [37, 'x', '', '', ''],
    [38, 'x', '', '', ''],
    [39, 'x', '', '', ''],
    [40, 'x', '', '', ''],
    [41, 'x', '', '', ''],
    [42, 'x', '', '', ''],
    [43, 'x', '', '', ''],
    [44, 'x', '', '', ''],
    [45, 'x', '', '', ''],
    [46, 'x', '', '', ''],
    [47, 'x', '', '', ''],
    // white pieces
    [48, 'pawn', 'white', 'unselected', ''],
    [49, 'pawn', 'white', 'unselected', ''],
    [50, 'pawn', 'white', 'unselected', ''],
    [51, 'pawn', 'white', 'unselected', ''],
    [52, 'pawn', 'white', 'unselected', ''],
    [53, 'pawn', 'white', 'unselected', ''],
    [54, 'pawn', 'white', 'unselected', ''],
    [55, 'pawn', 'white', 'unselected', ''],
    [56, 'rook', 'white', 'unselected', ''],
    [57, 'knight', 'white', 'unselected', ''],
    [58, 'bishop', 'white', 'unselected', ''],
    [59, 'king', 'white', 'unselected', ''],
    [60, 'queen', 'white', 'unselected', ''],
    [61, 'bishop', 'white', 'unselected', ''],
    [62, 'knight', 'white', 'unselected', ''],
    [63, 'rook', 'white', 'unselected', '']
  ];

  // overall tap function
  void tappedPiece(int index) {
    setState(() {
      // check player role
      if (whiteTurn && pieces[index][2] != 'white' && isTapped == false) {
        // do nothing
      } else if (!whiteTurn &&
          pieces[index][2] != 'black' &&
          isTapped == false) {
        // do nothing
      }
      // check if square is tapped or not ever
      else if (isTapped == false) {
        // do first tap
        var tappedPieceType = pieces[index][1];
        switch (tappedPieceType) {
          case 'x':
            {}
            break;
          case 'pawn':
            {
              indexOfCurrentSelectedPiece = index;
              tappedPawn(index);
              pieces[index][3] = 'selected';
              isTapped = true;
            }
            break;
          case 'rook':
            {
              indexOfCurrentSelectedPiece = index;
              tappedRook(index);
              pieces[index][3] = 'selected';
              isTapped = true;
            }
            break;
          case 'knight':
            {
              indexOfCurrentSelectedPiece = index;
              tappedKnight(index);
              pieces[index][3] = 'selected';
              isTapped = true;
            }
            break;
          case 'bishop':
            {
              indexOfCurrentSelectedPiece = index;
              tappedBishop(index);
              pieces[index][3] = 'selected';
              isTapped = true;
            }
            break;
          case 'king':
            {
              indexOfCurrentSelectedPiece = index;
              tappedKing(index);
              pieces[index][3] = 'selected';
              isTapped = true;
            }
            break;
          case 'queen':
            {
              indexOfCurrentSelectedPiece = index;
              tappedQueen(index);
              pieces[index][3] = 'selected';
              isTapped = true;
            }
            break;
          default:
            {}
            break;
        }
      } else {
        // do move of item
        if (indexOfCurrentSelectedPiece != -1) {
          // do regular move
          if (pieces[index][1] == 'o') {
            if (pieces[indexOfCurrentSelectedPiece][1] == 'pawn' &&
                pieces[indexOfCurrentSelectedPiece][2] == 'white') {
              if (index <= row && index >= 0) {
                pieces[index][1] = 'queen';
                pieces[index][2] = pieces[indexOfCurrentSelectedPiece][2];
                pieces[indexOfCurrentSelectedPiece][1] = 'x';
                pieces[indexOfCurrentSelectedPiece][2] = '';
                unselectEverything();
                whiteTurn = !whiteTurn;
                isTapped = false;
              } else {
                pieces[index][1] = pieces[indexOfCurrentSelectedPiece][1];
                pieces[index][2] = pieces[indexOfCurrentSelectedPiece][2];
                pieces[indexOfCurrentSelectedPiece][1] = 'x';
                pieces[indexOfCurrentSelectedPiece][2] = '';
                unselectEverything();
                whiteTurn = !whiteTurn;
                isTapped = false;
              }
            } else if (pieces[indexOfCurrentSelectedPiece][1] == 'pawn' &&
                pieces[indexOfCurrentSelectedPiece][2] == 'black') {
              if (index >= totalNumberOfSquares - row &&
                  index <= totalNumberOfSquares) {
                pieces[index][1] = 'queen';
                pieces[index][2] = pieces[indexOfCurrentSelectedPiece][2];
                pieces[indexOfCurrentSelectedPiece][1] = 'x';
                pieces[indexOfCurrentSelectedPiece][2] = '';
                unselectEverything();
                whiteTurn = !whiteTurn;
                isTapped = false;
              } else {
                pieces[index][1] = pieces[indexOfCurrentSelectedPiece][1];
                pieces[index][2] = pieces[indexOfCurrentSelectedPiece][2];
                pieces[indexOfCurrentSelectedPiece][1] = 'x';
                pieces[indexOfCurrentSelectedPiece][2] = '';
                unselectEverything();
                whiteTurn = !whiteTurn;
                isTapped = false;
              }
            } else {
              pieces[index][1] = pieces[indexOfCurrentSelectedPiece][1];
              pieces[index][2] = pieces[indexOfCurrentSelectedPiece][2];
              pieces[indexOfCurrentSelectedPiece][1] = 'x';
              pieces[indexOfCurrentSelectedPiece][2] = '';
              unselectEverything();
              whiteTurn = !whiteTurn;
              isTapped = false;
            }
          }
          // do kill statement move
          if (pieces[index][4] == 'k') {
            if (pieces[indexOfCurrentSelectedPiece][1] == 'pawn' &&
                pieces[indexOfCurrentSelectedPiece][2] == 'white') {
              if (index <= row && index >= 0) {
                // add new kill to list
                if (pieces[index][2] == 'white') {
                  for (int i = 0; i <= deadWhitePieces.length; i++) {
                    if (deadWhitePieces[i] == '') {
                      deadWhitePieces[i] = pieces[index][1].toString();
                      break;
                    }
                  }
                } else {
                  for (int i = 0; i <= deadBlackPieces.length; i++) {
                    if (deadBlackPieces[i] == '') {
                      deadBlackPieces[i] = pieces[index][1].toString();
                      break;
                    }
                  }
                }
                pieces[index][1] = 'queen';
                pieces[index][2] = pieces[indexOfCurrentSelectedPiece][2];
                pieces[indexOfCurrentSelectedPiece][1] = 'x';
                pieces[indexOfCurrentSelectedPiece][2] = '';
                unselectEverything();
                whiteTurn = !whiteTurn;
                isTapped = false;
              } else {
                // add new kill to list
                if (pieces[index][2] == 'white') {
                  for (int i = 0; i <= deadWhitePieces.length; i++) {
                    if (deadWhitePieces[i] == '') {
                      deadWhitePieces[i] = pieces[index][1].toString();
                      break;
                    }
                  }
                } else {
                  for (int i = 0; i <= deadBlackPieces.length; i++) {
                    if (deadBlackPieces[i] == '') {
                      deadBlackPieces[i] = pieces[index][1].toString();
                      break;
                    }
                  }
                }
                pieces[index][1] = pieces[indexOfCurrentSelectedPiece][1];
                pieces[index][2] = pieces[indexOfCurrentSelectedPiece][2];
                pieces[indexOfCurrentSelectedPiece][1] = 'x';
                pieces[indexOfCurrentSelectedPiece][2] = '';
                unselectEverything();
                whiteTurn = !whiteTurn;
                isTapped = false;
              }
            } else if (pieces[indexOfCurrentSelectedPiece][1] == 'pawn' &&
                pieces[indexOfCurrentSelectedPiece][2] == 'black') {
              if (index >= totalNumberOfSquares - row &&
                  index <= totalNumberOfSquares) {
                if (pieces[index][2] == 'white') {
                  for (int i = 0; i <= deadWhitePieces.length; i++) {
                    if (deadWhitePieces[i] == '') {
                      deadWhitePieces[i] = pieces[index][1].toString();
                      break;
                    }
                  }
                } else {
                  for (int i = 0; i <= deadBlackPieces.length; i++) {
                    if (deadBlackPieces[i] == '') {
                      deadBlackPieces[i] = pieces[index][1].toString();
                      break;
                    }
                  }
                }
                pieces[index][1] = 'queen';
                pieces[index][2] = pieces[indexOfCurrentSelectedPiece][2];
                pieces[indexOfCurrentSelectedPiece][1] = 'x';
                pieces[indexOfCurrentSelectedPiece][2] = '';
                unselectEverything();
                whiteTurn = !whiteTurn;
                isTapped = false;
              } else {
                if (pieces[index][2] == 'white') {
                  for (int i = 0; i <= deadWhitePieces.length; i++) {
                    if (deadWhitePieces[i] == '') {
                      deadWhitePieces[i] = pieces[index][1].toString();
                      break;
                    }
                  }
                } else {
                  for (int i = 0; i <= deadBlackPieces.length; i++) {
                    if (deadBlackPieces[i] == '') {
                      deadBlackPieces[i] = pieces[index][1].toString();
                      break;
                    }
                  }
                }
                pieces[index][1] = pieces[indexOfCurrentSelectedPiece][1];
                pieces[index][2] = pieces[indexOfCurrentSelectedPiece][2];
                pieces[indexOfCurrentSelectedPiece][1] = 'x';
                pieces[indexOfCurrentSelectedPiece][2] = '';
                unselectEverything();
                whiteTurn = !whiteTurn;
                isTapped = false;
              }
            } else {
              if (pieces[index][2] == 'white') {
                for (int i = 0; i <= deadWhitePieces.length; i++) {
                  if (deadWhitePieces[i] == '') {
                    deadWhitePieces[i] = pieces[index][1].toString();
                    break;
                  }
                }
              } else {
                for (int i = 0; i <= deadBlackPieces.length; i++) {
                  if (deadBlackPieces[i] == '') {
                    deadBlackPieces[i] = pieces[index][1].toString();
                    break;
                  }
                }
              }
              pieces[index][1] = pieces[indexOfCurrentSelectedPiece][1];
              pieces[index][2] = pieces[indexOfCurrentSelectedPiece][2];
              pieces[indexOfCurrentSelectedPiece][1] = 'x';
              pieces[indexOfCurrentSelectedPiece][2] = '';
              unselectEverything();
              whiteTurn = !whiteTurn;
              isTapped = false;
            }
          }
          unselectEverything();
          isTapped = false;
        }
      }
    });
  }

  // unselect everything
  void unselectEverything() {
    setState(() {
      indexOfCurrentSelectedPiece = -1;
      for (int i = 0; i < pieces.length; i++) {
        pieces[i][3] = 'unselected';
        if (pieces[i][1] == 'o') {
          pieces[i][1] = 'x';
        }
        if (pieces[i][4] == 'k') {
          pieces[i][4] = '';
        }
      }
    });
  }

  // tapped pawn
  void tappedPawn(int index) {
    // color matters for pawns as they can only move 'forward'
    setState(() {
      // white pawn
      // show available moves
      if (pieces[index][2] == 'white') {
        // check if the square in front of the pawn is blank, if it's not..
        if (pieces[index - row][1] != 'x') {
          // do nothing
        }
        // only when pawns are in the 2nd row can they move 2 squares
        else if (index >= totalNumberOfSquares - 2 * row &&
            index <= totalNumberOfSquares - row) {
          // if there is a piece on the 2nd square above the pawn
          if (pieces[index - 2 * row][1] != 'x') {
            // only available move is 1 square above
            pieces[index - row][1] = 'o';
          }
          // available squares are 1 and 2 above
          else {
            pieces[index - row][1] = 'o';
            pieces[index - row * 2][1] = 'o';
          }
        }
        // after that, pawns can only move 1 square
        else {
          pieces[index - row][1] = 'o';
        }
        // if there is enemy piece diagonal to the currently tapped pawn,
        // it's possible kill move
        withinTheBoard(index - row - 1);
        if (isWithinTheBoard) {
          if (index - row - 1 == 55 ||
              index - row - 1 == 47 ||
              index - row - 1 == 39 ||
              index - row - 1 == 31 ||
              index - row - 1 == 23 ||
              index - row - 1 == 15 ||
              index - row - 1 == 7) {
            // do nothing
          } else {
            if (pieces[index - row - 1][1] != 'x' &&
                pieces[index - row - 1][2] == 'black') {
              pieces[index - row - 1][4] = 'k';
            }
          }
        }
        withinTheBoard(index - row + 1);
        if (isWithinTheBoard) {
          if (index - row + 1 == 48 ||
              index - row + 1 == 40 ||
              index - row + 1 == 32 ||
              index - row + 1 == 24 ||
              index - row + 1 == 16 ||
              index - row + 1 == 8 ||
              index - row + 1 == 0) {
            // do nothing
          } else {
            if (pieces[index - row + 1][1] != 'x' &&
                pieces[index - row + 1][2] == 'black') {
              pieces[index - row + 1][4] = 'k';
            }
          }
        }
      }
      // black pawn
      // show available moves
      if (pieces[index][2] == 'black') {
        // check if the square in front of the pawn is blank, if it's not..
        if (pieces[index + row][1] != 'x') {
          // do nothing
        }
        // only when pawns are in the 2nd row can they move 2 squares
        else if (index <= 2 * row && index >= row) {
          // if there is a piece on the 2nd square above the pawn
          if (pieces[index + 2 * row][1] != 'x') {
            // only available move is 1 square above
            pieces[index + row][1] = 'o';
          }
          // available squares are 1 and 2 above
          else {
            pieces[index + row][1] = 'o';
            pieces[index + row * 2][1] = 'o';
          }
        }
        // after that, pawns can only move 1 square
        else {
          pieces[index + row][1] = 'o';
        }
        // if there is enemy piece diagonal to the currently tapped pawn,
        // it's possible kill move
        withinTheBoard(index + row - 1);
        if (isWithinTheBoard) {
          if (index + row - 1 == 63 ||
              index + row - 1 == 55 ||
              index + row - 1 == 47 ||
              index + row - 1 == 39 ||
              index + row - 1 == 31 ||
              index + row - 1 == 23 ||
              index + row - 1 == 15) {
            // do nothing
          } else {
            if (pieces[index + row - 1][1] != 'x' &&
                pieces[index + row - 1][2] == 'white') {
              pieces[index + row - 1][4] = 'k';
            }
          }
        }
        withinTheBoard(index + row + 1);
        if (isWithinTheBoard) {
          if (index + row + 1 == 56 ||
              index + row + 1 == 48 ||
              index + row + 1 == 40 ||
              index + row + 1 == 32 ||
              index + row + 1 == 24) {
            // do nothing
          } else {
            if (pieces[index + row + 1][1] != 'x' &&
                pieces[index + row + 1][2] == 'white') {
              pieces[index + row + 1][4] = 'k';
            }
          }
        }
      }
    });
  }

  // tapped rook
  void tappedRook(int index) {
    setState(() {
      // rook can go up, left, down and right
      // up
      for (int i = 1; i <= 8; i++) {
        withinTheBoard(index - row * i);
        if (isWithinTheBoard) {
          if (pieces[index - row * i][1] != 'x') {
            if (pieces[index - row * i][2] != pieces[index][2]) {
              pieces[index - row * i][4] = 'k';
              break;
            }
            break;
          } else {
            pieces[index - row * i][1] = 'o';
          }
        } else {
          break;
        }
      }
      // down
      for (int i = 1; i <= 8; i++) {
        withinTheBoard(index + row * i);
        if (isWithinTheBoard) {
          if (pieces[index + row * i][1] != 'x') {
            if (pieces[index + row * i][2] != pieces[index][2]) {
              pieces[index + row * i][4] = 'k';
              break;
            }
            break;
          } else {
            pieces[index + row * i][1] = 'o';
          }
        } else {
          break;
        }
      }
      // left
      for (int i = 1; i <= 8; i++) {
        withinTheBoard(index - i);
        if (isWithinTheBoard) {
          if (pieces[index - i][1] != 'x') {
            if (pieces[index - i][2] != pieces[index][2]) {
              pieces[index - i][4] = 'k';
              break;
            }
            break;
          } else {
            pieces[index - i][1] = 'o';
          }
        } else {
          break;
        }
      }
      // right
      for (int i = 1; i <= 8; i++) {
        withinTheBoard(index + i);
        if (isWithinTheBoard) {
          if (pieces[index + i][1] != 'x') {
            if (pieces[index + i][2] != pieces[index][2]) {
              pieces[index + i][4] = 'k';
              break;
            }
            break;
          } else {
            pieces[index + i][1] = 'o';
          }
        } else {
          break;
        }
      }
    });
  }

  // tapped knight
  void tappedKnight(int index) {
    setState(() {
      // knight can go l-shape: up right, up left, down right, down left,
      // right up, right down, left up and left down
      // up right
      withinTheBoard(index - row * 2 + 1);
      if (isWithinTheBoard) {
        if (index - row * 2 + 1 == 48 ||
            index - row * 2 + 1 == 40 ||
            index - row * 2 + 1 == 32 ||
            index - row * 2 + 1 == 24 ||
            index - row * 2 + 1 == 16 ||
            index - row * 2 + 1 == 8 ||
            index - row * 2 + 1 == 0) {
          // do nothing
        } else if (pieces[index - row * 2 + 1][1] != 'x') {
          if (pieces[index - row * 2 + 1][2] != pieces[index][2]) {
            pieces[index - row * 2 + 1][4] = 'k';
          }
        } else {
          pieces[index - row * 2 + 1][1] = 'o';
        }
      }
      // up left
      withinTheBoard(index - row * 2 - 1);
      if (isWithinTheBoard) {
        if (index - row * 2 - 1 == 39 ||
            index - row * 2 - 1 == 31 ||
            index - row * 2 - 1 == 23 ||
            index - row * 2 - 1 == 15 ||
            index - row * 2 - 1 == 7) {
          // do nothing
        } else if (pieces[index - row * 2 - 1][1] != 'x') {
          if (pieces[index - row * 2 - 1][2] != pieces[index][2]) {
            pieces[index - row * 2 - 1][4] = 'k';
          }
        } else {
          pieces[index - row * 2 - 1][1] = 'o';
        }
      }
      // down right
      withinTheBoard(index + row * 2 + 1);
      if (isWithinTheBoard) {
        if (index + row * 2 + 1 == 24 ||
            index + row * 2 + 1 == 32 ||
            index + row * 2 + 1 == 40 ||
            index + row * 2 + 1 == 48 ||
            index + row * 2 + 1 == 56) {
          // do nothing
        } else if (pieces[index + row * 2 + 1][1] != 'x') {
          if (pieces[index + row * 2 + 1][2] != pieces[index][2]) {
            pieces[index + row * 2 + 1][4] = 'k';
          }
        } else {
          pieces[index + row * 2 + 1][1] = 'o';
        }
      }
      // down left
      withinTheBoard(index + row * 2 - 1);
      if (isWithinTheBoard) {
        if (index + row * 2 - 1 == 15 ||
            index + row * 2 - 1 == 23 ||
            index + row * 2 - 1 == 31 ||
            index + row * 2 - 1 == 39 ||
            index + row * 2 - 1 == 47 ||
            index + row * 2 - 1 == 55 ||
            index + row * 2 - 1 == 63) {
          // do nothing
        } else if (pieces[index + row * 2 - 1][1] != 'x') {
          if (pieces[index + row * 2 - 1][2] != pieces[index][2]) {
            pieces[index + row * 2 - 1][4] = 'k';
          }
        } else {
          pieces[index + row * 2 - 1][1] = 'o';
        }
      }
      // right up
      withinTheBoard(index + 2 - row);
      if (isWithinTheBoard) {
        if (index + 2 - row == 8 ||
            index + 2 - row == 9 ||
            index + 2 - row == 16 ||
            index + 2 - row == 17 ||
            index + 2 - row == 24 ||
            index + 2 - row == 25 ||
            index + 2 - row == 32 ||
            index + 2 - row == 33 ||
            index + 2 - row == 40 ||
            index + 2 - row == 41 ||
            index + 2 - row == 48 ||
            index + 2 - row == 49 ||
            index + 2 - row == 56 ||
            index + 2 - row == 57) {
          // do nothing
        } else if (pieces[index + 2 - row][1] != 'x') {
          if (pieces[index + 2 - row][2] != pieces[index][2]) {
            pieces[index + 2 - row][4] = 'k';
          }
        } else {
          pieces[index + 2 - row][1] = 'o';
        }
      }
      // right down
      withinTheBoard(index + 2 + row);
      if (isWithinTheBoard) {
        if (index + 2 + row == 16 ||
            index + 2 + row == 17 ||
            index + 2 + row == 24 ||
            index + 2 + row == 25 ||
            index + 2 + row == 32 ||
            index + 2 + row == 33 ||
            index + 2 + row == 40 ||
            index + 2 + row == 41 ||
            index + 2 + row == 48 ||
            index + 2 + row == 49) {
          // do nothing
        } else if (pieces[index + 2 + row][1] != 'x') {
          if (pieces[index + 2 + row][2] != pieces[index][2]) {
            pieces[index + 2 + row][4] = 'k';
          }
        } else {
          pieces[index + 2 + row][1] = 'o';
        }
      }
      // left up
      withinTheBoard(index - 2 - row);
      if (isWithinTheBoard) {
        if (index - 2 - row == 6 ||
            index - 2 - row == 7 ||
            index - 2 - row == 14 ||
            index - 2 - row == 15 ||
            index - 2 - row == 22 ||
            index - 2 - row == 23 ||
            index - 2 - row == 30 ||
            index - 2 - row == 31 ||
            index - 2 - row == 38 ||
            index - 2 - row == 39 ||
            index - 2 - row == 46 ||
            index - 2 - row == 47) {
          // do nothing
        } else if (pieces[index - 2 - row][1] != 'x') {
          if (pieces[index - 2 - row][2] != pieces[index][2]) {
            pieces[index - 2 - row][4] = 'k';
          }
        } else {
          pieces[index - 2 - row][1] = 'o';
        }
      }
      // left down
      withinTheBoard(index - 2 + row);
      if (isWithinTheBoard) {
        if (index - 2 + row == 63 ||
            index - 2 + row == 62 ||
            index - 2 + row == 55 ||
            index - 2 + row == 54 ||
            index - 2 + row == 47 ||
            index - 2 + row == 46 ||
            index - 2 + row == 39 ||
            index - 2 + row == 38 ||
            index - 2 + row == 31 ||
            index - 2 + row == 30 ||
            index - 2 + row == 23 ||
            index - 2 + row == 22 ||
            index - 2 + row == 15 ||
            index - 2 + row == 14 ||
            index - 2 + row == 7 ||
            index - 2 + row == 6) {
          // do nothing
        } else if (pieces[index - 2 + row][1] != 'x') {
          if (pieces[index - 2 + row][2] != pieces[index][2]) {
            pieces[index - 2 + row][4] = 'k';
          }
        } else {
          pieces[index - 2 + row][1] = 'o';
        }
      }
    });
  }

  // tapped bishop
  void tappedBishop(int index) {
    setState(() {
      // bishop can go 4 diagonals: up right, up left, down right and down left
      // up right
      for (int i = 1; i <= 8; i++) {
        withinTheBoard(index - row * i + i);
        if (isWithinTheBoard) {
          if (index - row * i + i == 56 ||
              index - row * i + i == 48 ||
              index - row * i + i == 40 ||
              index - row * i + i == 32 ||
              index - row * i + i == 24 ||
              index - row * i + i == 16 ||
              index - row * i + i == 8 ||
              index - row * i + i == 0) {
            // do nothing
            break;
          } else if (pieces[index - row * i + i][1] != 'x') {
            if (pieces[index - row * i + i][2] != pieces[index][2]) {
              pieces[index - row * i + i][4] = 'k';
              break;
            }
            break;
          } else {
            pieces[index - row * i + i][1] = 'o';
          }
        } else {
          break;
        }
      }
      // up left
      for (int i = 1; i <= 8; i++) {
        withinTheBoard(index - row * i - i);
        if (isWithinTheBoard) {
          if (index - row * i - i == 63 ||
              index - row * i - i == 55 ||
              index - row * i - i == 47 ||
              index - row * i - i == 39 ||
              index - row * i - i == 31 ||
              index - row * i - i == 23 ||
              index - row * i - i == 15 ||
              index - row * i - i == 7) {
            // do nothing
            break;
          } else if (pieces[index - row * i - i][1] != 'x') {
            if (pieces[index - row * i - i][2] != pieces[index][2]) {
              pieces[index - row * i - i][4] = 'k';
              break;
            }
            break;
          } else {
            pieces[index - row * i - i][1] = 'o';
          }
        } else {
          break;
        }
      }
      // down right
      for (int i = 1; i <= 8; i++) {
        withinTheBoard(index + row * i + i);
        if (isWithinTheBoard) {
          if (index + row * i + i == 56 ||
              index + row * i + i == 48 ||
              index + row * i + i == 40 ||
              index + row * i + i == 32 ||
              index + row * i + i == 24 ||
              index + row * i + i == 16 ||
              index + row * i + i == 8 ||
              index + row * i + i == 0) {
            // do nothing
            break;
          } else if (pieces[index + row * i + i][1] != 'x') {
            if (pieces[index + row * i + i][2] != pieces[index][2]) {
              pieces[index + row * i + i][4] = 'k';
              break;
            }
            break;
          } else {
            pieces[index + row * i + i][1] = 'o';
          }
        } else {
          break;
        }
      }
      // down left
      for (int i = 1; i <= 8; i++) {
        withinTheBoard(index + row * i - i);
        if (isWithinTheBoard) {
          if (index + row * i - i == 63 ||
              index + row * i - i == 55 ||
              index + row * i - i == 47 ||
              index + row * i - i == 39 ||
              index + row * i - i == 31 ||
              index + row * i - i == 23 ||
              index + row * i - i == 15 ||
              index + row * i - i == 7) {
            // do nothing
            break;
          } else if (pieces[index + row * i - i][1] != 'x') {
            if (pieces[index + row * i - i][2] != pieces[index][2]) {
              pieces[index + row * i - i][4] = 'k';
              break;
            }
            break;
          } else {
            pieces[index + row * i - i][1] = 'o';
          }
        } else {
          break;
        }
      }
    });
  }

  // tapped queen
  void tappedQueen(int index) {
    tappedBishop(index);
    tappedRook(index);
  }

  // tapped king
  void tappedKing(int index) {
    setState(() {
      // king can go up, left, down, right and 4 diagonals
      // up
      withinTheBoard(index - row);
      if (isWithinTheBoard) {
        if (pieces[index - row][1] != 'x') {
          if (pieces[index - row][2] != pieces[index][2]) {
            pieces[index - row][4] = 'k';
          }
        } else {
          pieces[index - row][1] = 'o';
        }
      }
      // down
      withinTheBoard(index + row);
      if (isWithinTheBoard) {
        if (pieces[index + row][1] != 'x') {
          if (pieces[index + row][2] != pieces[index][2]) {
            pieces[index + row][4] = 'k';
          }
        } else {
          pieces[index + row][1] = 'o';
        }
      }
      // up right
      withinTheBoard(index - row + 1);
      if (isWithinTheBoard) {
        if (index - row + 1 == 56 ||
            index - row + 1 == 48 ||
            index - row + 1 == 40 ||
            index - row + 1 == 32 ||
            index - row + 1 == 24 ||
            index - row + 1 == 16 ||
            index - row + 1 == 8 ||
            index - row + 1 == 0) {
          // do nothing
        } else if (pieces[index - row + 1][1] != 'x') {
          if (pieces[index - row + 1][2] != pieces[index][2]) {
            pieces[index - row + 1][4] = 'k';
          }
        } else {
          pieces[index - row + 1][1] = 'o';
        }
      }
      // up left
      withinTheBoard(index - row - 1);
      if (isWithinTheBoard) {
        if (index - row - 1 == 63 ||
            index - row - 1 == 55 ||
            index - row - 1 == 47 ||
            index - row - 1 == 39 ||
            index - row - 1 == 31 ||
            index - row - 1 == 23 ||
            index - row - 1 == 15 ||
            index - row - 1 == 7) {
          // do nothing
        } else if (pieces[index - row - 1][1] != 'x') {
          if (pieces[index - row - 1][2] != pieces[index][2]) {
            pieces[index - row - 1][4] = 'k';
          }
        } else {
          pieces[index - row - 1][1] = 'o';
        }
      }
      // down right
      withinTheBoard(index + row + 1);
      if (isWithinTheBoard) {
        if (index + row + 1 == 56 ||
            index + row + 1 == 48 ||
            index + row + 1 == 40 ||
            index + row + 1 == 32 ||
            index + row + 1 == 24 ||
            index + row + 1 == 16 ||
            index + row + 1 == 8 ||
            index + row + 1 == 0) {
          // do nothing
        } else if (pieces[index + row + 1][1] != 'x') {
          if (pieces[index + row + 1][2] != pieces[index][2]) {
            pieces[index + row + 1][4] = 'k';
          }
        } else {
          pieces[index + row + 1][1] = 'o';
        }
      }
      // down left
      withinTheBoard(index + row - 1);
      if (isWithinTheBoard) {
        if (index + row - 1 == 63 ||
            index + row - 1 == 55 ||
            index + row - 1 == 47 ||
            index + row - 1 == 39 ||
            index + row - 1 == 31 ||
            index + row - 1 == 23 ||
            index + row - 1 == 15 ||
            index + row - 1 == 7) {
          // do nothing
        } else if (pieces[index + row - 1][1] != 'x') {
          if (pieces[index + row - 1][2] != pieces[index][2]) {
            pieces[index + row - 1][4] = 'k';
          }
        } else {
          pieces[index + row - 1][1] = 'o';
        }
      }
      // right
      withinTheBoard(index + 1);
      if (isWithinTheBoard) {
        if (pieces[index + 1][1] != 'x') {
          if (pieces[index + 1][2] != pieces[index][2]) {
            pieces[index + 1][4] = 'k';
          }
        } else {
          pieces[index + 1][1] = 'o';
        }
      }
      // left
      withinTheBoard(index - 1);
      if (isWithinTheBoard) {
        if (pieces[index - 1][1] != 'x') {
          if (pieces[index - 1][2] != pieces[index][2]) {
            pieces[index - 1][4] = 'k';
          }
        } else {
          pieces[index - 1][1] = 'o';
        }
      }
    });
  }

  // returns true if a given index is between 0 ~ 63
  void withinTheBoard(int index) {
    setState(() {
      int rowSelected = 0;
      int colSelected = 0;
      int rowTested = 0;
      int colTested = 0;
      if (index >= 0 && index <= 63) {
        if (indexOfCurrentSelectedPiece != -1) {
          for (int rowC = 0; rowC < 8; rowC++) {
            for (int colC = 0; colC < 8; colC++) {
              if (indexOfCurrentSelectedPiece == (rowC * row + colC)) {
                rowSelected = rowC;
                colSelected = colC;
              }
            }
          }
          for (int rowC = 0; rowC < 8; rowC++) {
            for (int colC = 0; colC < 8; colC++) {
              if (index == (rowC * row + colC)) {
                rowTested = rowC;
                colTested = colC;
              }
            }
          }
          if (colTested - colSelected != 0 &&
              rowTested != rowSelected &&
              (rowTested - rowSelected).abs() !=
                  (colTested - colSelected).abs() &&
              pieces[indexOfCurrentSelectedPiece][1] != 'knight') {
            isWithinTheBoard = false;
          } else if ((colTested - colSelected).abs() > 6 &&
              rowTested != rowSelected) {
            isWithinTheBoard = false;
          } else {
            isWithinTheBoard = true;
          }
        } else {
          isWithinTheBoard = false;
        }
      } else {
        isWithinTheBoard = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 16,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    return Container(
                      child: deadBlackPieces[index] == ''
                          ? Container()
                          : Image.asset(
                              'lib/images/${deadBlackPieces[index]}black.png'),
                    );
                  }),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 3.0,
                  ),
                  itemCount: 64,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => tappedPiece(index),
                      child: Container(
                        color: pieces[index][1] == 'o'
                            ? Colors.greenAccent
                            : pieces[index][4] == 'k'
                                ? Colors.redAccent[100]
                                : blackSquares[index] == index
                                    ? Colors.brown
                                    : Colors.white,
                        child: pieces[index][1] != 'x' &&
                                pieces[index][1] != 'o'
                            ? Image.asset(
                                'lib/images/${pieces[index][1]}${pieces[index][2]}.png')
                            : Container(),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 16,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    return Container(
                      child: deadWhitePieces[index] == ''
                          ? Container()
                          : Image.asset(
                              'lib/images/${deadWhitePieces[index]}white.png'),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
