// Copyright (c) 2008-2014 Illinois Institute of Technology
//               All rights reserved.
// Author:       Jia Wang, jwang@ece.iit,edu

module stimulus;
   
   reg power, clk, stop;
   reg [15:0] cycles;

   
   wire [7:0] pc, next_pc;
   wire [31:0] mem_s;   
   wire [15:0] code;
   wire        write_en, imm_en, branch_en;
   
   cpu32 mycpu(power, clk, pc, mem_s, code, write_en, imm_en, branch_en, next_pc);

   program_rom myprogram(pc, code);
   
   initial begin
      clk = 1'b0;
      forever #25 clk = ~clk;
   end
   
   initial begin
      power = 1'b0;
      #26 power = 1'b1;
   end
   
   initial begin
      stop = 1'b0;
      cycles = 16'b0;      
   end
   
   initial begin
      $shm_open("shm.db", 1);
      $shm_probe("AS");
   end
   
   always @(negedge clk) begin
      cycles <= cycles+1;      
      #24 if (stop)
	begin
	   $display("%d: pc=%d, code=%x, program stopped",
		    cycles, pc, code);
           $shm_close();
           $finish;
	end 
      else
	begin
	   if (code[15:12] == 4'b1111)
	     begin
		$display("%d: pwr=%b, pc=%d, npc=%d, code=%x, stop detected",
			 cycles, power, pc, next_pc, code);
		stop = 1;
	     end
	   else
	     begin
		if (imm_en)
		  begin
		     $display("%d: pwr=%b, pc=%d, npc=%d, code=%x, mem[%d]<=%d (loadi)",
			      cycles, power, pc, next_pc, code, code[11:8], mem_s);
		  end
		else
		  begin
		     if (write_en)
		       $display("%d: pwr=%b, pc=%d, npc=%d, code=%x, mem[%d]<=%d (aluop)",
				cycles, power, pc, next_pc, code, code[11:8], mem_s);
		     else
		       $display("%d: pwr=%b, pc=%d, npc=%d, code=%x, branch to %d",
				cycles, power, pc, next_pc, code, {code[11:8],code[3:0]});
		  end // else: !if(imm_en)
	     end // else: !if(code[15:12] == 4'b1111)
	end // else: !if(stop)
   end // always @ (negedge clk)
   
endmodule // stimulus


// ROM: we store the program here
module program_rom(pc, code);

  output [15:0] code;
  input [7:0] pc;

  reg [15:0] rom[255:0];
  
  initial
  begin
    $readmemh("code.hex", rom);
  end
  
  assign code = rom[pc];

endmodule // program_rom
