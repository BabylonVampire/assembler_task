# ПЗ 1, задача а)
# Ввод: целое x. Вывод: 1, если x равен номеру студента в списке группы, иначе 0.

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

    li   t0, STUDENT_NUM
    sub  t1, a0, t0
    seqz a0, t1

    li   a7, 1
    ecall

    li   a7, 10
    ecall
