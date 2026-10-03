circuit Top :
  module Alu :
    input clock : Clock
    input reset : UInt<1>
    input io_alucontrol : UInt<5>
    input io_InA : SInt<32>
    input io_InB : SInt<32>
    output io_output : SInt<32>
    output io_Branch : UInt<1>

    node _T = eq(io_alucontrol, UInt<1>("h0")) @[Alu.scala 17:29]
    node _io_output_T = add(io_InA, io_InB) @[Alu.scala 18:37]
    node _io_output_T_1 = tail(_io_output_T, 1) @[Alu.scala 18:37]
    node _io_output_T_2 = asSInt(_io_output_T_1) @[Alu.scala 18:37]
    node _T_1 = eq(io_alucontrol, UInt<1>("h1")) @[Alu.scala 19:35]
    node _io_output_T_3 = asUInt(io_InB) @[Alu.scala 21:54]
    node _io_output_T_4 = bits(_io_output_T_3, 4, 0) @[Alu.scala 21:56]
    node _io_output_T_5 = dshl(io_InA, _io_output_T_4) @[Alu.scala 21:38]
    node _T_2 = eq(io_alucontrol, UInt<3>("h4")) @[Alu.scala 22:35]
    node _io_output_T_6 = xor(io_InA, io_InB) @[Alu.scala 24:37]
    node _io_output_T_7 = asSInt(_io_output_T_6) @[Alu.scala 24:37]
    node _T_3 = eq(io_alucontrol, UInt<3>("h5")) @[Alu.scala 25:35]
    node _io_output_T_8 = asUInt(io_InB) @[Alu.scala 27:54]
    node _io_output_T_9 = bits(_io_output_T_8, 4, 0) @[Alu.scala 27:56]
    node _io_output_T_10 = dshr(io_InA, _io_output_T_9) @[Alu.scala 27:38]
    node _T_4 = eq(io_alucontrol, UInt<4>("hd")) @[Alu.scala 28:35]
    node _io_output_T_11 = asUInt(io_InB) @[Alu.scala 30:53]
    node _io_output_T_12 = bits(_io_output_T_11, 4, 0) @[Alu.scala 30:55]
    node _io_output_T_13 = dshr(io_InA, _io_output_T_12) @[Alu.scala 30:37]
    node _T_5 = eq(io_alucontrol, UInt<3>("h6")) @[Alu.scala 31:35]
    node _io_output_T_14 = or(io_InA, io_InB) @[Alu.scala 33:37]
    node _io_output_T_15 = asSInt(_io_output_T_14) @[Alu.scala 33:37]
    node _T_6 = eq(io_alucontrol, UInt<3>("h7")) @[Alu.scala 34:35]
    node _io_output_T_16 = and(io_InA, io_InB) @[Alu.scala 36:37]
    node _io_output_T_17 = asSInt(_io_output_T_16) @[Alu.scala 36:37]
    node _T_7 = eq(io_alucontrol, UInt<4>("h8")) @[Alu.scala 37:35]
    node _io_output_T_18 = sub(io_InA, io_InB) @[Alu.scala 39:37]
    node _io_output_T_19 = tail(_io_output_T_18, 1) @[Alu.scala 39:37]
    node _io_output_T_20 = asSInt(_io_output_T_19) @[Alu.scala 39:37]
    node _T_8 = eq(io_alucontrol, UInt<5>("h1f")) @[Alu.scala 40:35]
    node _T_9 = eq(io_alucontrol, UInt<5>("h15")) @[Alu.scala 43:35]
    node _T_10 = geq(io_InA, io_InB) @[Alu.scala 45:30]
    node _GEN_0 = mux(_T_10, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 45:41 Alu.scala 46:35 Alu.scala 48:35]
    node _T_11 = eq(io_alucontrol, UInt<5>("h17")) @[Alu.scala 50:35]
    node _T_12 = asUInt(io_InA) @[Alu.scala 52:30]
    node _T_13 = asUInt(io_InB) @[Alu.scala 52:47]
    node _T_14 = geq(_T_12, _T_13) @[Alu.scala 52:37]
    node _GEN_1 = mux(_T_14, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 52:55 Alu.scala 53:35 Alu.scala 55:35]
    node _T_15 = eq(io_alucontrol, UInt<2>("h3")) @[Alu.scala 57:35]
    node _T_16 = eq(io_alucontrol, UInt<5>("h16")) @[Alu.scala 57:67]
    node _T_17 = or(_T_15, _T_16) @[Alu.scala 57:50]
    node _T_18 = asUInt(io_InA) @[Alu.scala 59:30]
    node _T_19 = asUInt(io_InB) @[Alu.scala 59:46]
    node _T_20 = lt(_T_18, _T_19) @[Alu.scala 59:37]
    node _GEN_2 = mux(_T_20, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 59:54 Alu.scala 60:35 Alu.scala 62:35]
    node _T_21 = eq(io_alucontrol, UInt<5>("h10")) @[Alu.scala 64:35]
    node _T_22 = eq(io_InA, io_InB) @[Alu.scala 66:30]
    node _GEN_3 = mux(_T_22, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 66:42 Alu.scala 67:35 Alu.scala 69:35]
    node _T_23 = eq(io_alucontrol, UInt<2>("h2")) @[Alu.scala 71:35]
    node _T_24 = eq(io_alucontrol, UInt<5>("h14")) @[Alu.scala 71:67]
    node _T_25 = or(_T_23, _T_24) @[Alu.scala 71:50]
    node _T_26 = lt(io_InA, io_InB) @[Alu.scala 73:30]
    node _GEN_4 = mux(_T_26, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 73:40 Alu.scala 74:35 Alu.scala 76:35]
    node _T_27 = eq(io_alucontrol, UInt<5>("h11")) @[Alu.scala 78:35]
    node _T_28 = neq(io_InA, io_InB) @[Alu.scala 80:30]
    node _GEN_5 = mux(_T_28, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[Alu.scala 80:42 Alu.scala 81:35 Alu.scala 83:35]
    node _GEN_6 = validif(_T_27, _GEN_5) @[Alu.scala 78:51]
    node _GEN_7 = mux(_T_25, _GEN_4, _GEN_6) @[Alu.scala 71:83]
    node _GEN_8 = mux(_T_21, _GEN_3, _GEN_7) @[Alu.scala 64:51]
    node _GEN_9 = mux(_T_17, _GEN_2, _GEN_8) @[Alu.scala 57:83]
    node _GEN_10 = mux(_T_11, _GEN_1, _GEN_9) @[Alu.scala 50:51]
    node _GEN_11 = mux(_T_9, _GEN_0, _GEN_10) @[Alu.scala 43:51]
    node _GEN_12 = mux(_T_8, io_InA, _GEN_11) @[Alu.scala 40:51 Alu.scala 42:27]
    node _GEN_13 = mux(_T_7, _io_output_T_20, _GEN_12) @[Alu.scala 37:51 Alu.scala 39:27]
    node _GEN_14 = mux(_T_6, _io_output_T_17, _GEN_13) @[Alu.scala 34:51 Alu.scala 36:27]
    node _GEN_15 = mux(_T_5, _io_output_T_15, _GEN_14) @[Alu.scala 31:51 Alu.scala 33:27]
    node _GEN_16 = mux(_T_4, _io_output_T_13, _GEN_15) @[Alu.scala 28:51 Alu.scala 30:27]
    node _GEN_17 = mux(_T_3, _io_output_T_10, _GEN_16) @[Alu.scala 25:51 Alu.scala 27:27]
    node _GEN_18 = mux(_T_2, _io_output_T_7, _GEN_17) @[Alu.scala 22:51 Alu.scala 24:27]
    node _GEN_19 = mux(_T_1, _io_output_T_5, _GEN_18) @[Alu.scala 19:51 Alu.scala 21:27]
    node _GEN_20 = mux(_T, _io_output_T_2, _GEN_19) @[Alu.scala 17:45 Alu.scala 18:27]
    node _T_29 = eq(io_output, asSInt(UInt<2>("h1"))) @[Alu.scala 90:25]
    node _T_30 = bits(io_alucontrol, 4, 3) @[Alu.scala 90:49]
    node _T_31 = eq(_T_30, UInt<2>("h2")) @[Alu.scala 90:55]
    node _T_32 = and(_T_29, _T_31) @[Alu.scala 90:33]
    node _GEN_21 = mux(_T_32, UInt<1>("h1"), UInt<1>("h0")) @[Alu.scala 90:68 Alu.scala 91:27 Alu.scala 93:27]
    io_output <= asSInt(bits(_GEN_20, 31, 0))
    io_Branch <= _GEN_21

  module InstructionDecode :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    output io_R_Type : UInt<1>
    output io_Load : UInt<1>
    output io_Store : UInt<1>
    output io_Branch : UInt<1>
    output io_I_Type : UInt<1>
    output io_JALR : UInt<1>
    output io_JAL : UInt<1>
    output io_LUI : UInt<1>

    node _T = eq(UInt<6>("h33"), io_opcode) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<5>("h13"), io_opcode) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<6>("h23"), io_opcode) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<7>("h63"), io_opcode) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<6>("h37"), io_opcode) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<7>("h6f"), io_opcode) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<2>("h3"), io_opcode) @[Conditional.scala 37:30]
    node _T_7 = eq(UInt<7>("h67"), io_opcode) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 IntructionDecode.scala 61:15 IntructionDecode.scala 25:11]
    node _GEN_1 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 IntructionDecode.scala 57:15 IntructionDecode.scala 21:11]
    node _GEN_2 = mux(_T_6, UInt<1>("h0"), _GEN_0) @[Conditional.scala 39:67 IntructionDecode.scala 25:11]
    node _GEN_3 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 IntructionDecode.scala 53:14 IntructionDecode.scala 26:10]
    node _GEN_4 = mux(_T_5, UInt<1>("h0"), _GEN_1) @[Conditional.scala 39:67 IntructionDecode.scala 21:11]
    node _GEN_5 = mux(_T_5, UInt<1>("h0"), _GEN_2) @[Conditional.scala 39:67 IntructionDecode.scala 25:11]
    node _GEN_6 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 IntructionDecode.scala 49:14 IntructionDecode.scala 27:10]
    node _GEN_7 = mux(_T_4, UInt<1>("h0"), _GEN_3) @[Conditional.scala 39:67 IntructionDecode.scala 26:10]
    node _GEN_8 = mux(_T_4, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 IntructionDecode.scala 21:11]
    node _GEN_9 = mux(_T_4, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 IntructionDecode.scala 25:11]
    node _GEN_10 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 IntructionDecode.scala 45:17 IntructionDecode.scala 23:13]
    node _GEN_11 = mux(_T_3, UInt<1>("h0"), _GEN_6) @[Conditional.scala 39:67 IntructionDecode.scala 27:10]
    node _GEN_12 = mux(_T_3, UInt<1>("h0"), _GEN_7) @[Conditional.scala 39:67 IntructionDecode.scala 26:10]
    node _GEN_13 = mux(_T_3, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67 IntructionDecode.scala 21:11]
    node _GEN_14 = mux(_T_3, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67 IntructionDecode.scala 25:11]
    node _GEN_15 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 IntructionDecode.scala 41:16 IntructionDecode.scala 22:12]
    node _GEN_16 = mux(_T_2, UInt<1>("h0"), _GEN_10) @[Conditional.scala 39:67 IntructionDecode.scala 23:13]
    node _GEN_17 = mux(_T_2, UInt<1>("h0"), _GEN_11) @[Conditional.scala 39:67 IntructionDecode.scala 27:10]
    node _GEN_18 = mux(_T_2, UInt<1>("h0"), _GEN_12) @[Conditional.scala 39:67 IntructionDecode.scala 26:10]
    node _GEN_19 = mux(_T_2, UInt<1>("h0"), _GEN_13) @[Conditional.scala 39:67 IntructionDecode.scala 21:11]
    node _GEN_20 = mux(_T_2, UInt<1>("h0"), _GEN_14) @[Conditional.scala 39:67 IntructionDecode.scala 25:11]
    node _GEN_21 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 IntructionDecode.scala 37:17 IntructionDecode.scala 24:13]
    node _GEN_22 = mux(_T_1, UInt<1>("h0"), _GEN_15) @[Conditional.scala 39:67 IntructionDecode.scala 22:12]
    node _GEN_23 = mux(_T_1, UInt<1>("h0"), _GEN_16) @[Conditional.scala 39:67 IntructionDecode.scala 23:13]
    node _GEN_24 = mux(_T_1, UInt<1>("h0"), _GEN_17) @[Conditional.scala 39:67 IntructionDecode.scala 27:10]
    node _GEN_25 = mux(_T_1, UInt<1>("h0"), _GEN_18) @[Conditional.scala 39:67 IntructionDecode.scala 26:10]
    node _GEN_26 = mux(_T_1, UInt<1>("h0"), _GEN_19) @[Conditional.scala 39:67 IntructionDecode.scala 21:11]
    node _GEN_27 = mux(_T_1, UInt<1>("h0"), _GEN_20) @[Conditional.scala 39:67 IntructionDecode.scala 25:11]
    node _GEN_28 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58 IntructionDecode.scala 33:17 IntructionDecode.scala 20:13]
    node _GEN_29 = mux(_T, UInt<1>("h0"), _GEN_21) @[Conditional.scala 40:58 IntructionDecode.scala 24:13]
    node _GEN_30 = mux(_T, UInt<1>("h0"), _GEN_22) @[Conditional.scala 40:58 IntructionDecode.scala 22:12]
    node _GEN_31 = mux(_T, UInt<1>("h0"), _GEN_23) @[Conditional.scala 40:58 IntructionDecode.scala 23:13]
    node _GEN_32 = mux(_T, UInt<1>("h0"), _GEN_24) @[Conditional.scala 40:58 IntructionDecode.scala 27:10]
    node _GEN_33 = mux(_T, UInt<1>("h0"), _GEN_25) @[Conditional.scala 40:58 IntructionDecode.scala 26:10]
    node _GEN_34 = mux(_T, UInt<1>("h0"), _GEN_26) @[Conditional.scala 40:58 IntructionDecode.scala 21:11]
    node _GEN_35 = mux(_T, UInt<1>("h0"), _GEN_27) @[Conditional.scala 40:58 IntructionDecode.scala 25:11]
    io_R_Type <= _GEN_28
    io_Load <= _GEN_34
    io_Store <= _GEN_30
    io_Branch <= _GEN_31
    io_I_Type <= _GEN_29
    io_JALR <= _GEN_35
    io_JAL <= _GEN_33
    io_LUI <= _GEN_32

  module ControlDecode :
    input clock : Clock
    input reset : UInt<1>
    input io_Rformat : UInt<1>
    input io_load : UInt<1>
    input io_Store : UInt<1>
    input io_Branch : UInt<1>
    input io_Itype : UInt<1>
    input io_JALR : UInt<1>
    input io_JAL : UInt<1>
    input io_Lui : UInt<1>
    output io_MemWrite : UInt<1>
    output io_BranchOut : UInt<1>
    output io_MemRead : UInt<1>
    output io_RegWrite : UInt<1>
    output io_MemtoReg : UInt<1>
    output io_ALUOP : UInt<3>
    output io_operandAsel : UInt<2>
    output io_operandBsel : UInt<1>
    output io_extend_sel : UInt<2>
    output io_next_PC_sel : UInt<2>

    node _T = eq(io_Rformat, UInt<1>("h1")) @[ControlDecode.scala 41:19]
    node _T_1 = eq(io_load, UInt<1>("h1")) @[ControlDecode.scala 44:22]
    node _T_2 = eq(io_Store, UInt<1>("h1")) @[ControlDecode.scala 50:23]
    node _T_3 = eq(io_Branch, UInt<1>("h1")) @[ControlDecode.scala 55:24]
    node _T_4 = eq(io_Itype, UInt<1>("h1")) @[ControlDecode.scala 59:23]
    node _T_5 = eq(io_JALR, UInt<1>("h1")) @[ControlDecode.scala 63:22]
    node _T_6 = eq(io_JAL, UInt<1>("h1")) @[ControlDecode.scala 68:21]
    node _T_7 = eq(io_Lui, UInt<1>("h1")) @[ControlDecode.scala 73:21]
    node _GEN_0 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[ControlDecode.scala 73:29 ControlDecode.scala 74:17 ControlDecode.scala 80:17]
    node _GEN_1 = mux(_T_7, UInt<3>("h4"), UInt<3>("h7")) @[ControlDecode.scala 73:29 ControlDecode.scala 75:14 ControlDecode.scala 81:14]
    node _GEN_2 = mux(_T_7, UInt<2>("h3"), UInt<1>("h0")) @[ControlDecode.scala 73:29 ControlDecode.scala 76:20 ControlDecode.scala 86:20]
    node _GEN_3 = mux(_T_7, UInt<1>("h0"), UInt<1>("h0")) @[ControlDecode.scala 73:29 ControlDecode.scala 31:16 ControlDecode.scala 82:18]
    node _GEN_4 = mux(_T_7, UInt<1>("h0"), UInt<1>("h1")) @[ControlDecode.scala 73:29 ControlDecode.scala 30:15 ControlDecode.scala 83:17]
    node _GEN_5 = mux(_T_6, UInt<1>("h1"), _GEN_0) @[ControlDecode.scala 68:29 ControlDecode.scala 69:17]
    node _GEN_6 = mux(_T_6, UInt<2>("h3"), _GEN_1) @[ControlDecode.scala 68:29 ControlDecode.scala 70:14]
    node _GEN_7 = mux(_T_6, UInt<2>("h2"), _GEN_2) @[ControlDecode.scala 68:29 ControlDecode.scala 71:20]
    node _GEN_8 = mux(_T_6, UInt<2>("h2"), _GEN_3) @[ControlDecode.scala 68:29 ControlDecode.scala 72:20]
    node _GEN_9 = mux(_T_6, UInt<1>("h0"), _GEN_0) @[ControlDecode.scala 68:29 ControlDecode.scala 37:18]
    node _GEN_10 = mux(_T_6, UInt<1>("h0"), _GEN_3) @[ControlDecode.scala 68:29 ControlDecode.scala 31:16]
    node _GEN_11 = mux(_T_6, UInt<1>("h0"), _GEN_4) @[ControlDecode.scala 68:29 ControlDecode.scala 30:15]
    node _GEN_12 = mux(_T_5, UInt<1>("h1"), _GEN_5) @[ControlDecode.scala 63:30 ControlDecode.scala 64:17]
    node _GEN_13 = mux(_T_5, UInt<2>("h3"), _GEN_6) @[ControlDecode.scala 63:30 ControlDecode.scala 65:14]
    node _GEN_14 = mux(_T_5, UInt<2>("h2"), _GEN_7) @[ControlDecode.scala 63:30 ControlDecode.scala 66:20]
    node _GEN_15 = mux(_T_5, UInt<2>("h3"), _GEN_8) @[ControlDecode.scala 63:30 ControlDecode.scala 67:20]
    node _GEN_16 = mux(_T_5, UInt<1>("h0"), _GEN_9) @[ControlDecode.scala 63:30 ControlDecode.scala 37:18]
    node _GEN_17 = mux(_T_5, UInt<1>("h0"), _GEN_10) @[ControlDecode.scala 63:30 ControlDecode.scala 31:16]
    node _GEN_18 = mux(_T_5, UInt<1>("h0"), _GEN_11) @[ControlDecode.scala 63:30 ControlDecode.scala 30:15]
    node _GEN_19 = mux(_T_4, UInt<1>("h1"), _GEN_12) @[ControlDecode.scala 59:31 ControlDecode.scala 60:18]
    node _GEN_20 = mux(_T_4, UInt<1>("h1"), _GEN_13) @[ControlDecode.scala 59:31 ControlDecode.scala 61:15]
    node _GEN_21 = mux(_T_4, UInt<1>("h1"), _GEN_16) @[ControlDecode.scala 59:31 ControlDecode.scala 62:21]
    node _GEN_22 = mux(_T_4, UInt<1>("h0"), _GEN_14) @[ControlDecode.scala 59:31 ControlDecode.scala 36:18]
    node _GEN_23 = mux(_T_4, UInt<1>("h0"), _GEN_15) @[ControlDecode.scala 59:31 ControlDecode.scala 39:18]
    node _GEN_24 = mux(_T_4, UInt<1>("h0"), _GEN_16) @[ControlDecode.scala 59:31 ControlDecode.scala 38:17]
    node _GEN_25 = mux(_T_4, UInt<1>("h0"), _GEN_17) @[ControlDecode.scala 59:31 ControlDecode.scala 31:16]
    node _GEN_26 = mux(_T_4, UInt<1>("h0"), _GEN_18) @[ControlDecode.scala 59:31 ControlDecode.scala 30:15]
    node _GEN_27 = mux(_T_3, UInt<1>("h1"), _GEN_25) @[ControlDecode.scala 55:32 ControlDecode.scala 56:18]
    node _GEN_28 = mux(_T_3, UInt<2>("h2"), _GEN_20) @[ControlDecode.scala 55:32 ControlDecode.scala 57:14]
    node _GEN_29 = mux(_T_3, UInt<1>("h1"), _GEN_23) @[ControlDecode.scala 55:32 ControlDecode.scala 58:20]
    node _GEN_30 = mux(_T_3, UInt<1>("h0"), _GEN_19) @[ControlDecode.scala 55:32 ControlDecode.scala 33:15]
    node _GEN_31 = mux(_T_3, UInt<1>("h0"), _GEN_21) @[ControlDecode.scala 55:32 ControlDecode.scala 37:18]
    node _GEN_32 = mux(_T_3, UInt<1>("h0"), _GEN_22) @[ControlDecode.scala 55:32 ControlDecode.scala 36:18]
    node _GEN_33 = mux(_T_3, UInt<1>("h0"), _GEN_24) @[ControlDecode.scala 55:32 ControlDecode.scala 38:17]
    node _GEN_34 = mux(_T_3, UInt<1>("h0"), _GEN_26) @[ControlDecode.scala 55:32 ControlDecode.scala 30:15]
    node _GEN_35 = mux(_T_3, UInt<1>("h0"), _GEN_25) @[ControlDecode.scala 55:32 ControlDecode.scala 32:14]
    node _GEN_36 = mux(_T_2, UInt<1>("h1"), _GEN_34) @[ControlDecode.scala 50:31 ControlDecode.scala 51:17]
    node _GEN_37 = mux(_T_2, UInt<3>("h5"), _GEN_28) @[ControlDecode.scala 50:31 ControlDecode.scala 52:14]
    node _GEN_38 = mux(_T_2, UInt<1>("h1"), _GEN_31) @[ControlDecode.scala 50:31 ControlDecode.scala 53:20]
    node _GEN_39 = mux(_T_2, UInt<2>("h2"), _GEN_33) @[ControlDecode.scala 50:31 ControlDecode.scala 54:19]
    node _GEN_40 = mux(_T_2, UInt<1>("h0"), _GEN_27) @[ControlDecode.scala 50:31 ControlDecode.scala 31:16]
    node _GEN_41 = mux(_T_2, UInt<1>("h0"), _GEN_29) @[ControlDecode.scala 50:31 ControlDecode.scala 39:18]
    node _GEN_42 = mux(_T_2, UInt<1>("h0"), _GEN_30) @[ControlDecode.scala 50:31 ControlDecode.scala 33:15]
    node _GEN_43 = mux(_T_2, UInt<1>("h0"), _GEN_32) @[ControlDecode.scala 50:31 ControlDecode.scala 36:18]
    node _GEN_44 = mux(_T_2, UInt<1>("h0"), _GEN_35) @[ControlDecode.scala 50:31 ControlDecode.scala 32:14]
    node _GEN_45 = mux(_T_1, UInt<1>("h1"), _GEN_44) @[ControlDecode.scala 44:30 ControlDecode.scala 45:17]
    node _GEN_46 = mux(_T_1, UInt<1>("h1"), _GEN_42) @[ControlDecode.scala 44:30 ControlDecode.scala 46:18]
    node _GEN_47 = mux(_T_1, UInt<3>("h4"), _GEN_37) @[ControlDecode.scala 44:30 ControlDecode.scala 48:15]
    node _GEN_48 = mux(_T_1, UInt<1>("h1"), _GEN_38) @[ControlDecode.scala 44:30 ControlDecode.scala 49:21]
    node _GEN_49 = mux(_T_1, UInt<1>("h0"), _GEN_36) @[ControlDecode.scala 44:30 ControlDecode.scala 30:15]
    node _GEN_50 = mux(_T_1, UInt<1>("h0"), _GEN_39) @[ControlDecode.scala 44:30 ControlDecode.scala 38:17]
    node _GEN_51 = mux(_T_1, UInt<1>("h0"), _GEN_40) @[ControlDecode.scala 44:30 ControlDecode.scala 31:16]
    node _GEN_52 = mux(_T_1, UInt<1>("h0"), _GEN_41) @[ControlDecode.scala 44:30 ControlDecode.scala 39:18]
    node _GEN_53 = mux(_T_1, UInt<1>("h0"), _GEN_43) @[ControlDecode.scala 44:30 ControlDecode.scala 36:18]
    node _GEN_54 = mux(_T, UInt<1>("h1"), _GEN_46) @[ControlDecode.scala 41:27 ControlDecode.scala 42:17]
    node _GEN_55 = mux(_T, UInt<1>("h0"), _GEN_47) @[ControlDecode.scala 41:27 ControlDecode.scala 43:14]
    node _GEN_56 = mux(_T, UInt<1>("h0"), _GEN_45) @[ControlDecode.scala 41:27 ControlDecode.scala 32:14]
    node _GEN_57 = mux(_T, UInt<1>("h0"), _GEN_48) @[ControlDecode.scala 41:27 ControlDecode.scala 37:18]
    node _GEN_58 = mux(_T, UInt<1>("h0"), _GEN_49) @[ControlDecode.scala 41:27 ControlDecode.scala 30:15]
    node _GEN_59 = mux(_T, UInt<1>("h0"), _GEN_50) @[ControlDecode.scala 41:27 ControlDecode.scala 38:17]
    node _GEN_60 = mux(_T, UInt<1>("h0"), _GEN_51) @[ControlDecode.scala 41:27 ControlDecode.scala 31:16]
    node _GEN_61 = mux(_T, UInt<1>("h0"), _GEN_52) @[ControlDecode.scala 41:27 ControlDecode.scala 39:18]
    node _GEN_62 = mux(_T, UInt<1>("h0"), _GEN_53) @[ControlDecode.scala 41:27 ControlDecode.scala 36:18]
    io_MemWrite <= _GEN_58
    io_BranchOut <= _GEN_60
    io_MemRead <= _GEN_56
    io_RegWrite <= _GEN_54
    io_MemtoReg <= _GEN_56
    io_ALUOP <= _GEN_55
    io_operandAsel <= _GEN_62
    io_operandBsel <= _GEN_57
    io_extend_sel <= _GEN_59
    io_next_PC_sel <= _GEN_61

  module Control :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    output io_MemWrite : UInt<1>
    output io_BranchOut : UInt<1>
    output io_MemRead : UInt<1>
    output io_RegWrite : UInt<1>
    output io_MemtoReg : UInt<1>
    output io_ALUOP : UInt<3>
    output io_operandAsel : UInt<2>
    output io_operandBsel : UInt<1>
    output io_extend_sel : UInt<2>
    output io_next_PC_sel : UInt<2>

    inst TypeDecode of InstructionDecode @[Control.scala 22:28]
    inst ControlDecode of ControlDecode @[Control.scala 23:31]
    io_MemWrite <= ControlDecode.io_MemWrite @[Control.scala 35:17]
    io_BranchOut <= ControlDecode.io_BranchOut @[Control.scala 36:18]
    io_MemRead <= ControlDecode.io_MemRead @[Control.scala 37:16]
    io_RegWrite <= ControlDecode.io_RegWrite @[Control.scala 38:17]
    io_MemtoReg <= ControlDecode.io_MemtoReg @[Control.scala 39:17]
    io_ALUOP <= ControlDecode.io_ALUOP @[Control.scala 40:14]
    io_operandAsel <= ControlDecode.io_operandAsel @[Control.scala 41:20]
    io_operandBsel <= ControlDecode.io_operandBsel @[Control.scala 42:20]
    io_extend_sel <= ControlDecode.io_extend_sel @[Control.scala 43:19]
    io_next_PC_sel <= ControlDecode.io_next_PC_sel @[Control.scala 44:20]
    TypeDecode.clock <= clock
    TypeDecode.reset <= reset
    TypeDecode.io_opcode <= io_opcode @[Control.scala 25:26]
    ControlDecode.clock <= clock
    ControlDecode.reset <= reset
    ControlDecode.io_Rformat <= TypeDecode.io_R_Type @[Control.scala 26:30]
    ControlDecode.io_load <= TypeDecode.io_Load @[Control.scala 27:27]
    ControlDecode.io_Store <= TypeDecode.io_Store @[Control.scala 28:28]
    ControlDecode.io_Branch <= TypeDecode.io_Branch @[Control.scala 29:29]
    ControlDecode.io_Itype <= TypeDecode.io_I_Type @[Control.scala 30:28]
    ControlDecode.io_JALR <= TypeDecode.io_JALR @[Control.scala 31:27]
    ControlDecode.io_JAL <= TypeDecode.io_JAL @[Control.scala 32:26]
    ControlDecode.io_Lui <= TypeDecode.io_LUI @[Control.scala 33:26]

  module ImmdValGen :
    input clock : Clock
    input reset : UInt<1>
    input io_instr : UInt<32>
    output io_immd_se : UInt<32>

    node opcode = bits(io_instr, 6, 0) @[ImmGen.scala 13:26]
    node _T = eq(UInt<5>("h13"), opcode) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<2>("h3"), opcode) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<7>("h67"), opcode) @[Conditional.scala 37:30]
    node _T_3 = or(_T, _T_1) @[Conditional.scala 37:55]
    node _T_4 = or(_T_3, _T_2) @[Conditional.scala 37:55]
    node io_immd_se_lo = bits(io_instr, 31, 20) @[ImmGen.scala 16:35]
    node _sign_ext_T = bits(io_instr, 31, 31) @[ImmGen.scala 17:45]
    node _sign_ext_T_1 = bits(_sign_ext_T, 0, 0) @[Bitwise.scala 72:15]
    node io_immd_se_hi = mux(_sign_ext_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node _io_immd_se_T = cat(io_immd_se_hi, io_immd_se_lo) @[Cat.scala 30:58]
    node _T_5 = eq(UInt<6>("h23"), opcode) @[Conditional.scala 37:30]
    node immbits_hi = bits(io_instr, 31, 25) @[ImmGen.scala 22:39]
    node immbits_lo = bits(io_instr, 11, 7) @[ImmGen.scala 22:56]
    node io_immd_se_lo_1 = cat(immbits_hi, immbits_lo) @[Cat.scala 30:58]
    node _sign_ext_T_2 = bits(io_instr, 31, 31) @[ImmGen.scala 23:45]
    node _sign_ext_T_3 = bits(_sign_ext_T_2, 0, 0) @[Bitwise.scala 72:15]
    node io_immd_se_hi_1 = mux(_sign_ext_T_3, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node _io_immd_se_T_1 = cat(io_immd_se_hi_1, io_immd_se_lo_1) @[Cat.scala 30:58]
    node _T_6 = eq(UInt<7>("h63"), opcode) @[Conditional.scala 37:30]
    node immbits_hi_hi_hi = bits(io_instr, 31, 31) @[ImmGen.scala 29:25]
    node immbits_hi_hi_lo = bits(io_instr, 7, 7) @[ImmGen.scala 30:25]
    node immbits_hi_lo = bits(io_instr, 30, 25) @[ImmGen.scala 31:25]
    node immbits_lo_hi = bits(io_instr, 11, 8) @[ImmGen.scala 32:25]
    node immbits_lo_1 = cat(immbits_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node immbits_hi_hi = cat(immbits_hi_hi_hi, immbits_hi_hi_lo) @[Cat.scala 30:58]
    node immbits_hi_1 = cat(immbits_hi_hi, immbits_hi_lo) @[Cat.scala 30:58]
    node io_immd_se_lo_2 = cat(immbits_hi_1, immbits_lo_1) @[Cat.scala 30:58]
    node _sign_ext_T_4 = bits(io_instr, 31, 31) @[ImmGen.scala 34:43]
    node _sign_ext_T_5 = bits(_sign_ext_T_4, 0, 0) @[Bitwise.scala 72:15]
    node io_immd_se_hi_2 = mux(_sign_ext_T_5, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node _io_immd_se_T_2 = cat(io_immd_se_hi_2, io_immd_se_lo_2) @[Cat.scala 30:58]
    node _T_7 = eq(UInt<6>("h37"), opcode) @[Conditional.scala 37:30]
    node _T_8 = eq(UInt<5>("h17"), opcode) @[Conditional.scala 37:30]
    node _T_9 = or(_T_7, _T_8) @[Conditional.scala 37:55]
    node io_immd_se_hi_3 = bits(io_instr, 31, 12) @[ImmGen.scala 39:35]
    node io_immd_se_lo_3 = mux(UInt<1>("h0"), UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node _io_immd_se_T_3 = cat(io_immd_se_hi_3, io_immd_se_lo_3) @[Cat.scala 30:58]
    node _T_10 = eq(UInt<7>("h6f"), opcode) @[Conditional.scala 37:30]
    node immbits_hi_hi_hi_1 = bits(io_instr, 31, 30) @[ImmGen.scala 45:25]
    node immbits_hi_hi_lo_1 = bits(io_instr, 19, 12) @[ImmGen.scala 46:25]
    node immbits_hi_lo_1 = bits(io_instr, 20, 20) @[ImmGen.scala 47:25]
    node immbits_lo_hi_1 = bits(io_instr, 30, 21) @[ImmGen.scala 48:25]
    node immbits_lo_2 = cat(immbits_lo_hi_1, UInt<1>("h0")) @[Cat.scala 30:58]
    node immbits_hi_hi_1 = cat(immbits_hi_hi_hi_1, immbits_hi_hi_lo_1) @[Cat.scala 30:58]
    node immbits_hi_2 = cat(immbits_hi_hi_1, immbits_hi_lo_1) @[Cat.scala 30:58]
    node io_immd_se_lo_4 = cat(immbits_hi_2, immbits_lo_2) @[Cat.scala 30:58]
    node _sign_ext_T_6 = bits(io_instr, 31, 31) @[ImmGen.scala 52:45]
    node _sign_ext_T_7 = bits(_sign_ext_T_6, 0, 0) @[Bitwise.scala 72:15]
    node io_immd_se_hi_4 = mux(_sign_ext_T_7, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node _io_immd_se_T_4 = cat(io_immd_se_hi_4, io_immd_se_lo_4) @[Cat.scala 30:58]
    node _GEN_0 = mux(_T_10, _io_immd_se_T_4, UInt<1>("h0")) @[Conditional.scala 39:67 ImmGen.scala 53:24 ImmGen.scala 12:16]
    node _GEN_1 = mux(_T_9, _io_immd_se_T_3, _GEN_0) @[Conditional.scala 39:67 ImmGen.scala 41:24]
    node _GEN_2 = mux(_T_6, _io_immd_se_T_2, _GEN_1) @[Conditional.scala 39:67 ImmGen.scala 35:22]
    node _GEN_3 = mux(_T_5, _io_immd_se_T_1, _GEN_2) @[Conditional.scala 39:67 ImmGen.scala 24:24]
    node _GEN_4 = mux(_T_4, _io_immd_se_T, _GEN_3) @[Conditional.scala 40:58 ImmGen.scala 18:24]
    io_immd_se <= bits(_GEN_4, 31, 0)

  module AluControl :
    input clock : Clock
    input reset : UInt<1>
    input io_aluOp : UInt<3>
    input io_funct3 : UInt<3>
    input io_funct7 : UInt<1>
    output io_out : UInt<5>

    node hi = cat(io_aluOp, io_funct7) @[Cat.scala 30:58]
    node _T = cat(hi, io_funct3) @[Cat.scala 30:58]
    node _T_1 = eq(UInt<1>("h0"), _T) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<5>("h10"), _T) @[Conditional.scala 37:30]
    node _T_3 = or(_T_1, _T_2) @[Conditional.scala 37:55]
    node _T_4 = eq(UInt<1>("h1"), _T) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<5>("h11"), _T) @[Conditional.scala 37:30]
    node _T_6 = or(_T_4, _T_5) @[Conditional.scala 37:55]
    node _T_7 = eq(UInt<2>("h2"), _T) @[Conditional.scala 37:30]
    node _T_8 = eq(UInt<5>("h12"), _T) @[Conditional.scala 37:30]
    node _T_9 = or(_T_7, _T_8) @[Conditional.scala 37:55]
    node _T_10 = eq(UInt<6>("h20"), _T) @[Conditional.scala 37:30]
    node _T_11 = eq(UInt<6>("h28"), _T) @[Conditional.scala 37:30]
    node _T_12 = or(_T_10, _T_11) @[Conditional.scala 37:55]
    node _T_13 = eq(UInt<6>("h25"), _T) @[Conditional.scala 37:30]
    node _T_14 = eq(UInt<6>("h2d"), _T) @[Conditional.scala 37:30]
    node _T_15 = or(_T_13, _T_14) @[Conditional.scala 37:55]
    node _T_16 = eq(UInt<3>("h4"), _T) @[Conditional.scala 37:30]
    node _T_17 = eq(UInt<5>("h14"), _T) @[Conditional.scala 37:30]
    node _T_18 = or(_T_16, _T_17) @[Conditional.scala 37:55]
    node _T_19 = eq(UInt<3>("h5"), _T) @[Conditional.scala 37:30]
    node _T_20 = eq(UInt<5>("h15"), _T) @[Conditional.scala 37:30]
    node _T_21 = or(_T_19, _T_20) @[Conditional.scala 37:55]
    node _T_22 = eq(UInt<3>("h6"), _T) @[Conditional.scala 37:30]
    node _T_23 = eq(UInt<5>("h16"), _T) @[Conditional.scala 37:30]
    node _T_24 = or(_T_22, _T_23) @[Conditional.scala 37:55]
    node _T_25 = eq(UInt<3>("h7"), _T) @[Conditional.scala 37:30]
    node _T_26 = eq(UInt<5>("h17"), _T) @[Conditional.scala 37:30]
    node _T_27 = or(_T_25, _T_26) @[Conditional.scala 37:55]
    node _T_28 = eq(UInt<4>("h8"), _T) @[Conditional.scala 37:30]
    node _T_29 = eq(UInt<4>("hd"), _T) @[Conditional.scala 37:30]
    node _T_30 = eq(UInt<5>("h1d"), _T) @[Conditional.scala 37:30]
    node _T_31 = or(_T_29, _T_30) @[Conditional.scala 37:55]
    node _T_32 = eq(UInt<2>("h3"), _T) @[Conditional.scala 37:30]
    node _T_33 = eq(UInt<5>("h13"), _T) @[Conditional.scala 37:30]
    node _T_34 = or(_T_32, _T_33) @[Conditional.scala 37:55]
    node _T_35 = eq(UInt<6>("h26"), _T) @[Conditional.scala 37:30]
    node _T_36 = eq(UInt<6>("h2e"), _T) @[Conditional.scala 37:30]
    node _T_37 = or(_T_35, _T_36) @[Conditional.scala 37:55]
    node _T_38 = eq(UInt<6>("h27"), _T) @[Conditional.scala 37:30]
    node _T_39 = eq(UInt<6>("h2f"), _T) @[Conditional.scala 37:30]
    node _T_40 = or(_T_38, _T_39) @[Conditional.scala 37:55]
    node _T_41 = eq(UInt<6>("h21"), _T) @[Conditional.scala 37:30]
    node _T_42 = eq(UInt<6>("h29"), _T) @[Conditional.scala 37:30]
    node _T_43 = or(_T_41, _T_42) @[Conditional.scala 37:55]
    node _T_44 = eq(UInt<6>("h24"), _T) @[Conditional.scala 37:30]
    node _T_45 = eq(UInt<6>("h2c"), _T) @[Conditional.scala 37:30]
    node _T_46 = or(_T_44, _T_45) @[Conditional.scala 37:55]
    node _T_47 = eq(UInt<6>("h33"), _T) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_47, UInt<5>("h1f"), UInt<1>("h0")) @[Conditional.scala 39:67 AluControl.scala 33:43 AluControl.scala 14:16]
    node _GEN_1 = mux(_T_46, UInt<5>("h14"), _GEN_0) @[Conditional.scala 39:67 AluControl.scala 32:57]
    node _GEN_2 = mux(_T_43, UInt<5>("h11"), _GEN_1) @[Conditional.scala 39:67 AluControl.scala 31:57]
    node _GEN_3 = mux(_T_40, UInt<5>("h17"), _GEN_2) @[Conditional.scala 39:67 AluControl.scala 30:57]
    node _GEN_4 = mux(_T_37, UInt<5>("h16"), _GEN_3) @[Conditional.scala 39:67 AluControl.scala 29:57]
    node _GEN_5 = mux(_T_34, UInt<2>("h3"), _GEN_4) @[Conditional.scala 39:67 AluControl.scala 28:57]
    node _GEN_6 = mux(_T_31, UInt<4>("hd"), _GEN_5) @[Conditional.scala 39:67 AluControl.scala 27:57]
    node _GEN_7 = mux(_T_28, UInt<4>("h8"), _GEN_6) @[Conditional.scala 39:67 AluControl.scala 26:43]
    node _GEN_8 = mux(_T_27, UInt<3>("h7"), _GEN_7) @[Conditional.scala 39:67 AluControl.scala 25:57]
    node _GEN_9 = mux(_T_24, UInt<3>("h6"), _GEN_8) @[Conditional.scala 39:67 AluControl.scala 24:57]
    node _GEN_10 = mux(_T_21, UInt<3>("h5"), _GEN_9) @[Conditional.scala 39:67 AluControl.scala 23:57]
    node _GEN_11 = mux(_T_18, UInt<3>("h4"), _GEN_10) @[Conditional.scala 39:67 AluControl.scala 22:57]
    node _GEN_12 = mux(_T_15, UInt<5>("h15"), _GEN_11) @[Conditional.scala 39:67 AluControl.scala 21:57]
    node _GEN_13 = mux(_T_12, UInt<5>("h10"), _GEN_12) @[Conditional.scala 39:67 AluControl.scala 20:57]
    node _GEN_14 = mux(_T_9, UInt<2>("h2"), _GEN_13) @[Conditional.scala 39:67 AluControl.scala 19:57]
    node _GEN_15 = mux(_T_6, UInt<1>("h1"), _GEN_14) @[Conditional.scala 39:67 AluControl.scala 18:57]
    node _GEN_16 = mux(_T_3, UInt<1>("h0"), _GEN_15) @[Conditional.scala 40:58 AluControl.scala 17:57]
    io_out <= _GEN_16

  module RegFile :
    input clock : Clock
    input reset : UInt<1>
    input io_raddr1 : UInt<5>
    input io_raddr2 : UInt<5>
    output io_rdata1 : UInt<32>
    output io_rdata2 : UInt<32>
    input io_wen : UInt<1>
    input io_waddr : UInt<5>
    input io_wdata : UInt<32>
    output io_debug_regs_0 : UInt<32>
    output io_debug_regs_1 : UInt<32>
    output io_debug_regs_2 : UInt<32>
    output io_debug_regs_3 : UInt<32>
    output io_debug_regs_4 : UInt<32>
    output io_debug_regs_5 : UInt<32>
    output io_debug_regs_6 : UInt<32>
    output io_debug_regs_7 : UInt<32>
    output io_debug_regs_8 : UInt<32>
    output io_debug_regs_9 : UInt<32>
    output io_debug_regs_10 : UInt<32>
    output io_debug_regs_11 : UInt<32>
    output io_debug_regs_12 : UInt<32>
    output io_debug_regs_13 : UInt<32>
    output io_debug_regs_14 : UInt<32>
    output io_debug_regs_15 : UInt<32>
    output io_debug_regs_16 : UInt<32>
    output io_debug_regs_17 : UInt<32>
    output io_debug_regs_18 : UInt<32>
    output io_debug_regs_19 : UInt<32>
    output io_debug_regs_20 : UInt<32>
    output io_debug_regs_21 : UInt<32>
    output io_debug_regs_22 : UInt<32>
    output io_debug_regs_23 : UInt<32>
    output io_debug_regs_24 : UInt<32>
    output io_debug_regs_25 : UInt<32>
    output io_debug_regs_26 : UInt<32>
    output io_debug_regs_27 : UInt<32>
    output io_debug_regs_28 : UInt<32>
    output io_debug_regs_29 : UInt<32>
    output io_debug_regs_30 : UInt<32>
    output io_debug_regs_31 : UInt<32>

    reg regs_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_0) @[regfile.scala 28:20]
    reg regs_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_1) @[regfile.scala 28:20]
    reg regs_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_2) @[regfile.scala 28:20]
    reg regs_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_3) @[regfile.scala 28:20]
    reg regs_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_4) @[regfile.scala 28:20]
    reg regs_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_5) @[regfile.scala 28:20]
    reg regs_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_6) @[regfile.scala 28:20]
    reg regs_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_7) @[regfile.scala 28:20]
    reg regs_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_8) @[regfile.scala 28:20]
    reg regs_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_9) @[regfile.scala 28:20]
    reg regs_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_10) @[regfile.scala 28:20]
    reg regs_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_11) @[regfile.scala 28:20]
    reg regs_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_12) @[regfile.scala 28:20]
    reg regs_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_13) @[regfile.scala 28:20]
    reg regs_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_14) @[regfile.scala 28:20]
    reg regs_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_15) @[regfile.scala 28:20]
    reg regs_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_16) @[regfile.scala 28:20]
    reg regs_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_17) @[regfile.scala 28:20]
    reg regs_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_18) @[regfile.scala 28:20]
    reg regs_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_19) @[regfile.scala 28:20]
    reg regs_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_20) @[regfile.scala 28:20]
    reg regs_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_21) @[regfile.scala 28:20]
    reg regs_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_22) @[regfile.scala 28:20]
    reg regs_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_23) @[regfile.scala 28:20]
    reg regs_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_24) @[regfile.scala 28:20]
    reg regs_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_25) @[regfile.scala 28:20]
    reg regs_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_26) @[regfile.scala 28:20]
    reg regs_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_27) @[regfile.scala 28:20]
    reg regs_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_28) @[regfile.scala 28:20]
    reg regs_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_29) @[regfile.scala 28:20]
    reg regs_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_30) @[regfile.scala 28:20]
    reg regs_31 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regs_31) @[regfile.scala 28:20]
    node _io_rdata1_T = orr(io_raddr1) @[regfile.scala 30:33]
    node _GEN_0 = validif(eq(UInt<1>("h0"), io_raddr1), regs_0) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_raddr1), regs_1, _GEN_0) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_raddr1), regs_2, _GEN_1) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_raddr1), regs_3, _GEN_2) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_raddr1), regs_4, _GEN_3) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_raddr1), regs_5, _GEN_4) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_raddr1), regs_6, _GEN_5) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_raddr1), regs_7, _GEN_6) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_raddr1), regs_8, _GEN_7) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_raddr1), regs_9, _GEN_8) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_raddr1), regs_10, _GEN_9) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_raddr1), regs_11, _GEN_10) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_raddr1), regs_12, _GEN_11) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_raddr1), regs_13, _GEN_12) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_raddr1), regs_14, _GEN_13) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_raddr1), regs_15, _GEN_14) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_raddr1), regs_16, _GEN_15) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_raddr1), regs_17, _GEN_16) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_raddr1), regs_18, _GEN_17) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_raddr1), regs_19, _GEN_18) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_raddr1), regs_20, _GEN_19) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_raddr1), regs_21, _GEN_20) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_raddr1), regs_22, _GEN_21) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_raddr1), regs_23, _GEN_22) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_raddr1), regs_24, _GEN_23) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_raddr1), regs_25, _GEN_24) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_raddr1), regs_26, _GEN_25) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_raddr1), regs_27, _GEN_26) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_raddr1), regs_28, _GEN_27) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_raddr1), regs_29, _GEN_28) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_raddr1), regs_30, _GEN_29) @[regfile.scala 30:21 regfile.scala 30:21]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_raddr1), regs_31, _GEN_30) @[regfile.scala 30:21 regfile.scala 30:21]
    node _regs_io_raddr1 = _GEN_31 @[regfile.scala 30:21]
    node _io_rdata1_T_1 = mux(_io_rdata1_T, _regs_io_raddr1, UInt<1>("h0")) @[regfile.scala 30:21]
    node _io_rdata2_T = orr(io_raddr2) @[regfile.scala 31:33]
    node _GEN_32 = validif(eq(UInt<1>("h0"), io_raddr2), regs_0) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_raddr2), regs_1, _GEN_32) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_raddr2), regs_2, _GEN_33) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_raddr2), regs_3, _GEN_34) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_raddr2), regs_4, _GEN_35) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_raddr2), regs_5, _GEN_36) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_raddr2), regs_6, _GEN_37) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_raddr2), regs_7, _GEN_38) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_raddr2), regs_8, _GEN_39) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_raddr2), regs_9, _GEN_40) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_raddr2), regs_10, _GEN_41) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_raddr2), regs_11, _GEN_42) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_raddr2), regs_12, _GEN_43) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_raddr2), regs_13, _GEN_44) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_raddr2), regs_14, _GEN_45) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_raddr2), regs_15, _GEN_46) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_48 = mux(eq(UInt<5>("h10"), io_raddr2), regs_16, _GEN_47) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_49 = mux(eq(UInt<5>("h11"), io_raddr2), regs_17, _GEN_48) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_50 = mux(eq(UInt<5>("h12"), io_raddr2), regs_18, _GEN_49) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_51 = mux(eq(UInt<5>("h13"), io_raddr2), regs_19, _GEN_50) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_52 = mux(eq(UInt<5>("h14"), io_raddr2), regs_20, _GEN_51) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_53 = mux(eq(UInt<5>("h15"), io_raddr2), regs_21, _GEN_52) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_54 = mux(eq(UInt<5>("h16"), io_raddr2), regs_22, _GEN_53) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_55 = mux(eq(UInt<5>("h17"), io_raddr2), regs_23, _GEN_54) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_56 = mux(eq(UInt<5>("h18"), io_raddr2), regs_24, _GEN_55) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_57 = mux(eq(UInt<5>("h19"), io_raddr2), regs_25, _GEN_56) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_58 = mux(eq(UInt<5>("h1a"), io_raddr2), regs_26, _GEN_57) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_59 = mux(eq(UInt<5>("h1b"), io_raddr2), regs_27, _GEN_58) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_60 = mux(eq(UInt<5>("h1c"), io_raddr2), regs_28, _GEN_59) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_61 = mux(eq(UInt<5>("h1d"), io_raddr2), regs_29, _GEN_60) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_62 = mux(eq(UInt<5>("h1e"), io_raddr2), regs_30, _GEN_61) @[regfile.scala 31:21 regfile.scala 31:21]
    node _GEN_63 = mux(eq(UInt<5>("h1f"), io_raddr2), regs_31, _GEN_62) @[regfile.scala 31:21 regfile.scala 31:21]
    node _regs_io_raddr2 = _GEN_63 @[regfile.scala 31:21]
    node _io_rdata2_T_1 = mux(_io_rdata2_T, _regs_io_raddr2, UInt<1>("h0")) @[regfile.scala 31:21]
    node _T = orr(io_waddr) @[regfile.scala 32:29]
    node _T_1 = and(io_wen, _T) @[regfile.scala 32:18]
    node _regs_io_waddr = io_wdata @[regfile.scala 33:25 regfile.scala 33:25]
    node _GEN_64 = mux(eq(UInt<1>("h0"), io_waddr), _regs_io_waddr, regs_0) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_waddr), _regs_io_waddr, regs_1) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_waddr), _regs_io_waddr, regs_2) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_waddr), _regs_io_waddr, regs_3) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_waddr), _regs_io_waddr, regs_4) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_waddr), _regs_io_waddr, regs_5) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_waddr), _regs_io_waddr, regs_6) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_waddr), _regs_io_waddr, regs_7) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_waddr), _regs_io_waddr, regs_8) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_waddr), _regs_io_waddr, regs_9) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_waddr), _regs_io_waddr, regs_10) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_waddr), _regs_io_waddr, regs_11) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_waddr), _regs_io_waddr, regs_12) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_waddr), _regs_io_waddr, regs_13) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_waddr), _regs_io_waddr, regs_14) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_waddr), _regs_io_waddr, regs_15) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_waddr), _regs_io_waddr, regs_16) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_waddr), _regs_io_waddr, regs_17) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_waddr), _regs_io_waddr, regs_18) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_waddr), _regs_io_waddr, regs_19) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_waddr), _regs_io_waddr, regs_20) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_waddr), _regs_io_waddr, regs_21) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_waddr), _regs_io_waddr, regs_22) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_waddr), _regs_io_waddr, regs_23) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_waddr), _regs_io_waddr, regs_24) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_waddr), _regs_io_waddr, regs_25) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_waddr), _regs_io_waddr, regs_26) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_waddr), _regs_io_waddr, regs_27) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_waddr), _regs_io_waddr, regs_28) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_waddr), _regs_io_waddr, regs_29) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_waddr), _regs_io_waddr, regs_30) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_waddr), _regs_io_waddr, regs_31) @[regfile.scala 33:25 regfile.scala 33:25 regfile.scala 28:20]
    node _GEN_96 = mux(_T_1, _GEN_64, regs_0) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_97 = mux(_T_1, _GEN_65, regs_1) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_98 = mux(_T_1, _GEN_66, regs_2) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_99 = mux(_T_1, _GEN_67, regs_3) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_100 = mux(_T_1, _GEN_68, regs_4) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_101 = mux(_T_1, _GEN_69, regs_5) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_102 = mux(_T_1, _GEN_70, regs_6) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_103 = mux(_T_1, _GEN_71, regs_7) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_104 = mux(_T_1, _GEN_72, regs_8) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_105 = mux(_T_1, _GEN_73, regs_9) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_106 = mux(_T_1, _GEN_74, regs_10) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_107 = mux(_T_1, _GEN_75, regs_11) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_108 = mux(_T_1, _GEN_76, regs_12) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_109 = mux(_T_1, _GEN_77, regs_13) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_110 = mux(_T_1, _GEN_78, regs_14) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_111 = mux(_T_1, _GEN_79, regs_15) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_112 = mux(_T_1, _GEN_80, regs_16) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_113 = mux(_T_1, _GEN_81, regs_17) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_114 = mux(_T_1, _GEN_82, regs_18) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_115 = mux(_T_1, _GEN_83, regs_19) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_116 = mux(_T_1, _GEN_84, regs_20) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_117 = mux(_T_1, _GEN_85, regs_21) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_118 = mux(_T_1, _GEN_86, regs_22) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_119 = mux(_T_1, _GEN_87, regs_23) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_120 = mux(_T_1, _GEN_88, regs_24) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_121 = mux(_T_1, _GEN_89, regs_25) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_122 = mux(_T_1, _GEN_90, regs_26) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_123 = mux(_T_1, _GEN_91, regs_27) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_124 = mux(_T_1, _GEN_92, regs_28) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_125 = mux(_T_1, _GEN_93, regs_29) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_126 = mux(_T_1, _GEN_94, regs_30) @[regfile.scala 32:34 regfile.scala 28:20]
    node _GEN_127 = mux(_T_1, _GEN_95, regs_31) @[regfile.scala 32:34 regfile.scala 28:20]
    io_rdata1 <= _io_rdata1_T_1 @[regfile.scala 30:15]
    io_rdata2 <= _io_rdata2_T_1 @[regfile.scala 31:15]
    io_debug_regs_0 <= regs_0 @[regfile.scala 29:19]
    io_debug_regs_1 <= regs_1 @[regfile.scala 29:19]
    io_debug_regs_2 <= regs_2 @[regfile.scala 29:19]
    io_debug_regs_3 <= regs_3 @[regfile.scala 29:19]
    io_debug_regs_4 <= regs_4 @[regfile.scala 29:19]
    io_debug_regs_5 <= regs_5 @[regfile.scala 29:19]
    io_debug_regs_6 <= regs_6 @[regfile.scala 29:19]
    io_debug_regs_7 <= regs_7 @[regfile.scala 29:19]
    io_debug_regs_8 <= regs_8 @[regfile.scala 29:19]
    io_debug_regs_9 <= regs_9 @[regfile.scala 29:19]
    io_debug_regs_10 <= regs_10 @[regfile.scala 29:19]
    io_debug_regs_11 <= regs_11 @[regfile.scala 29:19]
    io_debug_regs_12 <= regs_12 @[regfile.scala 29:19]
    io_debug_regs_13 <= regs_13 @[regfile.scala 29:19]
    io_debug_regs_14 <= regs_14 @[regfile.scala 29:19]
    io_debug_regs_15 <= regs_15 @[regfile.scala 29:19]
    io_debug_regs_16 <= regs_16 @[regfile.scala 29:19]
    io_debug_regs_17 <= regs_17 @[regfile.scala 29:19]
    io_debug_regs_18 <= regs_18 @[regfile.scala 29:19]
    io_debug_regs_19 <= regs_19 @[regfile.scala 29:19]
    io_debug_regs_20 <= regs_20 @[regfile.scala 29:19]
    io_debug_regs_21 <= regs_21 @[regfile.scala 29:19]
    io_debug_regs_22 <= regs_22 @[regfile.scala 29:19]
    io_debug_regs_23 <= regs_23 @[regfile.scala 29:19]
    io_debug_regs_24 <= regs_24 @[regfile.scala 29:19]
    io_debug_regs_25 <= regs_25 @[regfile.scala 29:19]
    io_debug_regs_26 <= regs_26 @[regfile.scala 29:19]
    io_debug_regs_27 <= regs_27 @[regfile.scala 29:19]
    io_debug_regs_28 <= regs_28 @[regfile.scala 29:19]
    io_debug_regs_29 <= regs_29 @[regfile.scala 29:19]
    io_debug_regs_30 <= regs_30 @[regfile.scala 29:19]
    io_debug_regs_31 <= regs_31 @[regfile.scala 29:19]
    regs_0 <= _GEN_96
    regs_1 <= _GEN_97
    regs_2 <= _GEN_98
    regs_3 <= _GEN_99
    regs_4 <= _GEN_100
    regs_5 <= _GEN_101
    regs_6 <= _GEN_102
    regs_7 <= _GEN_103
    regs_8 <= _GEN_104
    regs_9 <= _GEN_105
    regs_10 <= _GEN_106
    regs_11 <= _GEN_107
    regs_12 <= _GEN_108
    regs_13 <= _GEN_109
    regs_14 <= _GEN_110
    regs_15 <= _GEN_111
    regs_16 <= _GEN_112
    regs_17 <= _GEN_113
    regs_18 <= _GEN_114
    regs_19 <= _GEN_115
    regs_20 <= _GEN_116
    regs_21 <= _GEN_117
    regs_22 <= _GEN_118
    regs_23 <= _GEN_119
    regs_24 <= _GEN_120
    regs_25 <= _GEN_121
    regs_26 <= _GEN_122
    regs_27 <= _GEN_123
    regs_28 <= _GEN_124
    regs_29 <= _GEN_125
    regs_30 <= _GEN_126
    regs_31 <= _GEN_127

  module InstMem :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<32>
    output io_inst : UInt<32>

    mem imem : @[CodeMem.scala 32:20]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_inst_MPORT
      read-under-write => undefined
    node _io_inst_T = div(io_addr, UInt<3>("h4")) @[CodeMem.scala 36:29]
    node _io_inst_T_1 = bits(_io_inst_T, 9, 0) @[CodeMem.scala 36:20]
    io_inst <= imem.io_inst_MPORT.data @[CodeMem.scala 36:13]
    imem.io_inst_MPORT.addr <= _io_inst_T_1 @[CodeMem.scala 36:20]
    imem.io_inst_MPORT.en <= UInt<1>("h1") @[CodeMem.scala 36:20]
    imem.io_inst_MPORT.clk <= clock @[CodeMem.scala 36:20]

  module PC :
    input clock : Clock
    input reset : UInt<1>
    input io_PC_IN : UInt<32>
    output io_PC_OUT : UInt<32>
    output io_PC_NEXT : UInt<32>

    reg reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg) @[PC.scala 13:22]
    node _io_PC_NEXT_T = add(io_PC_OUT, UInt<3>("h4")) @[PC.scala 16:29]
    node _io_PC_NEXT_T_1 = tail(_io_PC_NEXT_T, 1) @[PC.scala 16:29]
    io_PC_OUT <= reg @[PC.scala 15:15]
    io_PC_NEXT <= _io_PC_NEXT_T_1 @[PC.scala 16:16]
    reg <= mux(reset, UInt<32>("h0"), io_PC_IN) @[PC.scala 13:22 PC.scala 13:22 PC.scala 18:9]

  module Jalr :
    input clock : Clock
    input reset : UInt<1>
    input io_in1 : SInt<32>
    input io_in2 : SInt<32>
    output io_out : SInt<32>

    node _a_T = add(io_in1, io_in2) @[Jalr.scala 12:24]
    node _a_T_1 = tail(_a_T, 1) @[Jalr.scala 12:24]
    node a = asSInt(_a_T_1) @[Jalr.scala 12:24]
    node _io_out_T = and(a, asSInt(UInt<32>("hfffffffe"))) @[Jalr.scala 13:21]
    node _io_out_T_1 = asSInt(_io_out_T) @[Jalr.scala 13:21]
    io_out <= _io_out_T_1 @[Jalr.scala 13:16]

  module Asynch_Mem :
    input clock : Clock
    input reset : UInt<1>
    input io_data_in : UInt<32>
    input io_data_selector : UInt<2>
    output io_data_out : UInt<32>
    input io_addr : UInt<5>
    input io_wr_en : UInt<1>

    mem memory : @[memory.scala 22:21]
      data-type => UInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      reader => io_data_out_MPORT
      writer => MPORT
      read-under-write => undefined
    node _GEN_0 = validif(io_wr_en, io_addr) @[memory.scala 23:21]
    node _GEN_1 = validif(io_wr_en, clock) @[memory.scala 23:21]
    node _GEN_2 = mux(io_wr_en, UInt<1>("h1"), UInt<1>("h0")) @[memory.scala 23:21 memory.scala 22:21]
    node _GEN_3 = validif(io_wr_en, UInt<1>("h1")) @[memory.scala 23:21]
    node _GEN_4 = validif(io_wr_en, io_data_in) @[memory.scala 23:21]
    io_data_out <= memory.io_data_out_MPORT.data @[memory.scala 30:17]
    memory.io_data_out_MPORT.addr <= io_addr @[memory.scala 30:31]
    memory.io_data_out_MPORT.en <= UInt<1>("h1") @[memory.scala 30:31]
    memory.io_data_out_MPORT.clk <= clock @[memory.scala 30:31]
    memory.MPORT.addr <= _GEN_0
    memory.MPORT.en <= _GEN_2
    memory.MPORT.clk <= _GEN_1
    memory.MPORT.data <= _GEN_4
    memory.MPORT.mask <= _GEN_3

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io_pc : UInt<32>
    output io_inst : UInt<32>
    output io_aluInA : SInt<32>
    output io_aluInB : SInt<32>
    output io_aluOut : SInt<32>
    output io_regRdata1 : UInt<32>
    output io_regRdata2 : UInt<32>
    output io_regWdata : UInt<32>
    output io_regWen : UInt<1>
    output io_regWaddr : UInt<5>
    output io_regFile_regs_0 : UInt<32>
    output io_regFile_regs_1 : UInt<32>
    output io_regFile_regs_2 : UInt<32>
    output io_regFile_regs_3 : UInt<32>
    output io_regFile_regs_4 : UInt<32>
    output io_regFile_regs_5 : UInt<32>
    output io_regFile_regs_6 : UInt<32>
    output io_regFile_regs_7 : UInt<32>
    output io_regFile_regs_8 : UInt<32>
    output io_regFile_regs_9 : UInt<32>
    output io_regFile_regs_10 : UInt<32>
    output io_regFile_regs_11 : UInt<32>
    output io_regFile_regs_12 : UInt<32>
    output io_regFile_regs_13 : UInt<32>
    output io_regFile_regs_14 : UInt<32>
    output io_regFile_regs_15 : UInt<32>
    output io_regFile_regs_16 : UInt<32>
    output io_regFile_regs_17 : UInt<32>
    output io_regFile_regs_18 : UInt<32>
    output io_regFile_regs_19 : UInt<32>
    output io_regFile_regs_20 : UInt<32>
    output io_regFile_regs_21 : UInt<32>
    output io_regFile_regs_22 : UInt<32>
    output io_regFile_regs_23 : UInt<32>
    output io_regFile_regs_24 : UInt<32>
    output io_regFile_regs_25 : UInt<32>
    output io_regFile_regs_26 : UInt<32>
    output io_regFile_regs_27 : UInt<32>
    output io_regFile_regs_28 : UInt<32>
    output io_regFile_regs_29 : UInt<32>
    output io_regFile_regs_30 : UInt<32>
    output io_regFile_regs_31 : UInt<32>
    output io_imm : UInt<32>
    output io_branch : UInt<1>

    inst Alu of Alu @[top.scala 33:21]
    inst Control of Control @[top.scala 34:25]
    inst ImmGen of ImmdValGen @[top.scala 35:24]
    inst AluControl of AluControl @[top.scala 36:28]
    inst Register of RegFile @[top.scala 37:26]
    inst Instr_Memory of InstMem @[top.scala 38:30]
    inst PC of PC @[top.scala 39:20]
    inst Jalr of Jalr @[top.scala 40:22]
    inst DataMemory of Asynch_Mem @[top.scala 41:28]
    node _Control_io_opcode_T = bits(Instr_Memory.io_inst, 6, 0) @[top.scala 73:46]
    node _Register_io_waddr_T = bits(Instr_Memory.io_inst, 11, 7) @[top.scala 80:46]
    node _Register_io_raddr1_T = bits(Instr_Memory.io_inst, 19, 15) @[top.scala 81:47]
    node _Register_io_raddr2_T = bits(Instr_Memory.io_inst, 24, 20) @[top.scala 82:47]
    node _AluControl_io_funct3_T = bits(Instr_Memory.io_inst, 14, 12) @[top.scala 87:49]
    node _AluControl_io_funct7_T = bits(Instr_Memory.io_inst, 30, 30) @[top.scala 88:49]
    node _Alu_io_InA_T = asSInt(Register.io_rdata1) @[top.scala 104:38]
    node _Alu_io_InB_T = asSInt(Register.io_rdata2) @[top.scala 105:38]
    node _DataMemory_io_addr_T = asUInt(Alu.io_output) @[top.scala 110:47]
    node _DataMemory_io_addr_T_1 = bits(_DataMemory_io_addr_T, 6, 2) @[top.scala 110:49]
    node _Register_io_wdata_T = asUInt(Alu.io_output) @[top.scala 114:40]
    node _T = eq(Control.io_RegWrite, UInt<1>("h1")) @[top.scala 120:29]
    node _T_1 = eq(Control.io_MemRead, UInt<1>("h1")) @[top.scala 120:59]
    node _T_2 = and(_T, _T_1) @[top.scala 120:37]
    node _T_3 = eq(Control.io_MemtoReg, UInt<1>("h1")) @[top.scala 120:90]
    node _T_4 = and(_T_2, _T_3) @[top.scala 120:67]
    node _T_5 = eq(Control.io_operandBsel, UInt<1>("h1")) @[top.scala 120:124]
    node _T_6 = and(_T_4, _T_5) @[top.scala 120:98]
    node _Alu_io_InA_T_1 = asSInt(Register.io_rdata1) @[top.scala 123:42]
    node _Alu_io_InB_T_1 = asSInt(ImmGen.io_immd_se) @[top.scala 124:41]
    node _DataMemory_io_addr_T_2 = asUInt(Alu.io_output) @[top.scala 128:51]
    node _DataMemory_io_addr_T_3 = bits(_DataMemory_io_addr_T_2, 6, 2) @[top.scala 128:53]
    node _T_7 = eq(Control.io_MemWrite, UInt<1>("h1")) @[top.scala 138:29]
    node _T_8 = eq(Control.io_operandBsel, UInt<1>("h1")) @[top.scala 138:63]
    node _T_9 = and(_T_7, _T_8) @[top.scala 138:37]
    node _Alu_io_InA_T_2 = asSInt(Register.io_rdata1) @[top.scala 141:42]
    node _Alu_io_InB_T_2 = asSInt(ImmGen.io_immd_se) @[top.scala 142:41]
    node _DataMemory_io_addr_T_4 = asUInt(Alu.io_output) @[top.scala 146:51]
    node _DataMemory_io_addr_T_5 = bits(_DataMemory_io_addr_T_4, 6, 2) @[top.scala 146:53]
    node _T_10 = eq(Control.io_next_PC_sel, UInt<1>("h1")) @[top.scala 156:32]
    node _T_11 = eq(Control.io_BranchOut, UInt<1>("h1")) @[top.scala 156:69]
    node _T_12 = and(_T_10, _T_11) @[top.scala 156:45]
    node _Alu_io_InA_T_3 = asSInt(Register.io_rdata1) @[top.scala 159:42]
    node _Alu_io_InB_T_3 = asSInt(Register.io_rdata2) @[top.scala 160:42]
    node _T_13 = eq(Alu.io_Branch, UInt<1>("h1")) @[top.scala 162:29]
    node _PC_io_PC_IN_T = add(PC.io_PC_OUT, ImmGen.io_immd_se) @[top.scala 163:41]
    node _PC_io_PC_IN_T_1 = tail(_PC_io_PC_IN_T, 1) @[top.scala 163:41]
    node _GEN_0 = mux(_T_13, _PC_io_PC_IN_T_1, PC.io_PC_NEXT) @[top.scala 162:37 top.scala 163:25 top.scala 97:17]
    node _T_14 = eq(Control.io_RegWrite, UInt<1>("h1")) @[top.scala 169:29]
    node _T_15 = eq(Control.io_operandAsel, UInt<2>("h2")) @[top.scala 169:63]
    node _T_16 = and(_T_14, _T_15) @[top.scala 169:37]
    node _T_17 = eq(Control.io_next_PC_sel, UInt<2>("h3")) @[top.scala 169:101]
    node _T_18 = and(_T_16, _T_17) @[top.scala 169:75]
    node _Jalr_io_in1_T = asSInt(Register.io_rdata1) @[top.scala 174:43]
    node _Jalr_io_in2_T = asSInt(ImmGen.io_immd_se) @[top.scala 175:42]
    node _PC_io_PC_IN_T_2 = asUInt(Jalr.io_out) @[top.scala 183:36]
    node _T_19 = eq(Control.io_RegWrite, UInt<1>("h1")) @[top.scala 189:29]
    node _T_20 = eq(Control.io_operandAsel, UInt<2>("h2")) @[top.scala 189:63]
    node _T_21 = and(_T_19, _T_20) @[top.scala 189:37]
    node _T_22 = eq(Control.io_next_PC_sel, UInt<2>("h2")) @[top.scala 189:101]
    node _T_23 = and(_T_21, _T_22) @[top.scala 189:75]
    node _PC_io_PC_IN_T_3 = add(PC.io_PC_OUT, ImmGen.io_immd_se) @[top.scala 194:37]
    node _PC_io_PC_IN_T_4 = tail(_PC_io_PC_IN_T_3, 1) @[top.scala 194:37]
    node _T_24 = eq(Control.io_RegWrite, UInt<1>("h1")) @[top.scala 206:29]
    node _T_25 = eq(Control.io_operandAsel, UInt<2>("h3")) @[top.scala 206:63]
    node _T_26 = and(_T_24, _T_25) @[top.scala 206:37]
    node _T_27 = eq(Control.io_operandBsel, UInt<1>("h1")) @[top.scala 206:101]
    node _T_28 = and(_T_26, _T_27) @[top.scala 206:75]
    node _T_29 = eq(Control.io_RegWrite, UInt<1>("h1")) @[top.scala 217:29]
    node _Alu_io_InA_T_4 = asSInt(Register.io_rdata1) @[top.scala 222:42]
    node _T_30 = eq(UInt<1>("h0"), Control.io_operandBsel) @[Conditional.scala 37:30]
    node _Alu_io_InB_T_4 = asSInt(Register.io_rdata2) @[top.scala 228:50]
    node _T_31 = eq(UInt<1>("h1"), Control.io_operandBsel) @[Conditional.scala 37:30]
    node _Alu_io_InB_T_5 = asSInt(ImmGen.io_immd_se) @[top.scala 234:49]
    node _GEN_1 = mux(_T_31, _Alu_io_InB_T_5, _Alu_io_InB_T) @[Conditional.scala 39:67 top.scala 234:28 top.scala 105:16]
    node _GEN_2 = mux(_T_30, _Alu_io_InB_T_4, _GEN_1) @[Conditional.scala 40:58 top.scala 228:28]
    node _Register_io_wdata_T_1 = asUInt(Alu.io_output) @[top.scala 240:44]
    node _GEN_3 = mux(_T_29, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 218:7 top.scala 220:25 top.scala 102:21]
    node _GEN_4 = mux(_T_29, _Alu_io_InA_T_4, _Alu_io_InA_T) @[top.scala 218:7 top.scala 222:20 top.scala 104:16]
    node _GEN_5 = mux(_T_29, _GEN_2, _Alu_io_InB_T) @[top.scala 218:7 top.scala 105:16]
    node _GEN_6 = mux(_T_29, _Register_io_wdata_T_1, _Register_io_wdata_T) @[top.scala 218:7 top.scala 240:27 top.scala 114:23]
    node _GEN_7 = mux(_T_28, ImmGen.io_immd_se, _GEN_6) @[top.scala 207:7 top.scala 209:27]
    node _GEN_8 = mux(_T_28, UInt<1>("h1"), _GEN_3) @[top.scala 207:7 top.scala 211:25]
    node _GEN_9 = mux(_T_28, _Alu_io_InA_T, _GEN_4) @[top.scala 207:7 top.scala 104:16]
    node _GEN_10 = mux(_T_28, _Alu_io_InB_T, _GEN_5) @[top.scala 207:7 top.scala 105:16]
    node _GEN_11 = mux(_T_23, _PC_io_PC_IN_T_4, PC.io_PC_NEXT) @[top.scala 190:7 top.scala 194:21 top.scala 97:17]
    node _GEN_12 = mux(_T_23, PC.io_PC_NEXT, _GEN_7) @[top.scala 190:7 top.scala 198:27]
    node _GEN_13 = mux(_T_23, UInt<1>("h1"), _GEN_8) @[top.scala 190:7 top.scala 200:25]
    node _GEN_14 = mux(_T_23, _Alu_io_InA_T, _GEN_9) @[top.scala 190:7 top.scala 104:16]
    node _GEN_15 = mux(_T_23, _Alu_io_InB_T, _GEN_10) @[top.scala 190:7 top.scala 105:16]
    node _GEN_16 = mux(_T_18, _Jalr_io_in1_T, asSInt(UInt<1>("h0"))) @[top.scala 170:7 top.scala 174:21 top.scala 107:17]
    node _GEN_17 = mux(_T_18, _Jalr_io_in2_T, asSInt(UInt<1>("h0"))) @[top.scala 170:7 top.scala 175:21 top.scala 108:17]
    node _GEN_18 = mux(_T_18, PC.io_PC_NEXT, _GEN_12) @[top.scala 170:7 top.scala 179:27]
    node _GEN_19 = mux(_T_18, UInt<1>("h1"), _GEN_13) @[top.scala 170:7 top.scala 181:25]
    node _GEN_20 = mux(_T_18, _PC_io_PC_IN_T_2, _GEN_11) @[top.scala 170:7 top.scala 183:21]
    node _GEN_21 = mux(_T_18, _Alu_io_InA_T, _GEN_14) @[top.scala 170:7 top.scala 104:16]
    node _GEN_22 = mux(_T_18, _Alu_io_InB_T, _GEN_15) @[top.scala 170:7 top.scala 105:16]
    node _GEN_23 = mux(_T_12, _Alu_io_InA_T_3, _GEN_21) @[top.scala 157:7 top.scala 159:20]
    node _GEN_24 = mux(_T_12, _Alu_io_InB_T_3, _GEN_22) @[top.scala 157:7 top.scala 160:20]
    node _GEN_25 = mux(_T_12, _GEN_0, _GEN_20) @[top.scala 157:7]
    node _GEN_26 = mux(_T_12, asSInt(UInt<1>("h0")), _GEN_16) @[top.scala 157:7 top.scala 107:17]
    node _GEN_27 = mux(_T_12, asSInt(UInt<1>("h0")), _GEN_17) @[top.scala 157:7 top.scala 108:17]
    node _GEN_28 = mux(_T_12, _Register_io_wdata_T, _GEN_18) @[top.scala 157:7 top.scala 114:23]
    node _GEN_29 = mux(_T_12, UInt<1>("h0"), _GEN_19) @[top.scala 157:7 top.scala 102:21]
    node _GEN_30 = mux(_T_9, _Alu_io_InA_T_2, _GEN_23) @[top.scala 139:7 top.scala 141:20]
    node _GEN_31 = mux(_T_9, _Alu_io_InB_T_2, _GEN_24) @[top.scala 139:7 top.scala 142:20]
    node _GEN_32 = mux(_T_9, _DataMemory_io_addr_T_5, _DataMemory_io_addr_T_1) @[top.scala 139:7 top.scala 146:28 top.scala 110:24]
    node _GEN_33 = mux(_T_9, Register.io_rdata2, Register.io_rdata2) @[top.scala 139:7 top.scala 148:31 top.scala 112:27]
    node _GEN_34 = mux(_T_9, UInt<1>("h1"), UInt<1>("h0")) @[top.scala 139:7 top.scala 150:29 top.scala 99:25]
    node _GEN_35 = mux(_T_9, PC.io_PC_NEXT, _GEN_25) @[top.scala 139:7 top.scala 97:17]
    node _GEN_36 = mux(_T_9, asSInt(UInt<1>("h0")), _GEN_26) @[top.scala 139:7 top.scala 107:17]
    node _GEN_37 = mux(_T_9, asSInt(UInt<1>("h0")), _GEN_27) @[top.scala 139:7 top.scala 108:17]
    node _GEN_38 = mux(_T_9, _Register_io_wdata_T, _GEN_28) @[top.scala 139:7 top.scala 114:23]
    node _GEN_39 = mux(_T_9, UInt<1>("h0"), _GEN_29) @[top.scala 139:7 top.scala 102:21]
    node _GEN_40 = mux(_T_6, _Alu_io_InA_T_1, _GEN_30) @[top.scala 121:7 top.scala 123:20]
    node _GEN_41 = mux(_T_6, _Alu_io_InB_T_1, _GEN_31) @[top.scala 121:7 top.scala 124:20]
    node _GEN_42 = mux(_T_6, _DataMemory_io_addr_T_3, _GEN_32) @[top.scala 121:7 top.scala 128:28]
    node _GEN_43 = mux(_T_6, DataMemory.io_data_out, _GEN_38) @[top.scala 121:7 top.scala 130:27]
    node _GEN_44 = mux(_T_6, UInt<1>("h1"), _GEN_39) @[top.scala 121:7 top.scala 132:25]
    node _GEN_45 = mux(_T_6, Register.io_rdata2, _GEN_33) @[top.scala 121:7 top.scala 112:27]
    node _GEN_46 = mux(_T_6, UInt<1>("h0"), _GEN_34) @[top.scala 121:7 top.scala 99:25]
    node _GEN_47 = mux(_T_6, PC.io_PC_NEXT, _GEN_35) @[top.scala 121:7 top.scala 97:17]
    node _GEN_48 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_36) @[top.scala 121:7 top.scala 107:17]
    node _GEN_49 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_37) @[top.scala 121:7 top.scala 108:17]
    io_pc <= PC.io_PC_OUT @[top.scala 46:18]
    io_inst <= Instr_Memory.io_inst @[top.scala 47:18]
    io_aluInA <= Alu.io_InA @[top.scala 49:18]
    io_aluInB <= Alu.io_InB @[top.scala 50:18]
    io_aluOut <= Alu.io_output @[top.scala 51:18]
    io_regRdata1 <= Register.io_rdata1 @[top.scala 53:18]
    io_regRdata2 <= Register.io_rdata2 @[top.scala 54:18]
    io_regWdata <= Register.io_wdata @[top.scala 55:18]
    io_regWen <= Register.io_wen @[top.scala 57:18]
    io_regWaddr <= Register.io_waddr @[top.scala 58:18]
    io_regFile_regs_0 <= Register.io_debug_regs_0 @[top.scala 59:18]
    io_regFile_regs_1 <= Register.io_debug_regs_1 @[top.scala 59:18]
    io_regFile_regs_2 <= Register.io_debug_regs_2 @[top.scala 59:18]
    io_regFile_regs_3 <= Register.io_debug_regs_3 @[top.scala 59:18]
    io_regFile_regs_4 <= Register.io_debug_regs_4 @[top.scala 59:18]
    io_regFile_regs_5 <= Register.io_debug_regs_5 @[top.scala 59:18]
    io_regFile_regs_6 <= Register.io_debug_regs_6 @[top.scala 59:18]
    io_regFile_regs_7 <= Register.io_debug_regs_7 @[top.scala 59:18]
    io_regFile_regs_8 <= Register.io_debug_regs_8 @[top.scala 59:18]
    io_regFile_regs_9 <= Register.io_debug_regs_9 @[top.scala 59:18]
    io_regFile_regs_10 <= Register.io_debug_regs_10 @[top.scala 59:18]
    io_regFile_regs_11 <= Register.io_debug_regs_11 @[top.scala 59:18]
    io_regFile_regs_12 <= Register.io_debug_regs_12 @[top.scala 59:18]
    io_regFile_regs_13 <= Register.io_debug_regs_13 @[top.scala 59:18]
    io_regFile_regs_14 <= Register.io_debug_regs_14 @[top.scala 59:18]
    io_regFile_regs_15 <= Register.io_debug_regs_15 @[top.scala 59:18]
    io_regFile_regs_16 <= Register.io_debug_regs_16 @[top.scala 59:18]
    io_regFile_regs_17 <= Register.io_debug_regs_17 @[top.scala 59:18]
    io_regFile_regs_18 <= Register.io_debug_regs_18 @[top.scala 59:18]
    io_regFile_regs_19 <= Register.io_debug_regs_19 @[top.scala 59:18]
    io_regFile_regs_20 <= Register.io_debug_regs_20 @[top.scala 59:18]
    io_regFile_regs_21 <= Register.io_debug_regs_21 @[top.scala 59:18]
    io_regFile_regs_22 <= Register.io_debug_regs_22 @[top.scala 59:18]
    io_regFile_regs_23 <= Register.io_debug_regs_23 @[top.scala 59:18]
    io_regFile_regs_24 <= Register.io_debug_regs_24 @[top.scala 59:18]
    io_regFile_regs_25 <= Register.io_debug_regs_25 @[top.scala 59:18]
    io_regFile_regs_26 <= Register.io_debug_regs_26 @[top.scala 59:18]
    io_regFile_regs_27 <= Register.io_debug_regs_27 @[top.scala 59:18]
    io_regFile_regs_28 <= Register.io_debug_regs_28 @[top.scala 59:18]
    io_regFile_regs_29 <= Register.io_debug_regs_29 @[top.scala 59:18]
    io_regFile_regs_30 <= Register.io_debug_regs_30 @[top.scala 59:18]
    io_regFile_regs_31 <= Register.io_debug_regs_31 @[top.scala 59:18]
    io_imm <= ImmGen.io_immd_se @[top.scala 61:18]
    io_branch <= Alu.io_Branch @[top.scala 63:18]
    Alu.clock <= clock
    Alu.reset <= reset
    Alu.io_alucontrol <= AluControl.io_out @[top.scala 92:23]
    Alu.io_InA <= _GEN_40
    Alu.io_InB <= _GEN_41
    Control.clock <= clock
    Control.reset <= reset
    Control.io_opcode <= _Control_io_opcode_T @[top.scala 73:23]
    ImmGen.clock <= clock
    ImmGen.reset <= reset
    ImmGen.io_instr <= Instr_Memory.io_inst @[top.scala 75:21]
    AluControl.clock <= clock
    AluControl.reset <= reset
    AluControl.io_aluOp <= Control.io_ALUOP @[top.scala 90:25]
    AluControl.io_funct3 <= _AluControl_io_funct3_T @[top.scala 87:26]
    AluControl.io_funct7 <= _AluControl_io_funct7_T @[top.scala 88:26]
    Register.clock <= clock
    Register.reset <= reset
    Register.io_raddr1 <= _Register_io_raddr1_T @[top.scala 81:24]
    Register.io_raddr2 <= _Register_io_raddr2_T @[top.scala 82:24]
    Register.io_wen <= _GEN_44
    Register.io_waddr <= _Register_io_waddr_T @[top.scala 80:23]
    Register.io_wdata <= _GEN_43
    Instr_Memory.clock <= clock
    Instr_Memory.reset <= reset
    Instr_Memory.io_addr <= PC.io_PC_OUT @[top.scala 68:26]
    PC.clock <= clock
    PC.reset <= reset
    PC.io_PC_IN <= _GEN_47
    Jalr.clock <= clock
    Jalr.reset <= reset
    Jalr.io_in1 <= _GEN_48
    Jalr.io_in2 <= _GEN_49
    DataMemory.clock <= clock
    DataMemory.reset <= reset
    DataMemory.io_data_in <= _GEN_45
    DataMemory.io_data_selector <= UInt<1>("h0") @[top.scala 100:33]
    DataMemory.io_addr <= _GEN_42
    DataMemory.io_wr_en <= _GEN_46
