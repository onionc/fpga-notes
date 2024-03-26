// ����������

module calc #(
    parameter NUM_FOR_200HZ = 60000 // 200Hz������12M/200=60000
)(
    input clk,
    input rst_n,
    
    // �����
    output rclk_out, // 74HC595 �� RCK �ܽ�	
    output sclk_out, // 74HC595 �� SCK �ܽ�
    output sdio_out,  // 74HC595 �� SER �ܽ�
    
    // keyboard
    input [3:0] col,
    output  [3:0] row
 
); 

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




// �������
wire [15:0] key_out;
wire [15:0] key_pulse;
keyboard keyboard_inst(
    .clk(clk),
    .rst_n(rst_n),
    .col(col),
    .row(row),
    .key_out(key_out),
    .key_pulse(key_pulse)
);

// �����
led_segment inst(
    .clk(clk),
    .rst_n(rst_n),
    .seg_data_1(seg_data_1),
    .seg_data_2(seg_data_2),
    .seg_data_3(seg_data_3),
    .seg_data_4(seg_data_4),
    .seg_data_5(seg_data_5),
    .seg_data_6(seg_data_6),
    .seg_data_7(seg_data_7),
    .seg_data_8(seg_data_8),
    .seg_data_en(seg_data_en),
    .seg_dot_en(seg_dot_en),
    .rclk_out(rclk_out),
    .sclk_out(sclk_out),
    .sdio_out(sdio_out)
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


reg [3:0] v11; // ������1�ĸ�λ
reg [3:0] v12; // ������1��ʮλ
reg [3:0] v21; // ������2�ĸ�λ
reg [3:0] v22; // ������2��ʮλ
reg [3:0] op; // �����

wire [7:0] v1; // ������1
wire [7:0] v2; // ������2


reg [15:0] v_res; // ��������֧��16λ
// ����󽫽���ٲ��
wire [3:0] v_r1; // ��λ
wire [3:0] v_r2; // ʮλ
wire [3:0] v_r3; // ��λ
wire [3:0] v_r4; // ǧλ
wire neg, neg2, neg3, neg4; // ����

reg [7:0] v_res2; // ����
wire [15:0] v_res_mul; // �˷��Ľ��
wire [7:0] Q; // �����������
wire [7:0] R; // �������������
reg [7:0] v_r_res; // ������������չ����10����ȥ����С������
wire [7:0] Q2; // �����������2
wire [7:0] R2; // �������������2

// ��ֵ�2��
reg [7:0] v_split;
wire [3:0] v_split_r1, v_split_r2, v_split_r3, v_split_r4;


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
        key_value <= 4'h0;
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
            16'h2000: key_value <= 4'hf;  // C ��������ã� 
            16'h4000: key_value <= 4'he;  // =
            16'h8000: key_value <= 4'hd;  // /
            default:  key_value <= key_value;   //�ް�������ʱ����
        endcase
        
        key_pulse2 <= key_pulse; // �ӳ�һ�ģ�������߼���ʹ��
    end
end

// ״̬���ڶ��Σ�ʹ�ð���ֵ�ж���һ��״̬��״̬ת�ƣ�

always @(*) begin
    next_st =  curr_st; // �������������else�и�ֵ

    if((key_value == 4'hf) && (key_pulse2>0) ) begin // ��λ
        next_st = S00;
    end else
    case(next_st)
        S00: begin // ֻ�����������֣���һ�����ֵĵ�һλ
            if((key_value < 4'ha) && (key_pulse2>0) ) begin
                
                next_st = S11;
            end
        end
        S11: begin  // �����������ֵڶ�λ���������
            if((key_value < 4'ha) && (key_pulse2>0) ) begin
                next_st = S12;
            end else if((key_value >= 4'ha) && (key_value <= 4'hd) && (key_pulse2>0)  ) begin
                next_st = S_OP;
            end 

        end

        S12: begin // ֻ�������������
            if((key_value >= 4'ha) && (key_value <= 4'hd) && (key_pulse2>0)) begin
                next_st = S_OP;
            end 
        end

        S_OP: begin // ��������ڶ����ֵĵ�һλ
              if((key_value < 4'ha) && (key_pulse2>0)) begin
                next_st = S21;
            end 
        end

        S21: begin  // �����������ֵڶ�λ���ߵȺ�
            if((key_value < 4'ha) && (key_pulse2>0)) begin
                next_st = S22;
            end else if((key_value == 4'he) && (key_pulse2>0)) begin
                next_st = S_EQ;
            end 
        end

        S22: begin  // ֻ��������Ⱥ�
            if((key_value == 4'he) && (key_pulse2>0)) begin
                next_st = S_EQ;
            end 
        end

        S_EQ: begin // �ȴ�����
            //next_st = S00;
        end

        S_ERR: begin
            next_st = S_ERR;
        end

        default:
            next_st = S00;
    endcase
end



// ״̬�������Σ�����״̬���
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin


        seg_data_1 <= 5'd16; // 16����������ÿ�
        seg_data_2 <= 5'd16;
        seg_data_3 <= 5'd16;
        seg_data_4 <= 5'd16;
        seg_data_5 <= 5'd16;
        seg_data_6 <= 5'd16;
        seg_data_7 <= 5'd16;
        seg_data_8 <= 5'd16;
        
        seg_data_en <= 8'hff; // �����������Ч
        seg_dot_en <= 8'h00;
    end else begin
        if(next_st == S00 ) begin // ��λ
            seg_data_1 <= 5'd16; // 16����������ÿ�
            seg_data_2 <= 5'd16;
            seg_data_3 <= 5'd16;
            seg_data_4 <= 5'd16;
            seg_data_5 <= 5'd16;
            seg_data_6 <= 5'd16;
            seg_data_7 <= 5'd16;
            seg_data_8 <= 5'd16;
        
            seg_data_en <= 8'hff; // �����������Ч
            seg_dot_en <= 8'h00;
        end else if(next_st == S11) begin
            
            if(key_value < 4'ha) begin // Ϊ������S11ʱ���������������⣬���ﻹ���ж�һ��
                
                v11 <= key_value;
                v12 <= 4'h0; // v12 ʮλ��ֵΪ0

                seg_data_1 <= 4'h0;
                seg_data_2 <= key_value;

                // �����������
                seg_data_3 <= 5'd16;
                seg_data_4 <= 5'd16;
                seg_data_5 <= 5'd16;
                seg_data_6 <= 5'd16;
                seg_data_7 <= 5'd16;
                seg_data_8 <= 5'd16;
            end
            

        end else if(next_st == S12) begin
            if(key_value < 4'ha && v12==4'h0) begin // ��v12��ֵ��ʹ������߼�ֻ����һ�Σ��������ж�Σ���Ȼv11==v12
                v12 <= v11; // �ȰѸ�λ��ֵ��ʮλ
                v11 <= key_value; // �ٰ���ֵ������λ

                seg_data_1 <= v11;
                seg_data_2 <= key_value;
            end
        end else if(next_st == S_OP) begin
            if((key_value >= 4'ha) && (key_value <= 4'hd)) begin
                op <= key_value;

                // ������3���������ʾ���ţ�����ʱҲ��Ϊ�գ���Ȼ���ܻ�����һ�ε�ֵ
                case(op)
                    4'ha: begin // +
                        seg_data_3 <= 5'd16;
                        seg_data_4 <= 5'd10;
                        //seg_data_5 <= 5'd11;
                        seg_data_5 <= 5'd12;
                    end
                    4'hb: begin // -
                        seg_data_3 <= 5'd16;
                        seg_data_4 <= 5'd12;
                        seg_data_5 <= 5'd16;
                    end
                    4'hc: begin // *
                        seg_data_3 <= 5'd16;
                        seg_data_4 <= 5'd13;
                        seg_data_5 <= 5'd16;
                    end
                    4'hd: begin // /
                        seg_data_3 <= 5'd12;
                        seg_data_4 <= 5'd14;
                        seg_data_5 <= 5'd12;
                    end
                    default: begin
                        seg_data_3 <= 5'd16;
                        seg_data_4 <= 5'd15;
                        seg_data_5 <= 5'd15;
                    end
                endcase
            end
        end else if(next_st == S21) begin
            if(key_value < 4'ha) begin
                v21 <= key_value;
                v22 <= 4'h0;

                seg_data_6 <= 4'h0;
                seg_data_7 <= key_value;

            end
        end else if(next_st == S22) begin
            if(key_value < 4'ha && v22==4'h0) begin
                v22 <= v21; // �ȰѸ�λ��ֵ��ʮλ
                v21 <= key_value; // �ٰ���ֵ������λ

                seg_data_6 <= v21;
                seg_data_7 <= key_value;
            end
        end else if(next_st == S_EQ) begin
            if(key_value == 4'he) begin
                // �Ⱥ��Լ��������õ�λ
                seg_data_1 <= 5'd18; // �Ⱥ�
                seg_data_2 <= 5'd16; // -��
                seg_data_3 <= 5'd16; // ��ֵǧλ
                seg_data_4 <= 5'd16; // ��ֵ��λ
                seg_data_5 <= 5'd16; // ��ֵʮλ
                seg_data_6 <= 5'd16; // ��ֵ��λ
                seg_data_7 <= 5'd16; // С��
                seg_data_8 <= 5'd16;


                // ����
                case(op)
                    4'ha: begin
                        // �򵥼ӷ���û�п��Ǹ���
                        /*
                        v_res2 <= v1 + v2;
                        if(v_res2>8'd100)  // ����100�������
                            v_res <= v_res2-8'd100;
                        else
                            v_res <= v_res2;
                        */
                        v_res <= v1 + v2;    
                        seg_data_3 <= {0'b0, v_r4};
                        seg_data_4 <= {0'b0, v_r3};
                        seg_data_5 <= {0'b0, v_r2};
                        seg_data_6 <= {0'b0, v_r1};
                    end
                    
                    4'hb: begin 
                        // �򵥼���
                        v_res <= v1 - v2;

                        if(neg == 1'b1)
                            seg_data_2 <= 5'd12;
                        else 
                            seg_data_2 <= 5'd16;
                        seg_data_3 <= {0'b0, v_r4};
                        seg_data_4 <= {0'b0, v_r3};
                        seg_data_5 <= {0'b0, v_r2};
                        seg_data_6 <= {0'b0, v_r1};
                    end
                    4'hc: begin
                        // �˷���Ҳ��֧�ֽ������8λֵ������ʾʮ������λ���ľ��ȣ���Ȼ������չ�����Լ���ֺ�ƴ�Ӳ���
                        /*
                        if(v_res_mul>8'd100)  // ����100�������
                            v_res <= v_res_mul[7:0]; // ����ԭ�򣬱����ضϣ�������ʾ����ֵ��������
                        else
                            v_res <= v_res2;
                        
                        v_res <= v_res_mul[7:0];
                        */
                        v_res <= v_res_mul;
                        seg_data_3 <= {0'b0, v_r4};
                        seg_data_4 <= {0'b0, v_r3};
                        seg_data_5 <= {0'b0, v_r2};
                        seg_data_6 <= {0'b0, v_r1};

                    end
                    4'hd: begin
                        // ����
                        //seg_data_2 <= 5'd16;

                        // �̵���ʾ
                        v_res <= Q;
                        seg_data_3 <= {0'b0, v_r4};
                        seg_data_4 <= {0'b0, v_r3};
                        seg_data_5 <= {0'b0, v_r2};
                        seg_data_6 <= {0'b0, v_r1};

                        // С����λ��
                        seg_dot_en <= 8'h20;

                        // ͨ������������С������
                        v_r_res <= {1'b0, R[3:0], 3'b0} + R[3:0] + R[3:0];
                        v_split <= Q2;
                        seg_data_7 <= {0'b0, v_split_r1};


                    end
                    
                    default:
                        v_res <= 32'd0;
                endcase


            end
        end else if(next_st == S_ERR) begin
            // ERR
            seg_data_6 <= 5'd15;
            seg_data_7 <= 5'd17;
            seg_data_8 <= 5'd17;
        end
            
    end

end

// ƴ��
num_join num_join_inst1(
    .tens(v12),
    .ones(v11),
    .vout(v1) 
);
num_join num_join_inst2(
    .tens(v22),
    .ones(v21),
    .vout(v2) 
);

// �ٲ��
num_split num_split_inst1(
    .v(v_res),
    .thd(v_r4),
    .hud(v_r3),
    .ten(v_r2),
    .one(v_r1),
    .neg(neg)
);

// �˷�
calc_mul calc_mul_inst1(
    .A(v1),
    .B(v2),
    .out(v_res_mul)
);

// ����
calc_div calc_div_inst1(
    .A(v1),
    .B(v2),
    .Q(Q),
    .R(R),
    .neg(neg2)
);
calc_div calc_div_inst2( // ͨ����������С��
    .A(v_r_res),
    .B(v2),
    .Q(Q2),
    .R(R2),
    .neg(neg3)
);
num_split num_split_inst2(
    .v(v_split),
    .thd(v_split_r4),
    .hud(v_split_r3),
    .ten(v_split_r2),
    .one(v_split_r1),
    .neg(neg4)
);


endmodule