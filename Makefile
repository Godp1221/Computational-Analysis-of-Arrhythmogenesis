all: SingleCell OneD TwoD

common = SingleCell/Cell.cc  SingleCell/TPORd.cc SingleCell/TP06.h SingleCell/TP06.cc

CC  	=	g++

CFLAGS	=	-w -O3 #-g:warning output to screen   -w:warning ignored

CFLAGS2	=	-fopenmp

CFLAGS3 =   -arch sm_61 -Xptxas -dlcm=cg

Initialization: $(common) Initialization.cc
	$(CC) $(CFLAGS) -o model_initialization $(common) Initialization.cc

SingleCell: $(common) SingleCell.cc
	$(CC) $(CFLAGS) -o model_SingleCell $(common) SingleCell.cc

SingleCell_ERP: $(common) SingleCell_ERP.cc
	$(CC) $(CFLAGS) -o model_SingleCell_ERP $(common) SingleCell_ERP.cc

OneD_VW: $(common) OneD_VW.cc
	$(CC) $(CFLAGS) $(CFLAGS2) -o model_oned_VW $(common) OneD_VW.cc

OneD: $(common) OneD.cc
	$(CC) $(CFLAGS) $(CFLAGS2) -o model_oned $(common) OneD.cc

OneD_BCL: $(common) OneD_differentBCL.cc
	$(CC) $(CFLAGS) $(CFLAGS2) -o model_oned_BCL $(common) OneD_differentBCL.cc

ThreeD: $(common) ThreeD.cc
	$(CC) $(CFLAGS) $(CFLAGS2) -o model_threed $(common) ThreeD.cc


clean:
	rm model_*
