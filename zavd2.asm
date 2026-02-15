.686
.model flat, stdcall
option casemap:none
include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
include C:\masm32\include\masm32.inc
include C:\masm32\include\debug.inc
include C:\masm32\include\user32.inc

includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\masm32.lib
includelib C:\masm32\lib\debug.lib
includelib C:\masm32\lib\user32.lib

.data
hConsoleOutput dd 0
NumberOfCharsWritten dd 0
Symbol db 23 dup(176),10,13


db 7 dup(176), 8 dup(219), 4 dup(219),4 dup(176),10,13
db 6 dup(176), 2 dup(219),7 dup(176), 4 dup(219),4 dup(176),10,13
db 5 dup(176), 2 dup(219),8 dup(176), 4 dup(219),4 dup(176),10,13
db 5 dup(176), 2 dup(219),8 dup(176), 4 dup(219),4 dup(176),10,13
db 6 dup(176), 2 dup(219),7 dup(176), 4 dup(219),4 dup(176),10,13
db 7 dup(176), 2 dup(219),6 dup(176), 4 dup(219),4 dup(176),10,13
db 8 dup(176), 2 dup(219),5 dup(176), 4 dup(219),4 dup(176),10,13
db 9 dup(176), 6 dup(219), 4 dup(219),4 dup(176),10,13
db 12 dup(176), 7 dup(219),4 dup(176),10,13
db 11 dup(176), 2 dup(219), 2 dup(176), 4 dup(219),4 dup(176),10,13
db 10 dup(176), 2 dup(219), 3 dup(176), 4 dup(219),4 dup(176),10,13
db 9 dup(176), 2 dup(219), 4 dup(176), 4 dup(219),4 dup(176),10,13
db 8 dup(176), 2 dup(219), 5 dup(176), 4 dup(219),4 dup(176),10,13
db 7 dup(176), 2 dup(219), 6 dup(176), 4 dup(219),4 dup(176),10,13
db 6 dup(176), 2 dup(219), 7 dup(176), 4 dup(219),4 dup(176),10,13
db 5 dup(176), 2 dup(219), 8 dup(176), 4 dup(219),4 dup(176),10,13
db 23 dup(176),10,13

NumberOfCharsToWrite dd $-Symbol
ReadBuf db 128 dup(?)
hConsoleInput dd 0
.code
start:
call AllocConsole
push -11
call GetStdHandle
mov hConsoleOutput, eax
push 0
push offset NumberOfCharsWritten
push NumberOfCharsToWrite
push offset Symbol
push hConsoleOutput
call WriteConsoleA
push -10
call GetStdHandle
mov hConsoleInput, eax
push 0
push offset NumberOfCharsWritten
push 128
push offset ReadBuf
push hConsoleInput
call ReadConsoleA
push 0
call ExitProcess
end start