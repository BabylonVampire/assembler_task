# ПЗ 1, задача б)
# Ввод: целое x. Вывод: все значения от min(x, y) до max(x, y) с шагом h,
# где y - номер группы, h - номер студента в группе.

.eqv GROUP_NUM   118
.eqv STUDENT_NUM 19

.data
prompt: .asciz "x = "

.text
main:
    la   a0, prompt
    li   a7, 4
    ecall

    li   a7, 5
    ecall

    mv   t0, a0             # t0 = x
    li   t1, GROUP_NUM      # t1 = y
    li   t2, STUDENT_NUM    # t2 = h

    # t3 = min(x, y), t4 = max(x, y)
    mv   t3, t0
    mv   t4, t1
    ble  t0, t1, loop
    mv   t3, t1
    mv   t4, t0

loop:
    bgt  t3, t4, done

    mv   a0, t3
    li   a7, 1
    ecall

    li   a0, '\n'
    li   a7, 11
    ecall

    add  t3, t3, t2
    j    loop

done:
    li   a7, 10
    ecall
