import sys

omega = ('wire [31:0]\n')
for i in range(0, 33):
    if i == 32:
        omega += ('    omega_' + str(4*i) + ', omega_' + str(4*i+1) + ', omega_' + str(4*i+2) + ', omega_' + str(4*i+3) + ';\n')
    else:
        omega += ('    omega_' + str(4*i) + ', omega_' + str(4*i+1) + ', omega_' + str(4*i+2) + ', omega_' + str(4*i+3) + ',\n')
omega += ('get_prekey\n')
omega += ('    g0 (clk, key, 32\'d0, {omega_3, omega_2, omega_1, omega_0}),\n')
omega += ('    g1 (clk, {omega_3, omega_2, omega_1, omega_0, key[255:128]}, 32\'d4, {omega_7, omega_6, omega_5, omega_4}),\n')
for i in range(31):
    if i == 30:
        omega += ('    g' + str(i+2) + ' (clk, {omega_'+str(4*i+7)+', omega_'+str(4*i+6)+', omega_'+str(4*i+5)+', omega_'+str(4*i+4)+\
          ', omega_'+str(4*i+3)+', omega_'+str(4*i+2)+', omega_'+str(4*i+1)+', omega_'+str(4*i+0)+\
          '}, 32\'d'+str(4*(i+2))+', {omega_'+str(4*i+11)+', omega_'+str(4*i+10)+', omega_'+str(4*i+9)+', omega_'+str(4*i+8)+'});\n')
    else:
        omega += ('    g' + str(i+2) + ' (clk, {omega_'+str(4*i+7)+', omega_'+str(4*i+6)+', omega_'+str(4*i+5)+', omega_'+str(4*i+4)+\
          ', omega_'+str(4*i+3)+', omega_'+str(4*i+2)+', omega_'+str(4*i+1)+', omega_'+str(4*i+0)+\
          '}, 32\'d'+str(4*(i+2))+', {omega_'+str(4*i+11)+', omega_'+str(4*i+10)+', omega_'+str(4*i+9)+', omega_'+str(4*i+8)+'}),\n')

key = "wire [127:0] k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32;"
for i in range(33):
    sss = ('S4_box_{which} sb4_{idx}({{omega_{idx3}, omega_{idx2}, omega_{idx1}, omega_{idx0}}}, k{idx});\n')\
            .format(which=str((3-i)%8), idx0=str(4*i), idx1=str(4*i+1), idx2=str(4*i+2), idx3=str(4*i+3), idx=str(i))
    key += sss

one_round = ('wire [127:0] ')
for i in range(1,33):
    if i == 32:
        one_round += ('s' + str(i) + ';\n')
    else:
        one_round += ('s' + str(i) + ',')
one_round += ('one_round_S0 r0 (clk, after_permutation, k0, s1);\n')
for i in range(30):
    if i == 29:
        one_round += ('one_round_S' + str((i+1)%8) + ' r' + str(i+1) + ' (clk, s' + str(i+1) + ', k' + str(i+1) + ', s' + str(i+2) + ');\n')
    else:
        one_round += ('one_round_S' + str((i+1)%8) + ' r' + str(i+1) + ' (clk, s' + str(i+1) + ', k' + str(i+1) + ', s' + str(i+2) + ');\n')
one_round += ('final_round\n')
one_round += ('    r31 (clk, s31, k31, k32, s32);\n')

S8_box = ""
for i in range(32):
    if i == 31:
        S8_box += "ss"+str(i)+" (per_input["+str(4*(i+1)-1)+":"+str(4*i)+"],   per_output["+str(4*(i+1)-1)+":"+str(4*i)+"]);\n"
    else:
        S8_box += "ss"+str(i)+" (per_input["+str(4*(i+1)-1)+":"+str(4*i)+"],   per_output["+str(4*(i+1)-1)+":"+str(4*i)+"]),\n"

one_round_inv = ('wire [127:0] ')
for i in range(1,33):
    if i == 32:
        one_round_inv += ('s' + str(i) + ';\n')
    else:
        one_round_inv += ('s' + str(i) + ',')
one_round_inv += ('final_round_inv\n')
one_round_inv += ('    r31 (clk, input_data, k31, k32, s31);\n')
for i in range(30-1, -1, -1):
    if i == 0:
        one_round_inv += ('one_round_S' + str((i+1)%8) + '_inv r' + str(i+1) + ' (clk, s' + str(i+2) + ', k' + str(i+1) + ', s' + str(i+1) + ');\n')
    else:
        one_round_inv += ('one_round_S' + str((i+1)%8) + '_inv r' + str(i+1) + ' (clk, s' + str(i+2) + ', k' + str(i+1) + ', s' + str(i+1) + ');\n')
one_round_inv += ('one_round_S0_inv r0 (clk, s1, k0, output_data);\n')

# print(omega)
# print(key)
# print(one_round)
# print(S8_box)
print(one_round_inv)