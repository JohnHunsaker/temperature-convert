#MIPS Assembly Programming Practice Exercise - Temperature Converter
#Written by John Hunsaker

.data

enterscale: .asciiz "Enter Scale (f or c, or q to quit - don't press enter after): \n"
entertemp: .asciiz "Enter Temperature (just a number - then press enter after): \n"
fartemp: .asciiz "Fahrenheit Temperature: "
celctemp: .asciiz "Celsius Temperature: "
goodbye: .asciiz "End of program. Goodbye."
newline: .asciiz "\n\n"

.text
.globl main

main:

loop:

#Print line 1
la $a0, enterscale
addi $v0, $zero, 4
syscall

#Read line 1
addi $v0, $zero, 12
syscall
move $t0, $v0

#Print Newline
la $a0, newline
addi $v0, $zero, 4
syscall

#Quit loop if 'q' entered.
li $t7, 'q'
beq  $t0, $t7, brk

#Skip to FtoC if 'f' was entered.
li $t6, 'f'
beq $t0, $t6, FtoC
bne $t0, $t6, CtoF

CtoF:
   #Print line 2
   la $a0, entertemp
   addi $v0, $zero 4
   syscall

   #Read line 2
   addi $v0, $zero, 5
   syscall
   move $t1, $v0

   #Print Newline
   la $a0, newline
   addi $v0, $zero, 4
   syscall   

   #tempDegrees = ((9 / 5) * tempDegrees) + 32;
   addi $t3, $zero, 9
   addi $t4, $zero, 5
   mul $t1, $t1, $t3
   div $t1, $t1, $t4
   addi $t1, $t1, 32

   #Print New Far Temp
   la $a0 fartemp
   addi $v0 $zero 4
   syscall

   #Print temp degrees.
   move $a0 $t1
   addi $v0 $zero 1
   syscall

   #Print newline.
   la $a0, newline
   addi $v0, $zero, 4
   syscall

   #Print newline.
   la $a0, newline
   addi $v0, $zero, 4
   syscall

   #Print newline.
   la $a0, newline
   addi $v0, $zero, 4
   syscall

   j loop

FtoC:
   #Print line 2
   la $a0, entertemp
   addi $v0, $zero 4
   syscall

   #Read line 2
   addi $v0, $zero, 5
   syscall
   move $t1, $v0

   #Print Newline
   la $a0, newline
   addi $v0, $zero, 4
   syscall      

   #tempDegrees = ((5 * (tempDegrees - 32)) / 9);
   addi $t3, $zero, 9
   addi $t4, $zero, 5
   sub $t1, $t1, 32
   mul $t1, $t1, $t4
   div $t1, $t1, $t3

   #Print Celc Temp String
   la $a0 celctemp
   addi $v0 $zero 4
   syscall

   #Print temp degrees.
   move $a0 $t1
   addi $v0 $zero 1
   syscall

   #Print newline.
   la $a0, newline
   addi $v0, $zero, 4
   syscall

   #Print newline.
   la $a0, newline
   addi $v0, $zero, 4
   syscall

   #Print newline.
   la $a0, newline
   addi $v0, $zero, 4
   syscall

   j loop

brk:
   la $a0, goodbye
   addi $v0, $zero, 4
   syscall
   li $v0, 10
   syscall
