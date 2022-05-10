  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @
  @ write your program here
  @
  CMP  R1, R2                  @ if(oldIndex < newIndex)
  BHI  Another                 @ {
  SUB  R6, R2, R1              @  gap = newIndex - oldIndex
  LDR  R3, [R0, R1, LSL #2]    @  num = array[oldIndex]
While:
  CMP  R6, #0                  @  while(gap > 0)
  BLS  EndWhile                @  {
  LDR  R4, [R0, R2, LSL #2]    @   num2 = array[newIndex]
  STR  R3, [R0, R2, LSL #2]    @   array[newIndex] = num
  MOV  R3, R4                  @   num = num2
  SUB  R2, R2, #1              @   newIndex = newIndex - 1
  SUB  R6, R6, #1              @   gap = gap - 1
  B    While                   @  }
EndWhile:
  STR  R3, [R0, R2, LSL #2]    @  array[newIndex] = num
  B End                        @ }

Another:                       @ else
                               @ {
  SUB  R6, R1, R2              @  gap = oldIndex - newIndex
  LDR  R3, [R0, R1, LSL #2]    @  num = array[oldIndex]
While2:
  CMP  R6, #0                  @  while(gap > 0)
  BLS  EndWhile2               @  {
  LDR  R4, [R0, R2, LSL #2]    @   num2 = array[newIndex]
  STR  R3, [R0, R2, LSL #2]    @   array[newIndex] = num
  MOV  R3, R4                  @   num = num2
  ADD  R2, R2, #1              @   newIndex = newIndex + 1
  SUB  R6, R6, #1              @   gap = gap - 1
  B    While2                  @  }
EndWhile2:
  STR  R3, [R0, R2, LSL #2]    @  array[newIndex] = num
  B End                        @ }



End:    







  @ End of program ... check your result

End_Main:
  BX    lr

