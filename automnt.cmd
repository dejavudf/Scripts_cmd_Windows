@echo off

:MON_D
mountvol D:\ /l
if not %errorlevel% == 1 goto MON_E
mountvol D:\ %1
goto MON_E

:MON_E
mountvol E:\ /l
if not %errorlevel% == 1 goto MON_F
mountvol E:\ %1
goto MON_F

:MON_F
mountvol F:\ /l
if not %errorlevel% == 1 goto MON_G
mountvol F:\ %1
goto MON_G

:MON_G
mountvol G:\ /l
if not %errorlevel% == 1 goto MON_H
mountvol G:\ %1
goto MON_H

:MON_H
mountvol H:\ /l
if not %errorlevel% == 1 goto MON_I
mountvol H:\ %1
goto MON_I

:MON_I
mountvol I:\ /l
if not %errorlevel% == 1 goto MON_J
mountvol I:\ %1
goto MON_J

:MON_J
mountvol J:\ /l
if not %errorlevel% == 1 goto MON_K
mountvol J:\ %1
goto MON_K

:MON_K
mountvol K:\ /l
if not %errorlevel% == 1 goto MON_L
mountvol K:\ %1
goto MON_L

:MON_L
mountvol L:\ /l
if not %errorlevel% == 1 goto MON_M
mountvol L:\ %1
goto MON_M

:MON_M
mountvol M:\ /l
if not %errorlevel% == 1 goto MON_N
mountvol M:\ %1
goto MON_N

:MON_N
mountvol N:\ /l
if not %errorlevel% == 1 goto MON_O
mountvol N:\ %1
goto MON_O

:MON_O
mountvol O:\ /l
if not %errorlevel% == 1 goto MON_P
mountvol O:\ %1
goto MON_P

:MON_P
mountvol P:\ /l
if not %errorlevel% == 1 goto MON_Q
mountvol P:\ %1
goto MON_Q

:MON_Q
mountvol Q:\ /l
if not %errorlevel% == 1 goto MON_R
mountvol Q:\ %1
goto MON_R

:MON_R
mountvol R:\ /l
if not %errorlevel% == 1 goto MON_S
mountvol R:\ %1
goto MON_S

:MON_S
mountvol S:\ /l
if not %errorlevel% == 1 goto MON_T
mountvol S:\ %1
goto MON_T

:MON_T
mountvol T:\ /l
if not %errorlevel% == 1 goto MON_U
mountvol T:\ %1
goto MON_U

:MON_U
mountvol U:\ /l
if not %errorlevel% == 1 goto MON_V
mountvol U:\ %1
goto MON_V

:MON_V
mountvol V:\ /l
if not %errorlevel% == 1 goto MON_W
mountvol V:\ %1
goto MON_W

:MON_W
mountvol W:\ /l
if not %errorlevel% == 1 goto MON_X
mountvol W:\ %1
goto MON_X

:MON_X
mountvol X:\ /l
if not %errorlevel% == 1 goto MON_Y
mountvol X:\ %1
goto MON_Y

:MON_Y
mountvol Y:\ /l
if not %errorlevel% == 1 goto MON_Z
mountvol Y:\ %1
goto MON_Z

:MON_Z
mountvol Z:\ /l
if not %errorlevel% == 1 goto sair
mountvol Z:\ %1
goto sair

:sair
exit