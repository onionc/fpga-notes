// �������

module keyboard
#(
    parameter NUM_FOR_200HZ = 60000 // 200Hz������12M/200=60000
)
(
    input               clk,
    input               rst_n,
    input       [3:0]   col,
    output  reg [3:0]   row,
    output  reg [15:0]   key_out,
    output   [15:0]  key_pulse
); 

    // ����״̬
    localparam STATE0 = 2'b00;
    localparam STATE1 = 2'b01;
    localparam STATE2 = 2'b10;
    localparam STATE3 = 2'b11;

    // ��������Ƶ
    reg     [15:0]  cnt;
    reg     clk_200hz;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            cnt <= 16'b0;
            clk_200hz <= 1'b0;
        end else begin
            // ��2����clk_200hz��ռ�ձ�50%
            if(cnt >= ((NUM_FOR_200HZ>>1)-1)) begin
                cnt <= 16'd0;
                clk_200hz <= ~clk_200hz;
            end else begin
                cnt <= cnt + 1'b1;
                clk_200hz <= clk_200hz;
            end
        end
    end

    // ״̬ת��
    reg     [1:0]   c_state;
    always @(posedge clk_200hz or negedge rst_n) begin
        if(!rst_n) begin
            c_state <= STATE0;
            row <= 4'b1110;
        end else begin
            case(c_state)
                STATE0:  begin c_state <= STATE1; row <= 4'b1101; end
                STATE1:  begin c_state <= STATE2; row <= 4'b1011; end
                STATE2:  begin c_state <= STATE3; row <= 4'b0111; end
                STATE3:  begin c_state <= STATE0; row <= 4'b1110; end
                default: begin c_state <= STATE0; row <= 4'b1110; end
            endcase
        end
    end

    // ����״̬���
    reg [15:0] key_1;
	reg [15:0] key_2;
    always @(posedge clk_200hz or negedge rst_n) begin
        if(!rst_n) begin
            key_out <= 16'hffff;
			key_1 <= 16'hffff;
			key_2 <= 16'hffff;
        end else begin
            /*
            // �����ļ���״̬����
            case(c_state)  
                STATE0:  key_out[3:0]   <= col;
                STATE1:  key_out[7:4]   <= col;
                STATE2:  key_out[11:8]  <= col;
                STATE3:  key_out[15:12] <= col;
                default: key_out        <= 16'hffff; 
            endcase
            */
            
            // ���������ļ���״̬����
            case(c_state)  
                STATE0:  begin
                    key_1[3:0] <= col; // ������̲���
                    key_2[3:0] <= key_1[3:0]; // ������������
                    key_out[3:0]   <= key_2[3:0] | key_1[3:0]; // ���β����ж�
                end
                STATE1:  begin
                    key_1[7:4] <= col;
                    key_2[7:4] <= key_1[7:4];
                    key_out[7:4]   <= key_2[7:4] | key_1[7:4];
                end
                STATE2:  begin
                    key_1[11:8] <= col;
                    key_2[11:8] <= key_1[11:8];
                    key_out[11:8]   <= key_2[11:8] | key_1[11:8];
                end
                STATE3:  begin
                    key_1[15:12] <= col;
                    key_2[15:12] <= key_1[15:12];
                    key_out[15:12]   <= key_2[15:12] | key_1[15:12];
                end

                default: key_out <= 16'hffff; 
            endcase

        end
    end

    // ������תΪһ������
    reg		[15:0]		key_out_r;
	//Register low_sw_r, lock low_sw to next clk
	always @ ( posedge clk  or  negedge rst_n )
		if (!rst_n) key_out_r <= 16'hffff;
		else  key_out_r <= key_out;   //��ǰһ�̵�ֵ�ӳ�����
	
	//wire	[15:0]		 key_pulse;
	//Detect the negedge of low_sw, generate pulse
	assign key_pulse= key_out_r & ( ~key_out); 
endmodule