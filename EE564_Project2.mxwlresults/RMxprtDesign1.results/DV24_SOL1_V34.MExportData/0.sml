//         Left: A B C N
//        Right: ROT1 ROT2 Pos

// A           : Phase A
// B           : Phase B
// C           : Phase C
// N           : Neutral
// ROT1        : Mechanical plus
// ROT2        : Mechanical minus
// Pos         : Position

MODELDEF Setup1
{
PORT electrical: A;
PORT electrical: B;
PORT electrical: C;
PORT electrical: N;
PORT ROTATIONAL_V: ROT1;
PORT ROTATIONAL_V: ROT2;
PORT REAL OUT ANGLE[deg]: Pos = VM_Pos.V;
PORT REAL IN ANGLE[deg]: IniPos = 0;

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=1.#INF ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=1.#INF ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=1.#INF ); 
UMODEL Transformation_3To2 AB0 NAP:=N0_1, NAN:=N, NBP:=N0_2, NBN:=N, NCP:=N0_3, NCN:=N, NALPHA:=alpha, NBETA:=beta, NZERO:=zero () SRC: DLL( File:="Transformation.dll");

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
INTERN  L        L2d  N1:=N_9, N2:=N_8  ( L:=N_42.V, I0:=0 ); 
INTERN  R        R2d  N1:=N_10, N2:=N_9  ( R:=0.0122098 ); 
INTERN  E        B2d  N1:=N_10, N2:=N_11  ( EMF:=2 * N_42.V * N_4.V * L2q.I, PARTDERIV:=1 ); 
INTERN  L        L2td  N1:=N_12, N2:=N_11  ( L:=5.36087e-006, I0:=0 ); 
INTERN  L        L2bd  N1:=N_13, N2:=N_11  ( L:=1.41562e-005, I0:=0 ); 
INTERN  M        K2d  ( L1:= L2td.L, L2:= L2bd.L, K:=0.736783 ); 
INTERN  R        R2td  N1:=N_14, N2:=N_12  ( R:=0.0127113 ); 
INTERN  R        R2bd  N1:=N_15, N2:=N_13  ( R:=0.00544766 ); 
INTERN  E        B2ttd  N1:=N_14, N2:=N_16  ( EMF:=1.07217e-005 * N_4.V * L2tq.I, PARTDERIV:=1 ); 
INTERN  E        B2btd  N1:=N_15, N2:=N_17  ( EMF:=1.28369e-005 * N_4.V * L2tq.I, PARTDERIV:=1 ); 
INTERN  E        B2tbd  N1:=N_16, N2:=N_18  ( EMF:=1.28369e-005 * N_4.V * L2bq.I, PARTDERIV:=1 ); 
INTERN  E        B2bbd  N1:=N_17, N2:=N_18  ( EMF:=2.83124e-005 * N_4.V * L2bq.I, PARTDERIV:=1 ); 
INTERN  E        Bmd  N1:=N_18, N2:=GND  ( EMF:=2 * N_43.V * N_4.V * Lmq.I, PARTDERIV:=1 ); 
INTERN  L        L1q  N1:=N_2, N2:=N_28  ( L:=N_41.V, I0:=0 ); 
INTERN  L        Lmq  N1:=N_28, N2:=GND  ( L:=N_43.V, I0:=0 ); 
INTERN  L        L2q  N1:=N_29, N2:=N_28  ( L:=N_42.V, I0:=0 ); 
INTERN  R        R2q  N1:=N_30, N2:=N_29  ( R:=0.0122098 ); 
INTERN  E        B2q  N1:=N_30, N2:=N_31  ( EMF:=-2 * N_42.V * N_4.V * L2d.I, PARTDERIV:=1 ); 
INTERN  L        L2tq  N1:=N_32, N2:=N_31  ( L:=5.36087e-006, I0:=0 ); 
INTERN  L        L2bq  N1:=N_33, N2:=N_31  ( L:=1.41562e-005, I0:=0 ); 
INTERN  M        K2q  ( L1:= L2tq.L, L2:= L2bq.L, K:=0.736783 ); 
INTERN  R        R2tq  N1:=N_34, N2:=N_32  ( R:=0.0127113 ); 
INTERN  R        R2bq  N1:=N_35, N2:=N_33  ( R:=0.00544766 ); 
INTERN  E        B2ttq  N1:=N_34, N2:=N_36  ( EMF:=-1.07217e-005 * N_4.V * L2td.I, PARTDERIV:=1 ); 
INTERN  E        B2btq  N1:=N_35, N2:=N_37  ( EMF:=-1.28369e-005 * N_4.V * L2td.I, PARTDERIV:=1 ); 
INTERN  E        B2tbq  N1:=N_36, N2:=N_38  ( EMF:=-1.28369e-005 * N_4.V * L2bd.I, PARTDERIV:=1 ); 
INTERN  E        B2bbq  N1:=N_37, N2:=N_38  ( EMF:=-2.83124e-005 * N_4.V * L2bd.I, PARTDERIV:=1 ); 
INTERN  E        Bmq  N1:=N_38, N2:=GND  ( EMF:=-2 * N_43.V * N_4.V * Lmd.I, PARTDERIV:=1 ); 
INTERN  L        L0  N1:=N_3, N2:=GND  ( L:=1.#QNAN, I0:=0 ); 
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
.MODEL Setup1_l1_table pwl TABLE=( 51, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN) CONSTANT NOSPLINE" );
INTERN  VM       VM_L2  N1:=N_42, N2:=GND  ; 
INTERN  NDSRC    PL2 N0:=N_42, N1:=GND  ( QUANT:={N_39.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_l2_table pwl TABLE=( 51, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN) CONSTANT NOSPLINE" );
INTERN  VM       VM_Lm  N1:=N_43, N2:=GND  ; 
INTERN  NDSRC    PLm N0:=N_43, N1:=GND  ( QUANT:={N_40.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_lm_table pwl TABLE=( 51, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN, 1.#QNAN,\
 1.#QNAN, 1.#QNAN) CONSTANT NOSPLINE" );
}

}
