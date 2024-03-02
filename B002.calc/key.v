// �������ܣ�����

/*
 * led��0��1��
 * key1������Ϊ0
*/

module key(
    input clk,
    input rst_n,
    input key1,
    output reg led0
);

// ϵͳʱ�� 50M��һ��ʱ��������20ns
// ����ʱ�� 20ms = 20_000_000 / 20 = 1_000_000����
parameter CNT_MAX = 20'd1_000_000;
//parameter CNT_MAX = 20'd200;

reg [19:0] cnt;
reg key_d0; // �������ź��ӳ�һ��ʱ������
reg key_d1; // �������ź��ӳ�����ʱ������
reg key_flag; // ����״̬

// �ӳ�1��2����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        key_d0 <= 1'b1;
        key_d1 <= 1'b1;
    end
    else begin
        key_d0 <= key1;
        key_d1 <= key_d0;
    end
end

// ����ֵ����
/* �ۼ��͵ģ��������⣬�ڱ���һ��ʱ����һֱ����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= 20'd0;
    else if(key_d1 != key_d0) // ���������仯
            cnt <= 20'd0;
    else begin
        // ������ǰһ��ʱ��һ�������������ʼ����
        cnt <= cnt + 1'b1;
    end
end
*/
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt <= 20'd0;
    else if(key_d1 != key_d0) // ���������仯
        cnt <= CNT_MAX;
    else //������ǰһ��ʱ��һ�������������ʼ�ݼ��� 0
        cnt <= (cnt>20'd0) ? (cnt-1'b1) : 20'd0;
end

reg key_flag2; // ����״̬�仯��key_flag2 �� key_flag��һ������
// �������ֵ
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        key_flag <= 1'b0;
        key_flag2 <= 1'b0;
    end
    else if(cnt == 20'd1) begin
        key_flag <= key_d1;
        key_flag2 <= key_flag;
    end
    else begin
        key_flag <= key_flag;
        key_flag2 <= key_flag;
    end
end


// ����ʱ����LED
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) 
        led0 <= 1'b1;
    else if(key_flag!=key_flag2) begin
        if(key_flag==1'b0) // �½��أ�����
            led0 <= ~led0;
    end
end


endmodule