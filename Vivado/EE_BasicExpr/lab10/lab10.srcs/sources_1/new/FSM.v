module FSM(
    input clk,
    input Co2,
    input nFlag, nReset,
    output EnSample,
    output ClearInt,
    output Load,
    output SigOn, RefOn,
    output nClrCnt
    );

    wire nnFlag, nCo2;  //nFlag', nCo2'

    not not_nFlag(nnFlag, nFlag);
    not not_Co2(nCo2, Co2);

    wire Qs0d, Qs1d;            //next state
    wire Qs0, Qs1, nQs0, nQs1;  //state out
    wire Q0A1, Q0A2, Q0A3;      //Q0's ANDs
    wire Q1A1, Q1A2;            //Q1's ANDs

    // Q0d = Q1'·Q0' + Q1'·Q0·Co2' + Q1·Q0'·nFlag'
    and and_Q0_1(Q0A1, nQs1, nQs0);
    and and_Q0_2(Q0A2, nQs1, Qs0, nCo2);
    and and_Q0_3(Q0A3, Qs1, nQs0, nnFlag);
    or or_Q0(Qs0d, Q0A1, Q0A2, Q0A3);

    // Q1d = Q1'·Q0·Co2 + Q1·Q0'
    and and_Q1_1(Q1A1, nQs1, Qs0, Co2);
    and and_Q1_2(Q1A2, Qs1, nQs0);
    or or_Q1(Qs1d, Q1A1, Q1A2);

    LS74    //registers
        Q0(
            .CLK(clk), .CLR_L(nReset), .PR_L(1),
            .D(Qs0d), .Q(Qs0), .QN(nQs0)
        ),
        Q1( 
            .CLK(clk), .CLR_L(nReset), .PR_L(1),
            .D(Qs1d), .Q(Qs1), .QN(nQs1)
        );
    
    // wiring for outputs
    wire ES_1, ES_2, ES, SO, RO, LD, nCC_1, nCC_2, nCC;
    
    // EnSample = Q1'·Q0' + Q1·Q0
    and and_ES_1(ES_1, nQs1, nQs0);
    and and_ES_2(ES_2, Qs1, Qs0);
    or or_ES(EnSample, ES_1, ES_2);

    assign ClearInt = EnSample; //ClearInt has the same output as EnSample

    // SigOn = Q1'·Q0
    and and_SO(SigOn, nQs1, Qs0);

    // RefOn = Q1·Q0'
    and and_RO(RefOn, Qs1, nQs0);

    // Load = Q1·Q0
    and and_LD(Load, Qs1, Qs0);

    // nClrCnt = Q1'·Q0 + Q1·Q0'
    and and_nCC_1(nCC_1, nQs1, Qs0);
    and and_nCC_2(nCC_2, Qs1, nQs0);
    or or_nCC(nClrCnt, nCC_1, nCC_2);

endmodule
