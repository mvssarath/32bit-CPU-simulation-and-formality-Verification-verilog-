// Copyright (c) 2008-2014 Illinois Institute of Technology
//               All rights reserved.
// Author:       Jia Wang, jwang@ece.iit,edu

// Basic circuit elements

module decoder2to4(in, out, en);
   
   output [3:0] out;
   input [1:0] 	in;
   input 	en;
   
   wire [1:0] 	nn;
   
   not(nn[0], in[0]);
   not(nn[1], in[1]);
   
   and(out[0], nn[1], nn[0], en);
   and(out[1], nn[1], in[0], en);
   and(out[2], in[1], nn[0], en);
   and(out[3], in[1], in[0], en);

endmodule // decoder2to4


module decoder3to8(in, out, en);
   
   output [7:0] out;
   input [2:0] 	in;
   input 	en;
   
   wire 	nn2, en0, en1;
   
   not(nn2, in[2]);
   and(en0, nn2, en);
   and(en1, in[2], en);
   
   decoder2to4 d0(in[1:0], out[3:0], en0);
   decoder2to4 d1(in[1:0], out[7:4], en1);
   
endmodule // decoder3to8


module decoder4to16(in, out, en);

   output [15:0] out;
   input [3:0] 	 in;
   input 	 en;
   
   wire 	 nn3, en0, en1;
   
   not(nn3, in[3]);
   and(en0, nn3, en);
   and(en1, in[3], en);
   
   decoder3to8 d0(in[2:0], out[7:0], en0);
   decoder3to8 d1(in[2:0], out[15:8], en1);
   
endmodule // decoder4to16

//module decoder5to32(in,out,en);

  // output [31:0] out;
   //input [4:0] 	 in;
   //input 	 en;
   
 //  wire       nn4, en0, en1;
   
  // not(nn4, in[4]);
  // and(en0, nn4, en);
 //  and(en1, in[4], en);
   
   //decoder4to16 d0(in[3:0], out[15:0], en0);
   //decoder4to16 d1(in[3:0], out[31:16], en1);
   //
//endmodule  //decoder5to32


module tris(in, sel, out);
   
   output out;
   input  in, sel;
   tri 	  out;
   
   bufif1 b1(out, in, sel);
   
endmodule // tris


module tris_32(in, sel, out);
   
   output [31:0] out;
   input [31:0] 	in;
   input 	sel;
   
   tris t0(in[0], sel, out[0]);
   tris t1(in[1], sel, out[1]);
   tris t2(in[2], sel, out[2]);
   tris t3(in[3], sel, out[3]);
   tris t4(in[4], sel, out[4]);
   tris t5(in[5], sel, out[5]);
   tris t6(in[6], sel, out[6]);
   tris t7(in[7], sel, out[7]);
	tris t8(in[8], sel, out[8]);
   tris t9(in[9], sel, out[9]);
   tris t10(in[10], sel, out[10]);
   tris t11(in[11], sel, out[11]);
   tris t12(in[12], sel, out[12]);
   tris t13(in[13], sel, out[13]);
   tris t14(in[14], sel, out[14]);
   tris t15(in[15], sel, out[15]);
	tris t16(in[16], sel, out[16]);
   tris t17(in[17], sel, out[17]);
   tris t18(in[18], sel, out[18]);
   tris t19(in[19], sel, out[19]);
   tris t20(in[20], sel, out[20]);
   tris t21(in[21], sel, out[21]);
   tris t22(in[22], sel, out[22]);
   tris t23(in[23], sel, out[23]);
	tris t24(in[24], sel, out[24]);
   tris t25(in[25], sel, out[25]);
   tris t26(in[26], sel, out[26]);
   tris t27(in[27], sel, out[27]);
   tris t28(in[28], sel, out[28]);
   tris t29(in[29], sel, out[29]);
   tris t30(in[30], sel, out[30]);
   tris t31(in[31], sel, out[31]);
   
endmodule // tris_31


module dff(d, clk, q);
   
   output q;
   input  d, clk;
   reg 	  q;
   
   always @(posedge clk)
     q <= d;
   
endmodule // dff

module dff_8(d, clk, q);
   
   output [7:0] q;
   input [7:0] 	d;
   input 	clk;	
   
   dff d0(d[0], clk, q[0]);
   dff d1(d[1], clk, q[1]);
   dff d2(d[2], clk, q[2]);
   dff d3(d[3], clk, q[3]);
   dff d4(d[4], clk, q[4]);
   dff d5(d[5], clk, q[5]);
   dff d6(d[6], clk, q[6]);
   dff d7(d[7], clk, q[7]);
   
endmodule // dff_8


module dff_32(d, clk, q);
   
   output [31:0] q;
   input [31:0] 	d;
   input 	clk;	
   
   dff d0(d[0], clk, q[0]);
   dff d1(d[1], clk, q[1]);
   dff d2(d[2], clk, q[2]);
   dff d3(d[3], clk, q[3]);
   dff d4(d[4], clk, q[4]);
   dff d5(d[5], clk, q[5]);
   dff d6(d[6], clk, q[6]);
   dff d7(d[7], clk, q[7]);
   dff d8(d[8], clk, q[8]);
   dff d9(d[9], clk, q[9]);
   dff d10(d[10], clk, q[10]);
   dff d11(d[11], clk, q[11]);
   dff d12(d[12], clk, q[12]);
   dff d13(d[13], clk, q[13]);
   dff d14(d[14], clk, q[14]);
   dff d15(d[15], clk, q[15]);
   dff d16(d[16], clk, q[16]);
   dff d17(d[17], clk, q[17]);
   dff d18(d[18], clk, q[18]);
   dff d19(d[19], clk, q[19]);
   dff d20(d[20], clk, q[20]);
   dff d21(d[21], clk, q[21]);
   dff d22(d[22], clk, q[22]);
   dff d23(d[23], clk, q[23]);
   dff d24(d[24], clk, q[24]);
   dff d25(d[25], clk, q[25]);
   dff d26(d[26], clk, q[26]);
   dff d27(d[27], clk, q[27]);
   dff d28(d[28], clk, q[28]);
   dff d29(d[29], clk, q[29]);
   dff d30(d[30], clk, q[30]);
   dff d31(d[31], clk, q[31]);   
endmodule // dff_8


module mux2to1(in0, in1, sel, out);
   
   output out;
   input  in0, in1, sel;
   
   wire   nsel, n0, n1;
   
   not(nsel, sel);
   
   and(n0, nsel, in0);
   and(n1, sel, in1);
   
   or(out, n0, n1);
   
endmodule // mux2to1

module mux2to1_8(in0, in1, sel, out);

   output [7:0] out;
   input [7:0] 	in0, in1;
   input 	sel;

   mux2to1 m0(in0[0], in1[0], sel, out[0]);
   mux2to1 m1(in0[1], in1[1], sel, out[1]);
   mux2to1 m2(in0[2], in1[2], sel, out[2]);
   mux2to1 m3(in0[3], in1[3], sel, out[3]);
   mux2to1 m4(in0[4], in1[4], sel, out[4]);
   mux2to1 m5(in0[5], in1[5], sel, out[5]);
   mux2to1 m6(in0[6], in1[6], sel, out[6]);
   mux2to1 m7(in0[7], in1[7], sel, out[7]);
   
endmodule // mux2to1_8

module mux2to1_32(in0, in1, sel, out);

   output [31:0] out;
   input [31:0] 	in0, in1;
   input 	sel;

   mux2to1 m0(in0[0], in1[0], sel, out[0]);
   mux2to1 m1(in0[1], in1[1], sel, out[1]);
   mux2to1 m2(in0[2], in1[2], sel, out[2]);
   mux2to1 m3(in0[3], in1[3], sel, out[3]);
   mux2to1 m4(in0[4], in1[4], sel, out[4]);
   mux2to1 m5(in0[5], in1[5], sel, out[5]);
   mux2to1 m6(in0[6], in1[6], sel, out[6]);
   mux2to1 m7(in0[7], in1[7], sel, out[7]);
   mux2to1 m8(in0[8], in1[8], sel, out[8]);
   mux2to1 m9(in0[9], in1[9], sel, out[9]);
   mux2to1 m10(in0[10], in1[10], sel, out[10]);
   mux2to1 m11(in0[11], in1[11], sel, out[11]);
   mux2to1 m12(in0[12], in1[12], sel, out[12]);
   mux2to1 m13(in0[13], in1[13], sel, out[13]);
   mux2to1 m14(in0[14], in1[14], sel, out[14]);
   mux2to1 m15(in0[15], in1[15], sel, out[15]);
   mux2to1 m16(in0[16], in1[16], sel, out[16]);
   mux2to1 m17(in0[17], in1[17], sel, out[17]);
   mux2to1 m18(in0[18], in1[18], sel, out[18]);
   mux2to1 m19(in0[19], in1[19], sel, out[19]);
   mux2to1 m20(in0[20], in1[20], sel, out[20]);
   mux2to1 m21(in0[21], in1[21], sel, out[21]);
   mux2to1 m22(in0[22], in1[22], sel, out[22]);
   mux2to1 m23(in0[23], in1[23], sel, out[23]);
   mux2to1 m24(in0[24], in1[24], sel, out[24]);
   mux2to1 m25(in0[25], in1[25], sel, out[25]);
   mux2to1 m26(in0[26], in1[26], sel, out[26]);
   mux2to1 m27(in0[27], in1[27], sel, out[27]);
   mux2to1 m28(in0[28], in1[28], sel, out[28]);
   mux2to1 m29(in0[29], in1[29], sel, out[29]);
   mux2to1 m30(in0[30], in1[30], sel, out[30]);
   mux2to1 m31(in0[31], in1[31], sel, out[31]);
   
endmodule // mux2to1_32


module memory_32(port_a, sel_a, port_b, sel_b, port_s, write_en, clk);
   
   output [31:0] port_a, port_b;
   input 	sel_a, sel_b, write_en, clk;
   input [31:0] 	port_s;
   
   wire [31:0] 	dout, mux_out;
   
   mux2to1_32 m0(dout, port_s, write_en, mux_out);
   
   dff_32 d(mux_out, clk, dout);
   
   tris_32 ta(dout, sel_a, port_a);
   tris_32 tb(dout, sel_b, port_b);
   
endmodule // memory_8


module memory16_32(port_a, addr_a, port_b, addr_b, port_s, addr_s, write_en, clk);
   
   output [31:0] port_a, port_b;
   input [3:0] 	addr_a, addr_b, addr_s;
   input 	write_en, clk;
   input [31:0] 	port_s;
   
   wire [15:0] 	sel_a, sel_b, sel_s;
   
   //Decoding address line
   decoder4to16 da(addr_a, sel_a, 1'b1);
   decoder4to16 db(addr_b, sel_b, 1'b1);
   decoder4to16 ds(addr_s, sel_s, write_en);

   memory_32 m0(port_a, sel_a[0], port_b, sel_b[0], port_s, sel_s[0], clk);
   memory_32 m1(port_a, sel_a[1], port_b, sel_b[1], port_s, sel_s[1], clk);
   memory_32 m2(port_a, sel_a[2], port_b, sel_b[2], port_s, sel_s[2], clk);
   memory_32 m3(port_a, sel_a[3], port_b, sel_b[3], port_s, sel_s[3], clk);
   memory_32 m4(port_a, sel_a[4], port_b, sel_b[4], port_s, sel_s[4], clk);
   memory_32 m5(port_a, sel_a[5], port_b, sel_b[5], port_s, sel_s[5], clk);
   memory_32 m6(port_a, sel_a[6], port_b, sel_b[6], port_s, sel_s[6], clk);
   memory_32 m7(port_a, sel_a[7], port_b, sel_b[7], port_s, sel_s[7], clk);
   memory_32 m8(port_a, sel_a[8], port_b, sel_b[8], port_s, sel_s[8], clk);
   memory_32 m9(port_a, sel_a[9], port_b, sel_b[9], port_s, sel_s[9], clk);
   memory_32 m10(port_a, sel_a[10], port_b, sel_b[10], port_s, sel_s[10], clk);
   memory_32 m11(port_a, sel_a[11], port_b, sel_b[11], port_s, sel_s[11], clk);
   memory_32 m12(port_a, sel_a[12], port_b, sel_b[12], port_s, sel_s[12], clk);
   memory_32 m13(port_a, sel_a[13], port_b, sel_b[13], port_s, sel_s[13], clk);
   memory_32 m14(port_a, sel_a[14], port_b, sel_b[14], port_s, sel_s[14], clk);
   memory_32 m15(port_a, sel_a[15], port_b, sel_b[15], port_s, sel_s[15], clk);
   
endmodule // memory16_32


// Logic module in ALU

module and_32(s, a, b);
   
   output [31:0] s;
   input [31:0] 	a,b;
   
   and myand[31:0](s, a, b);
   
endmodule // and_32


module xnor_32(s, a, b);
   
   output [31:0] s;
   input [31:0] 	a,b;
   
   xnor myxnor[31:0](s, a, b);
   
endmodule // xnor_32


// Adder in ALU

module adder(s, co, a, b, ci);

   output s, co;
   input  a, b, ci;
   
   wire   o0, o1, o2;
   
   xor(s, a, b, ci);
   
   or(o0, a, b);
   or(o1, b, ci);
   or(o2, ci, a);
   and(co, o0, o1, o2);
   
endmodule // adder


module adder_32(s, co, of, a, b, ci);
   
   output [31:0] s;
   output 	co, of;
   input [31:0] 	a, b;
   input 	ci;
   
   wire 	c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25,c26, c27, c28, c29, c30, c31;
   
   adder a0(s[0], c1, a[0], b[0], ci);
   adder a1(s[1], c2, a[1], b[1], c1);
   adder a2(s[2], c3, a[2], b[2], c2);
   adder a3(s[3], c4, a[3], b[3], c3);
   adder a4(s[4], c5, a[4], b[4], c4);
   adder a5(s[5], c6, a[5], b[5], c5);
   adder a6(s[6], c7, a[6], b[6], c6);
   adder a7(s[7], c8, a[7], b[7], c7);
	adder a8(s[8], c9, a[8], b[8], c8);
   adder a9(s[9], c10, a[9], b[9], c9);
   adder a10(s[10], c11, a[10], b[10], c10);
   adder a11(s[11], c12, a[11], b[11], c11);
   adder a12(s[12], c13, a[12], b[12], c12);
   adder a13(s[13], c14, a[13], b[13], c13);
   adder a14(s[14], c15, a[14], b[14], c14);
   adder a15(s[15], c16, a[15], b[15], c15);
	adder a16(s[16], c17, a[16], b[16], c16);
   adder a17(s[17], c18, a[17], b[17], c17);
   adder a18(s[18], c19, a[18], b[18], c18);
   adder a19(s[19], c20, a[19], b[19], c19);
   adder a20(s[20], c21, a[20], b[20], c20);
   adder a21(s[21], c22, a[21], b[21], c21);
   adder a22(s[22], c23, a[22], b[22], c22);
   adder a23(s[23], c24, a[23], b[23], c23);
	adder a24(s[24], c25, a[24], b[24], c24);
   adder a25(s[25], c26, a[25], b[25], c25);
   adder a26(s[26], c27, a[26], b[26], c26);
   adder a27(s[27], c28, a[27], b[27], c27);
   adder a28(s[28], c29, a[28], b[28], c28);
   adder a29(s[29], c30, a[29], b[29], c29);
   adder a30(s[30], c31, a[30], b[30], c30);
   adder a31(s[31], co, a[31], b[31], c31);
   
   xor(of, co, c31);
   
endmodule // adder_32


module addsub_32(s, co, of, a, b, sub);

   output [31:0] s;
   output 	co, of;
   input [31:0] 	a, b;
   input  	sub;
   
   wire [31:0] 	xb;
   
   xor x0(xb[0], b[0], sub);
   xor x1(xb[1], b[1], sub);
   xor x2(xb[2], b[2], sub);
   xor x3(xb[3], b[3], sub);
   xor x4(xb[4], b[4], sub);
   xor x5(xb[5], b[5], sub);
   xor x6(xb[6], b[6], sub);
   xor x7(xb[7], b[7], sub);
	xor x8(xb[8], b[8], sub);
   xor x9(xb[9], b[9], sub);
   xor x10(xb[10], b[10], sub);
   xor x11(xb[11], b[11], sub);
   xor x12(xb[12], b[12], sub);
   xor x13(xb[13], b[13], sub);
   xor x14(xb[14], b[14], sub);
   xor x15(xb[15], b[15], sub);
	xor x16(xb[16], b[16], sub);
   xor x17(xb[17], b[17], sub);
   xor x18(xb[18], b[18], sub);
   xor x19(xb[19], b[19], sub);
   xor x20(xb[20], b[20], sub);
   xor x21(xb[21], b[21], sub);
   xor x22(xb[22], b[22], sub);
   xor x23(xb[23], b[23], sub);
	xor x24(xb[24], b[24], sub);
   xor x25(xb[25], b[25], sub);
   xor x26(xb[26], b[26], sub);
   xor x27(xb[27], b[27], sub);
   xor x28(xb[28], b[28], sub);
   xor x29(xb[29], b[29], sub);
   xor x30(xb[30], b[30], sub);
   xor x31(xb[31], b[31], sub);
   
   adder_32 myadder(s, co, of, a, xb, sub);
   
endmodule // addsub_8


// for PC
module inc_8(s, a);
   
   output [7:0] s;
   input [7:0] 	a;
   
   wire 	co, c1, c2, c3, c4, c5, c6, c7;
   
   adder a0(s[0], c1, a[0], 1'b0, 1'b1);
   adder a1(s[1], c2, a[1], 1'b0, c1);
   adder a2(s[2], c3, a[2], 1'b0, c2);
   adder a3(s[3], c4, a[3], 1'b0, c3);
   adder a4(s[4], c5, a[4], 1'b0, c4);
   adder a5(s[5], c6, a[5], 1'b0, c5);
   adder a6(s[6], c7, a[6], 1'b0, c6);
   adder a7(s[7], c8, a[7], 1'b0, c7);
   
endmodule

// Shifter in ALU

module shift_left_logic_32(s, a, b);
   
   output [31:0] s;
   input [31:0] 	a, b;
   
	
	

   wire [31:0] m1, m2, m4, m8, m16;
   wire [31:0] s1, s2, s3, s4;
	
	
   
   assign m1[0]=1'b0; assign m1[31:1]=a[30:0];
  mux2to1_32 mux1(a, m1, b[0], s1);
   
  assign m2[1:0]=2'b0; assign m2[31:2]=s1[29:0];
  mux2to1_32 mux2(s1, m2, b[1], s2);

   assign m4[3:0]=4'b0; assign m4[31:4]=s2[27:0];
   mux2to1_32 mux4(s2, m4, b[2], s3);
	
	assign m8[7:0]=8'b0; assign m8[31:8]=s3[23:0];
  mux2to1_32 mux8(s3, m8, b[3], s4);
	
assign m4[15:0]=16'b0; assign m16[31:16]=s4[15:0];
  mux2to1_32 mux16(s4, m16, b[4], s);
   
endmodule // shift_left_logic_8


module shift_right_logic_32(s, a, b);
   
   output [31:0] s;
   input [31:0] 	a, b;
   
   wire [31:0] m1, m2, m4, m8, m16 ;
   wire [31:0] s1, s2, s3, s4;
   
   assign m1[31]=1'b0; assign m1[30:0]=a[31:1];
   mux2to1_32 mux1(a, m1, b[0], s1);
   
   assign m2[31:30]=2'b0; assign m2[29:0]=s1[31:2];
   mux2to1_32 mux2(s1, m2, b[1], s2);

   assign m4[31:28]=4'b0; assign m4[27:0]=s2[31:4];
   mux2to1_32 mux4(s2, m4, b[2], s3);
   
	assign m4[31:24]=8'b0; assign m8[23:0]=s3[31:8];
   mux2to1_32 mux8(s3, m8, b[3], s4);
   
	assign m4[31:16]=16'b0; assign m16[15:0]=s4[31:16];
   mux2to1_32 mux16(s4, m16, b[4], s);
   
endmodule // shift_right_logic_8


// ALU

module alu_32(s, a, b, op);

   output [31:0] s;
   input [31:0] 	a, b;
   input [2:0] 	op;
   
   wire 	co, of;
   wire [31:0] 	sand, sxnor, saddsub, ssl, ssr;
   
   shift_left_logic_32 mysll(ssl, a, b);
   shift_right_logic_32 mysrl(ssr, a, b);
   addsub_32 myadder(saddsub, co, of, a, b, op[0]);
   and_32 myand(sand, a, b);
   xnor_32 myxnor(sxnor, a, b);
   
   wire [31:0] 	s00, s01, s10, s11, s0, s1;
   
   mux2to1_32 mux00(ssl, ssr, op[0], s00);
   assign s01 = saddsub;
   mux2to1_32 mux10(sand, sxnor, op[0], s10);
   assign s11 = 8'b0;

   mux2to1_32 mux0(s00, s01, op[1], s0);
   mux2to1_32 mux1(s10, s11, op[1], s1);

   mux2to1_32 muxs(s0, s1, op[2], s);

endmodule // alu_8


// PC: program conuter

module PC(pc, power, clk, branch_pc, branch_en, stop_en, next_pc);

   output [7:0] pc, next_pc;
   input 	power, clk, branch_en, stop_en;
   input [7:0] 	branch_pc;
   
   wire [7:0] 	inc_pc, init_pc, temp_pc0, temp_pc1;
   wire 	ci;
   
   dff_8 d(next_pc, clk, pc);

   inc_8 myinc(inc_pc, pc);
   
   assign init_pc = 8'b0;

   mux2to1_8 mux0(inc_pc, branch_pc, branch_en, temp_pc0);
   mux2to1_8 mux1(temp_pc0, pc, stop_en, temp_pc1);
   mux2to1_8 mux2(init_pc, temp_pc1, power, next_pc);

endmodule // PC


// Control: instruction decoder

module control(code, write_en, addr_s, addr_a, addr_b, alu_op,
	       jz_en, jnz_en, branch_pc, imm_en, imm, stop_en);

   output [3:0] addr_s, addr_a, addr_b;
   output 	write_en, jz_en, jnz_en, imm_en, stop_en;
   output [7:0] branch_pc;
	output [31:0] imm;
   output [2:0] alu_op;
   input [15:0] code;
   
   wire 	n15, n14, n13, n12;
   
   // ADD/SUB/SLL1/SLR1/AND/XNOR
   //   code: "0 alu_op[2:0] regs rega regb"
   //   signals: write_en
   
   // LOADI
   //   code: "1010 regs imm[7:0]"
   //   signals: write_en, imm_en

   // JZ
   //   code: "1000 pc[7:4] rega pc[3:0]"
   //   signals: jz_en

   // JNZ
   //   code: "1001 pc[7:4] rega pc[3:0]"
   //   signals: jnz_en

   // STOP
   //   code: "1111 xxxx xxxx xxxx"
   //   signals: stop_en
   
   assign alu_op = {code[14], code[13], code[12]};
   assign addr_s = {code[11], code[10], code[9], code[8]};
   assign addr_a = {code[7], code[6], code[5], code[4]};
   assign addr_b = {code[3], code[2], code[1], code[0]};
   assign imm[31:8]=24'b0;	assign imm = {code[7], code[6], code[5], code[4],
		 code[3], code[2], code[1], code[0]};
   
   assign branch_pc = {code[11], code[10], code[9], code[8],
		       code[3], code[2], code[1], code[0]};
   
   not(n15, code[15]);
   not(n14, code[14]);
   not(n13, code[13]);
   not(n12, code[12]);

   and(stop_en, code[15], code[14], code[13], code[12]);

   and(imm_en, code[15], n14, code[13], n12);
   
   or(write_en, imm_en, n15);

   and(jz_en, code[15], n14, n13, n12);

   and(jnz_en, code[15], n14, n13, code[12]);

endmodule // control


// CPU

module cpu32(power, clk, pc, mem_s, code, write_en, imm_en, branch_en, next_pc);
   
   output [7:0] pc,  next_pc;
	output [31:0] mem_s;
   output       write_en, imm_en, branch_en;
   input [15:0] code;
   input 	power, clk;

   wire 	a_nz, a_z, bz, bnz, stop_en, jz_en, jnz_en;
   wire [31:0] 	imm,alu_s, a, b;
	
	wire [7:0] branch_pc;
   wire [3:0] 	addr_a, addr_b, addr_s;
   wire [2:0] 	alu_op;
   
   PC mypc(pc, power, clk, branch_pc, branch_en, stop_en, next_pc);
   
   control myctl(code, write_en, addr_s, addr_a, addr_b, alu_op,
		 jz_en, jnz_en, branch_pc, imm_en, imm, stop_en);
   
   alu_32 myalu(alu_s, a, b, alu_op);
   
   memory16_32 myram(a, addr_a, b, addr_b, mem_s, addr_s, write_en, clk);
   
   // Branch logic
   or(a_nz, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14],a[15],a[16],a[17],a[18],a[19],a[20],a[21],a[22],a[23],a[24],a[25],a[26],a[27],a[28],a[29],a[30],a[31]);
   not(a_z, a_nz);
   and(bz, a_z, jz_en);
   and(bnz, a_nz, jnz_en);
   or(branch_en, bz, bnz);

   // Choose output
   mux2to1_32 alu_out(alu_s, imm, imm_en, mem_s);
   
endmodule // cpu
