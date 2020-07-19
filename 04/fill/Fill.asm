// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


(LOOP)
	@KBD
	D = M

	@KEY_PRESSED
	D; JNE // test qu'aucune touche n'est appuyé (donc RAM[KBD ==0)
	
	@color
	M = 0
	
	@START
	0; JMP
	
(KEY_PRESSED)
	@color
	M = -1
	
(START)
	@SCREEN
	D = A
	
	@pointer
	M = D // initialise pointer
	
(DRAW_LOOP)
	@color
	D = M

	@pointer
	A = M //on se met a l'adresse du pointeur
	M = D // et on met la valeur de couleur 
	
	@pointer
	M = M + 1 // on incrémente le pointeur

	// draw_loop testing
	@24576
	D = A
	
	@pointer
	D = D - M

	@DRAW_LOOP
	D; JNE // on continue à dessiner si count != 24576
	
	@LOOP
	0; JMP