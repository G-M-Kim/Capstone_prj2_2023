`timescale 1ns / 1ps
`define headerSize 1080
`define imageSize 512*512

module tb();
    
reg         clk;
reg         reset;
reg [7:0]   imgData;
reg [7:0]   color_pixel;
reg         imgDataValid;
wire        intr;
wire [7:0]  outData;
wire        outDataValid;
integer     file,file1,file2,file3,i;
integer     sentSize;
integer     receivedData=0;

initial begin
    clk = 1'b0;
    forever begin
        #5 clk = ~clk;
    end
end
 
 initial begin
    reset = 0;
    sentSize = 0;
    imgDataValid = 0;
    #100;
    reset = 1;
    #100;
    file = $fopen("gray_img.bmp","rb");
    file1 = $fopen("enhanced_img.bmp","wb");
    // file2 = $fopen("color_img.bmp","rb");
    file2 = $fopen("gray_img.bmp","rb");
    file3 = $fopen("image_DEC.h","w");

    for(i=0;i<`headerSize;i=i+1) begin
        $fscanf(file,"%c",imgData);
        $fscanf(file2,"%c",color_pixel);
        $fwrite(file1,"%c",color_pixel);
    end
    
    for(i=0;i<4*512;i=i+1) begin
        @(posedge clk);
        $fscanf(file,"%c",imgData);
        $fscanf(file2,"%c",color_pixel);
        $fwrite(file3,"%0d,",color_pixel);
        imgDataValid <= 1'b1;
    end
    
    sentSize = 4*512;
    @(posedge clk);
    imgDataValid <= 1'b0;
    while(sentSize < `imageSize) begin
        @(posedge intr);
        for(i=0;i<512;i=i+1) begin
            @(posedge clk);
            $fscanf(file,"%c",imgData);
            $fscanf(file2,"%c",color_pixel);
            $fwrite(file3,"%0d,",color_pixel);
            imgDataValid <= 1'b1;
        end
        @(posedge clk);
        imgDataValid <= 1'b0;
        sentSize = sentSize+512;
    end
    
    @(posedge clk);
    imgDataValid <= 1'b0;
    
    @(posedge intr);
    for(i=0;i<512;i=i+1) begin
        @(posedge clk);
        imgData <= 0;
        color_pixel <= 0;
        imgDataValid <= 1'b1;    
        $fwrite(file3,"%0d,",0);
    end

    @(posedge clk);
    imgDataValid <= 1'b0;

    @(posedge intr);
    for(i=0;i<512;i=i+1) begin
        @(posedge clk);
        imgData <= 0;
        color_pixel <= 0;
        imgDataValid <= 1'b1;    
        $fwrite(file3,"%0d,",0);
    end

    @(posedge clk);
    imgDataValid <= 1'b0;
    $fclose(file);
    $fclose(file2);
    $fclose(file3);
 end
 
 always @(posedge clk) begin
    if(outDataValid) begin
        $fwrite(file1,"%c",outData);
        receivedData = receivedData+1;
    end

    if(receivedData == `imageSize) begin
        $fclose(file1);
        $stop;
    end
 end
 
image_processing_top dut(
    .axi_clk(clk)               ,
    .axi_reset_n(reset)         ,
    //slave interface
    .i_data_valid(imgDataValid) ,
    .i_data(imgData)            ,
    .i_color(color_pixel)       ,
    .o_data_ready()             ,
    //master interface
    .o_data_valid(outDataValid) ,
    .o_data(outData)            ,
    .i_data_ready(1'b1)         ,
    //interrupt
    .o_intr(intr)
);     
    
endmodule