class Chessboard;
  rand bit board[8][8];

  constraint pattern {
    foreach (board[i, j])
      board[i][j] == (i + j) % 2;
  }
endclass

module tb;
   Chessboard cb;
  initial begin
   cb = new();
    cb.randomize();
    begin
      for (int i = 0; i < 8; i++) begin
        for (int j = 0; j < 8; j++) begin
          $write("%s ", cb.board[i][j] ? "B" : "W");
        end
        $display();
      end
    end
  end
endmodule

