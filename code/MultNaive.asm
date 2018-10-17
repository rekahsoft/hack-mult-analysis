// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

        @2       // Load RAM[2] address into A register
        M=0      // Set RAM[2] to 0

(LOOPCOND)
        @0       // Load RAM[0] address into A register
        D=M      // Set D register to RAM[0]
        @LOOP
        D;JGT    // If D > 0 goto LOOP
        @END
        0;JMP    // When D > 0 goto end
(LOOP)
        @1       // Load RAM[1] address into A register
        D=M      // Set D register to RAM[1]
        @2       // Load RAM[2] address into A register
        M=D+M    // Add content of D register to RAM[2] and store result in RAM[2]
        @0       // Load RAM[0] address into A register
        MD=M-1   // Subtract one from RAM[0] storing the results in RAM[0] and the D register
        @LOOPCOND
        D;JGT    // If D > 0 goto LOOP
(END)
        @END
        0;JMP
