// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

        @2       // Load RAM[2] address into A register
        M=0      // Set RAM[2] to 0
        @1       // Load RAM[1] into A register
        D=M      // Set D register to RAM[1]
        @0       // Load RAM[0] into A register
        D=D-M    // Subtract RAM[0] from RAM[1] and store the result in D register
        @SWAP
        D;JLT    // Swap RAM[0] and RAM[1] to optimize number of jumps
        @LOOPCOND
        0;JMP    // Otherwise jump to loop condition

(SWAP)
        @0       // Load RAM[0] address into register A
        D=M      // Set D register to RAM[0]
        @3       // Load RAM[3] address into register A
        M=D      // Set RAM[3] to RAM[0]
        @1       // Load RAM[1] address into register A
        D=M      // Set D register to RAM[1]
        @0       // Load RAM[0] address into register A
        M=D      // Set RAM[0] to register D (RAM[1])
        @3       // Load RAM[3] address into register A
        D=M      // Set D register to RAM[3]
        @1       // Load RAM[1] address into register A
        M=D      // Set RAM[1] to register D (RAM[3])

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
