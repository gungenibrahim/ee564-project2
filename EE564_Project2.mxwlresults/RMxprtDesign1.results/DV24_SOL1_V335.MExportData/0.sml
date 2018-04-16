//         Left: A B C 
//        Right: ROT1 ROT2 Pos

// A           : Phase A
// B           : Phase B
// C           : Phase C
// ROT1        : Mechanical plus
// ROT2        : Mechanical minus
// Pos         : Position

MODELDEF Setup1
{
PORT electrical: A;
PORT electrical: B;
PORT electrical: C;
PORT ROTATIONAL_V: ROT1;
PORT ROTATIONAL_V: ROT2;
PORT REAL OUT ANGLE[deg]: Pos = VM_Pos.V;
PORT REAL IN ANGLE[deg]: IniPos = 0;

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=6.06717 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=6.06717 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=6.06717 ); 
UMODEL Transformation_3To2 AB0 NAP:=N0_1, NAN:=C, NBP:=N0_2, NBN:=A, NCP:=N0_3, NCN:=B, NALPHA:=alpha, NBETA:=beta, NZERO:=zero () SRC: DLL( File:="Transformation.dll");

INTERN  EV       Speed  N1:=NM_1, N2:=GND  ( QUANT:=Torq.V, FACT:=1 ); 
INTERN  II       Torq  N1:=NM_6, N2:=NM_5  ( QUANT:=Speed.I, FACT:=1 ); 
UMODEL D2D D2D1 N1:=NM_5, N2:=ROT1 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
UMODEL D2D D2D2 N1:=NM_6, N2:=ROT2 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
INTERN  VM       VM_Pos  N1:=NM_2, N2:=GND  ; 
MODEL Setup1_AB0 model1 N_1:=alpha, N_2:=beta, N_3:=zero, N_4:=NM_1, N_5:=NM_2 ( pos0:=IniPos );


//         Left: N_1 N_2 N_3
//        Right: N_4 N_5

MODELDEF Setup1_AB0
{
PORT electrical: N_1;
PORT electrical: N_4;
PORT electrical: N_2;
PORT electrical: N_5;
PORT electrical: N_3;
PORT REAL IN: pos0 = 0;

INTERN  L        L1d  N1:=N_1, N2:=N_8  ( L:=N_41.V, I0:=0 ); 
INTERN  L        Lmd  N1:=N_8, N2:=GND  ( L:=N_43.V, I0:=0 ); 
INTERN  R        Rfed  N1:=N_8, N2:=GND  ( R:=1.25333e+008 ); 
INTERN  L        L2d  N1:=N_9, N2:=N_8  ( L:=N_42.V, I0:=0 ); 
INTERN  R        R2d  N1:=N_10, N2:=N_9  ( R:=2126.36 ); 
INTERN  E        B2d  N1:=N_10, N2:=N_11  ( EMF:=2 * N_42.V * N_4.V * L2q.I, PARTDERIV:=1 ); 
INTERN  L        L2td  N1:=N_12, N2:=N_11  ( L:=0.00543995, I0:=0 ); 
INTERN  L        L2bd  N1:=N_13, N2:=N_11  ( L:=0.014365, I0:=0 ); 
INTERN  M        K2d  ( L1:= L2td.L, L2:= L2bd.L, K:=0.736783 ); 
INTERN  R        R2td  N1:=N_14, N2:=N_12  ( R:=12.4955 ); 
INTERN  R        R2bd  N1:=N_15, N2:=N_13  ( R:=5.35522 ); 
INTERN  E        B2ttd  N1:=N_14, N2:=N_16  ( EMF:=0.0108799 * N_4.V * L2tq.I, PARTDERIV:=1 ); 
INTERN  E        B2btd  N1:=N_15, N2:=N_17  ( EMF:=0.0130263 * N_4.V * L2tq.I, PARTDERIV:=1 ); 
INTERN  E        B2tbd  N1:=N_16, N2:=N_18  ( EMF:=0.0130263 * N_4.V * L2bq.I, PARTDERIV:=1 ); 
INTERN  E        B2bbd  N1:=N_17, N2:=N_18  ( EMF:=0.0287301 * N_4.V * L2bq.I, PARTDERIV:=1 ); 
INTERN  E        Bmd  N1:=N_18, N2:=GND  ( EMF:=2 * N_43.V * N_4.V * Lmq.I, PARTDERIV:=1 ); 
INTERN  L        L1q  N1:=N_2, N2:=N_28  ( L:=N_41.V, I0:=0 ); 
INTERN  L        Lmq  N1:=N_28, N2:=GND  ( L:=N_43.V, I0:=0 ); 
INTERN  R        Rfeq  N1:=N_28, N2:=GND  ( R:=1.25333e+008 ); 
INTERN  L        L2q  N1:=N_29, N2:=N_28  ( L:=N_42.V, I0:=0 ); 
INTERN  R        R2q  N1:=N_30, N2:=N_29  ( R:=2126.36 ); 
INTERN  E        B2q  N1:=N_30, N2:=N_31  ( EMF:=-2 * N_42.V * N_4.V * L2d.I, PARTDERIV:=1 ); 
INTERN  L        L2tq  N1:=N_32, N2:=N_31  ( L:=0.00543995, I0:=0 ); 
INTERN  L        L2bq  N1:=N_33, N2:=N_31  ( L:=0.014365, I0:=0 ); 
INTERN  M        K2q  ( L1:= L2tq.L, L2:= L2bq.L, K:=0.736783 ); 
INTERN  R        R2tq  N1:=N_34, N2:=N_32  ( R:=12.4955 ); 
INTERN  R        R2bq  N1:=N_35, N2:=N_33  ( R:=5.35522 ); 
INTERN  E        B2ttq  N1:=N_34, N2:=N_36  ( EMF:=-0.0108799 * N_4.V * L2td.I, PARTDERIV:=1 ); 
INTERN  E        B2btq  N1:=N_35, N2:=N_37  ( EMF:=-0.0130263 * N_4.V * L2td.I, PARTDERIV:=1 ); 
INTERN  E        B2tbq  N1:=N_36, N2:=N_38  ( EMF:=-0.0130263 * N_4.V * L2bd.I, PARTDERIV:=1 ); 
INTERN  E        B2bbq  N1:=N_37, N2:=N_38  ( EMF:=-0.0287301 * N_4.V * L2bd.I, PARTDERIV:=1 ); 
INTERN  E        Bmq  N1:=N_38, N2:=GND  ( EMF:=-2 * N_43.V * N_4.V * Lmd.I, PARTDERIV:=1 ); 
INTERN  L        L0  N1:=N_3, N2:=GND  ( L:=0.014506, I0:=0 ); 
INTERN  I        BT  N1:=GND, N2:=N_4  ( IS:=2 * N_43.V * (L2d.I*Lmq.I - L2q.I*Lmd.I), PARTDERIV:=1 ); 
INTERN  VM       VM_Speed  N1:=N_4, N2:=GND  ; 
INTERN  IV       Gx  N1:=GND, N2:=N_55  ( QUANT:=VM_Speed.V, FACT:=1 ); 
INTERN  C        Cx  N1:=N_55, N2:=GND  ( C:=1, V0:=pos0*0.0174533 ); 
INTERN  VM       VM_Pos  N1:=N_55, N2:=GND  ; 
INTERN  EV       Ex2  N1:=GND, N2:=N_5  ( QUANT:=VM_Pos.V, FACT:=57.2958 ); 
INTERN  E        BIsr  N1:=GND, N2:=N_39  ( EMF:=sqrt(L1d.I*L1d.I + L1q.I*L1q.I), PARTDERIV:=1 ); 
INTERN  VM       VM_Isr  N1:=N_39, N2:=GND  ; 
INTERN  E        BIm  N1:=GND, N2:=N_40  ( EMF:=sqrt(Lmd.I*Lmd.I + Lmq.I*Lmq.I), PARTDERIV:=1 ); 
INTERN  VM       VM_Im  N1:=N_40, N2:=GND  ; 
INTERN  VM       VM_L1  N1:=N_41, N2:=GND  ; 
INTERN  NDSRC    PL1 N0:=N_41, N1:=GND  ( QUANT:={N_39.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_l1_table pwl TABLE=( 51, 0, 0.00428859, 0.00857718, 0.0128658,\
 0.0171544, 0.021443, 0.0257315, 0.0300201, 0.0343087, 0.0385973, 0.0428859,\
 0.0471745, 0.0514631, 0.0557517, 0.0600403, 0.0643289, 0.0686174, 0.072906,\
 0.0771946, 0.0814832, 0.0857718, 0.0900604, 0.094349, 0.0986376, 0.102926,\
 0.107215, 0.111503, 0.115792, 0.120081, 0.124369, 0.128658, 0.132946,\
 0.137235, 0.141523, 0.145812, 0.150101, 0.154389, 0.158678, 0.162966,\
 0.167255, 0.171544, 0.175832, 0.180121, 0.184409, 0.188698, 0.192987,\
 0.197275, 0.201564, 0.205852, 0.210141, 0.21443, 1, 0.0145254, 0.0145254,\
 0.0145254, 0.0145253, 0.0145253, 0.0145253, 0.0145252, 0.0145252, 0.0145251,\
 0.0145251, 0.0145251, 0.014525, 0.014525, 0.0145249, 0.0145249, 0.0145249,\
 0.0145248, 0.0145248, 0.0145248, 0.0145247, 0.0145247, 0.0145246, 0.0145246,\
 0.0145246, 0.0145245, 0.0145245, 0.0145244, 0.0145244, 0.0145244, 0.0145243,\
 0.0145243, 0.0145242, 0.0145242, 0.0145242, 0.0145241, 0.0145241, 0.0145241,\
 0.014524, 0.014524, 0.0145239, 0.0145239, 0.0145239, 0.0145238, 0.0145238,\
 0.0145237, 0.0145237, 0.0145237, 0.0145236, 0.0145236, 0.0145236, 0.0145235)\
 CONSTANT NOSPLINE" );
INTERN  VM       VM_L2  N1:=N_42, N2:=GND  ; 
INTERN  NDSRC    PL2 N0:=N_42, N1:=GND  ( QUANT:={N_39.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_l2_table pwl TABLE=( 51, 0, 0.00428859, 0.00857718, 0.0128658,\
 0.0171544, 0.021443, 0.0257315, 0.0300201, 0.0343087, 0.0385973, 0.0428859,\
 0.0471745, 0.0514631, 0.0557517, 0.0600403, 0.0643289, 0.0686174, 0.072906,\
 0.0771946, 0.0814832, 0.0857718, 0.0900604, 0.094349, 0.0986376, 0.102926,\
 0.107215, 0.111503, 0.115792, 0.120081, 0.124369, 0.128658, 0.132946,\
 0.137235, 0.141523, 0.145812, 0.150101, 0.154389, 0.158678, 0.162966,\
 0.167255, 0.171544, 0.175832, 0.180121, 0.184409, 0.188698, 0.192987,\
 0.197275, 0.201564, 0.205852, 0.210141, 0.21443, 1, 0.0187096, 0.0187094,\
 0.0187092, 0.018709, 0.0187089, 0.0187087, 0.0187085, 0.0187083, 0.0187081,\
 0.018708, 0.0187078, 0.0187076, 0.0187074, 0.0187073, 0.0187071, 0.0187069,\
 0.0187067, 0.0187065, 0.0187064, 0.0187062, 0.018706, 0.0187058, 0.0187057,\
 0.0187055, 0.0187053, 0.0187051, 0.0187049, 0.0187048, 0.0187046, 0.0187044,\
 0.0187042, 0.0187041, 0.0187039, 0.0187037, 0.0187035, 0.0187033, 0.0187032,\
 0.018703, 0.0187028, 0.0187026, 0.0187024, 0.0187023, 0.0187021, 0.0187019,\
 0.0187017, 0.0187016, 0.0187014, 0.0187012, 0.018701, 0.0187008, 0.0187007)\
 CONSTANT NOSPLINE" );
INTERN  VM       VM_Lm  N1:=N_43, N2:=GND  ; 
INTERN  NDSRC    PLm N0:=N_43, N1:=GND  ( QUANT:={N_40.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_lm_table pwl TABLE=( 51, 0, 0.0540119, 0.108024, 0.162036,\
 0.216047, 0.270059, 0.319652, 0.36475, 0.408008, 0.450515, 0.491326, 0.533376,\
 0.576828, 0.621416, 0.666118, 0.710459, 0.75435, 0.79822, 0.841667, 0.885137,\
 0.928865, 0.974889, 1.02091, 1.06915, 1.12148, 1.17622, 1.23062, 1.28985,\
 1.35389, 1.41448, 1.46723, 1.52219, 1.58033, 1.638, 1.70353, 1.78668, 1.86776,\
 1.95923, 2.06727, 2.16981, 2.27634, 2.95869, 4.89992, 9.16697, 19.496,\
 30.0672, 42.0231, 54.582, 67.9906, 82.0179, 96.2286, 1, 0.561415, 0.561415,\
 0.561415, 0.561415, 0.561415, 0.561415, 0.569178, 0.581937, 0.594559,\
 0.605768, 0.617168, 0.625363, 0.630825, 0.634358, 0.63731, 0.640215, 0.643162,\
 0.645802, 0.648493, 0.650904, 0.652907, 0.653187, 0.653442, 0.652324,\
 0.648923, 0.644501, 0.640655, 0.634743, 0.627118, 0.62169, 0.620009, 0.617542,\
 0.614009, 0.610906, 0.605204, 0.594011, 0.584461, 0.57265, 0.557392, 0.545026,\
 0.53284, 0.450948, 0.297047, 0.172009, 0.0870995, 0.0605105, 0.0461812,\
 0.0377775, 0.0321112, 0.0280982, 0.0252092) CONSTANT NOSPLINE" );
}

}
