# ПЗ 1, задача в)
# Заполняет массив из 16+n целых чисел значениями со стандартного ввода.
# Чтение прекращается, когда считаны все 16+n значений или введён 0
# (n - номер студента в группе). После чтения массив выводится для проверки.

.eqv STUDENT_NUM 19

.data
array:     .space 256
prompt:    .asciz "a["
prompt_end: .asciz "] = "
count_msg: .asciz "Считано элементов: "

.text
main:
    la   s0, array
    li   s1, 0
    li   s2, 16
    addi s2, s2, STUDENT_NUM

read_loop:
    bge  s1, s2, read_done

    la   a0, prompt
    li   a7, 4
    ecall
    mv   a0, s1
    li   a7, 1
    ecall
    la   a0, prompt_end
    li   a7, 4
    ecall

    li   a7, 5
    ecall
    beqz a0, read_done

    sw   a0, 0(s0)
    addi s0, s0, 4
    addi s1, s1, 1
    j    read_loop

read_done:
    la   a0, count_msg
    li   a7, 4
    ecall
    mv   a0, s1
    li   a7, 1
    ecall
    li   a0, '\n'
    li   a7, 11
    ecall

    la   t0, array
    li   t1, 0
print_loop:
    bge  t1, s1, exit
    lw   a0, 0(t0)
    li   a7, 1
    ecall
    li   a0, ' '
    li   a7, 11
    ecall
    addi t0, t0, 4
    addi t1, t1, 1
    j    print_loop

exit:
    li   a7, 10             # Exit
    ecall
