`timescale 1ns/1ns

module tb_led();

reg key2;
wire led2;

initial begin
  key2 <= 1'b0; // ����Ĭ�ϵ͵�ƽ

  #200
  key2 <= 1'b0;
  #1000
  key2 <= 1'b1;
  #600
  key2 <= 1'b0;
  #1000
  key2 <= 1'b1;
end

// ����
led test_led(
    .keyx(key2),
    .ledx(led2)
);

endmodule