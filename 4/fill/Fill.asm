// Infinite loop to monitor keyboard and update screen
(LOOP)
    @KBD          // A = 24576
    D=M           // D = M[KBD] (0 if no key, non-zero if key pressed)
    @value        // A = address of value (e.g., 16)
    M=0           // value = 0 (default to clear screen)
    @UPDATE       // Prepare to jump to screen update
    D;JEQ         // If D == 0 (no key), jump to UPDATE
    @value        // A = address of value
    M=-1          // value = -1 (blacken screen if key pressed)

// Screen update routine
(UPDATE)
    @SCREEN       // A = 16384
    D=A           // D = 16384 (screen base address)
    @addr         // A = address of addr (e.g., 17)
    M=D           // addr = SCREEN (initialize pointer)

(LOOP_UPDATE)
    @value        // A = address of value
    D=M           // D = value (0 or -1)
    @addr         // A = address of addr
    A=M           // A = addr (current screen address)
    M=D           // M[addr] = value (set 16 pixels)
    @addr         // A = address of addr
    M=M+1         // addr = addr + 1 (move to next word)
    D=M           // D = addr (current address)
    @24576        // A = 24576 (end of screen memory + 1)
    D=D-A         // D = addr - 24576
    @LOOP_UPDATE  // Prepare to loop
    D;JLT         // If addr < 24576, jump to LOOP_UPDATE
    @LOOP         // After updating all 8192 words
    0;JMP         // Jump back to check keyboard again