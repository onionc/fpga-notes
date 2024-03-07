// ���������ԣ�����棬���ڲ��Թ���

module calc_sample #(
    parameter NUM_FOR_200HZ = 60000 // 200Hz������12M/200=60000
)(
	input clk,
	input rst_n,
	
	// keyboard
    input [3:0] col,
    output  [3:0] row
 
); 
/*
// ���������
reg	[4:0] 	seg_data_1;		// seg1 �����Ҫ��ʾ������
reg	[4:0]	seg_data_2;		// seg2
reg	[4:0]	seg_data_3;		// seg3
reg	[4:0]	seg_data_4;		// seg4
reg	[4:0]	seg_data_5;		// seg5
reg	[4:0]	seg_data_6;		// seg6
reg	[4:0]	seg_data_7;		// seg7
reg	[4:0]	seg_data_8;		// seg8
reg	[7:0]	seg_data_en;	// ���������ʹ��[msb seg8 ~ lsb seg1]
reg	[7:0]	seg_dot_en;		// �����С����ʹ��
*/



// �������
wire [15:0] key_out;
wire [15:0] key_pulse;
keyboard #(
	.NUM_FOR_200HZ(NUM_FOR_200HZ)
)
keyboard_inst(
	.clk(clk),
	.rst_n(rst_n),
	.col(col),
    .row(row),
	.key_out(key_out),
    .key_pulse(key_pulse)
);

 
// ������״̬��ʵ��



// ״̬����
parameter S00 = 	9'b000000001; // ��ʼ��״̬
parameter S11 = 	9'b000000010; // �����һ����������1λ
parameter S12 = 	9'b000000100; // �����һ����������2λ
parameter S_OP = 	9'b000001000; // ���������
parameter S21 = 	9'b000010000; // ����ڶ�����������1λ
parameter S22 = 	9'b000100000; // ����ڶ�����������2λ
parameter S_EQ = 	9'b001000000; // ����Ⱥţ����м���
parameter S_ERR = 	9'b100000000; // ����״̬

reg [7:0] curr_st; // ��ǰ״̬
reg [7:0] next_st; // ��һ��״̬




reg [3:0] key_value; // ����ֵ
reg [3:0] key_value2; // ����ֵ
reg [3:0] key_value3; // ����ֵ


reg [3:0] v11; // ������1��1λ
reg [3:0] v12; // ������1��2λ
reg [3:0] v21; // ������2��1λ
reg [3:0] v22; // ������2��2λ
reg [3:0] op; // �����
reg [3:0] v111;



// ״̬����һ�Σ�ͬ��ʱ������״̬ת�ƣ��Լ����°���ֵ
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		curr_st <= S00;
	end
	else begin // ͨ���������ж���һ��״̬
		curr_st <= next_st;
	end
end

reg flag;
reg [15:0] key_pulse2;
reg [15:0] key_pulse3;
// ���°���ֵ
always@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		key_value <= 4'hf;
		key_value2<= 4'hf;
		key_pulse2 <= 16'h0000;
	end else begin
	/* ������̰�����������
		1 2 3 +
		4 5 6 -
		7 8 9 *
		0 C = /
		�Ѱ���ӳ�䵽��Щ�����ϣ�0~9 ��Ӧ h'0~9�������ķֱ��Ӧ a~f (+ - * / ��Ӧa b c d), f���������Ҳ��ֱ�Ӱ󶨸�λ����e �������=
	*/
	
		case(key_pulse)
			16'h0001: key_value <= 4'h1;  // 1
			16'h0002: key_value <= 4'h2;  // 2
			16'h0004: key_value <= 4'h3;  // 3
			16'h0008: key_value <= 4'ha;  // +
			16'h0010: key_value <= 4'h4;  // 4
			16'h0020: key_value <= 4'h5;  // 5
			16'h0040: key_value <= 4'h6;  // 6
			16'h0080: key_value <= 4'hb;  // -
			16'h0100: key_value <= 4'h7;  // 7
            16'h0200: key_value <= 4'h8;  // 8
			16'h0400: key_value <= 4'h9;  // 9
			16'h0800: key_value <= 4'hc;  // x
			16'h1000: key_value <= 4'h0;  // 0
			16'h2000: key_value <= 4'hf;  // C ��������ã� ��fҲ����Чֵ��
			16'h4000: key_value <= 4'he;  // =
			16'h8000: key_value <= 4'hd;  // /
			default:  key_value <= key_value;   //�ް�������ʱ����
		endcase

		// �޸�1

			key_pulse2 <= key_pulse;
			key_pulse3 <= key_pulse2;

	/*
		case(key_pulse)
			16'h0001: begin key_value <= 4'h1; key_value2 <= 4'h1; end // 1
			16'h0002: begin key_value <= 4'h2; key_value2 <= 4'h2;  end /// 2
			16'h0004: begin key_value <= 4'h3; key_value2 <= 4'h3;  end /// 3
			16'h0008: begin key_value <= 4'ha; key_value2 <= 4'ha;  end /// +
			16'h0010: begin key_value <= 4'h4; key_value2 <= 4'h4;  end /// 4
			16'h0020: begin key_value <= 4'h5;  end /// 5
			16'h0040: begin key_value <= 4'h6;  end /// 6
			16'h0080: begin key_value <= 4'hb;  end /// -
			16'h0100: begin key_value <= 4'h7;  end /// 7
            16'h0200: begin key_value <= 4'h8;  end /// 8
			16'h0400: begin key_value <= 4'h9;  end /// 9
			16'h0800: begin key_value <= 4'hc;  end /// x
			16'h1000: begin key_value <= 4'h0;  end /// 0
			16'h2000: begin key_value <= 4'hf;  end /// C ��������ã� ��fҲ����Чֵ��
			16'h4000: begin key_value <= 4'he;  end /// =
			16'h8000: begin key_value <= 4'hd;  end /// /
			default:  begin key_value <= key_value;   end ///�ް�������ʱ����
		endcase
		//v111 <= key_value;
		*/
		

	end
end

// ״̬���ڶ��Σ�ʹ�ð���ֵ�ж���һ��״̬��״̬ת�ƣ�
always @(*) begin
//next_st <=  curr_st;
	case(curr_st)
		S00: begin // ֻ�����������֣���һ�����ֵĵ�һλ
			if((key_value < 4'ha) && (key_pulse2>0) ) begin
				
				//key_value2 = 4'h2;
				//v11 <= key_value;
				//v111 = 5'd2;
				next_st = S11;
			end else 
				next_st = S00;
		end
		S11: begin  // �����������ֵڶ�λ���������
			if((key_value < 4'ha) && (key_pulse2>0) ) begin
				
				//v12 = key_value;
				next_st = S12;
			end else if((key_value >= 4'ha) && (key_value <= 4'hd) && (key_pulse2>0)  ) begin
				next_st = S_OP;
				//op = key_value;
			end else 
				next_st = S11;

		end

		S12: begin // ֻ�������������
			if((key_value >= 4'ha) && (key_value <= 4'hd) && (key_pulse2>0)) begin
				next_st = S_OP;
			end else 
				next_st = S12;
		end

		S_OP: begin // ��������ڶ����ֵĵ�һλ
		  	if((key_value < 4'ha) && (key_pulse2>0)) begin
				next_st = S21;
			end else 
				next_st = S_OP;
		end

		S21: begin  // �����������ֵڶ�λ���ߵȺ�
			if((key_value < 4'ha) && (key_pulse2>0)) begin
				next_st = S22;
			end else if((key_value == 4'he) && (key_pulse2>0)) begin
				next_st = S_EQ;
			end else 
				next_st = S21;
		end

		S22: begin  // ֻ��������Ⱥ�
			if((key_value == 4'he) && (key_pulse2>0)) begin
				next_st = S_EQ;
			end else 
				next_st = S22;
		end

		S_EQ: begin // �ȴ�����
			next_st = S00;
		end

		S_ERR: begin
			next_st = S_ERR;
		end

		default:
			next_st = S00;
	endcase
end

reg [4:0] seg_data_1;
reg [4:0] seg_data_2;
reg [4:0] seg_data_3;
reg [4:0] seg_data_4;
reg [4:0] seg_data_5;
reg [4:0] seg_data_6;
reg [4:0] seg_data_7;
reg [4:0] seg_data_8;

// ״̬�������Σ�����״̬���
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin


		seg_data_1 <= 5'd16; // 16����������ÿ�
		
	end else begin

		if(next_st == S11) begin

			seg_data_1 <= key_value;
			

		end else if(next_st == S12) begin
			seg_data_2 <= key_value;
		end else if(next_st == S_OP) begin
			op <= key_value;
			case(op)
				4'ha: begin // +
					seg_data_4 <= 5'd10;
					//seg_data_5 <= 5'd11;
					seg_data_5 <= 5'd12;
				end
				4'hb: begin // -
					seg_data_4 <= 5'd12;
					seg_data_5 <= 5'd16;
				end
				4'hc: begin // *
					seg_data_4 <= 5'd13;
					seg_data_5 <= 5'd16;
				end
				4'hd: begin
					seg_data_4 <= 5'd14;
					seg_data_5 <= 5'd16;
				end
				default: begin
					seg_data_4 <= 5'd15;
					seg_data_5 <= 5'd15;
				end
			endcase
		end else if(next_st == S21) begin
			seg_data_6 <= key_value;
			
		end else if(next_st == S22) begin
			seg_data_7 <= key_value;

			
		end else if(next_st == S_EQ) begin
			seg_data_8 <= 5'd18;
			seg_data_8 <= 5'd18;
		end else if(next_st == S_ERR) begin
			// ERR
			seg_data_6 <= 5'd15;
			seg_data_7 <= 5'd17;
			seg_data_8 <= 5'd17;
		end
			
	end

end

endmodule