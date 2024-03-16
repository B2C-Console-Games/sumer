1000 REM ***********************************
1010 REM ***                             ***
1020 REM *** SUMER  V3.5 L2  JOHN MELLOR ***
1030 REM ***                             ***
1040 REM ***********************************
1050 REM
1060 REM LAST UPDATED: 04/05/74
1070 REM ADAPTED FROM: DICK'S VERSION ON VM/370
1080 REM
1090 REM *** "SUMER" - GOVERNMENT EXERCISE (IMAGINARY KINGDOM) ***
1100 REM *********************************************************
1110 REM * PROGRAM DOCUMENTATION BLOCK:                          *
1120 REM A  = INITIAL LAND OWNED - ACRES
1130 REM A1 = DEFENSE BUDGET
1140 REM A$ = RULER PERFORMANCE EVALUATIONS
1150 REM B  = PRE-INTEGERIZED BUDGET FIGURE
1160 REM D  = PEOPLE DEAD FROM STARVATION
1170 REM D5 = PEOPLE DEAD FROM THE PLAGUE
1180 REM D9 = CUMULATIVE DEATHS
1190 REM E1 = ELECTION CONTRIBUTION
1200 REM E2 = ELECTION FLAG (0 = NO ELECT, 1 = WIN, 2 = LOSS)
1210 REM E5 = FIRST ELECTION FLAG 0 = NO ELECTION YET
1220 REM E8 = CUMULATIVE ERROR COUNT
1230 REM E9 = ERRORS THIS YEAR
1240 REM F3 = RULER IS A FLOP FLAG (1= FLOP)
1250 REM F6 = ACRES LEFT AFTER PROPOSED SALE OF LAND
1260 REM F7 = NUMBER OF ACRES CAPABLE OF CULTIVATION
1270 REM F9 = BRIBE TO PRIESTS
1280 REM G1 = HUNGER FLAG (0 = NOT HUNGRY)
1290 REM G2 = CUMULATIVE HARVEST QUALITY
1300 REM H3 = GROSS HARVEST
1310 REM I  = NET STOREHOUSE BUSHELS
1320 REM I1 = NUMBER OF IMMIGRANTS
1330 REM I2 = INTEREST RATE
1340 REM I5 = AMOUNT OF BRIBE FOR M5
1350 REM J  = RANDOM NUMBER
1360 REM L  = AMOUNT BORROWED FROM GONZOR AND ALL HIS FRIENDS...
1370 REM N1 = ACRES PLANTED
1380 REM N2 = HARVEST DENSITY IN BUSHELS/ACRE
1390 REM N3 = NET HARVEST
1400 REM N4 = PSSSTOCK THEFT
1410 REM N5 = ACRES OWNED
1420 REM N6 = PRICE OF LAND
1430 REM N7 = NUMBER OF ACRES BOUGHT
1440 REM N8 = NUMBER OF ACRES SOLD
1450 REM N9 = FOOD ALLOCATION
1460 REM P  = POPULATION
1470 REM P1 = PLAGUE FLAG (1 = PLAGUE)
1480 REM Q  = BUDGET QUANTITY INPUT
1490 REM R  = CURRENT YEAR NUMBER (ZERO ORIGIN INDEXING)
1500 REM R9 = REVOLUTION FLAG (1 = NO REVOLUTION)
1510 REM S  = SCORE
1520 REM T  = PERFORMANCE SCORE GRADE POINTS
1530 REM W  = BAD WEATHER FLAG (1  = STORMS)
1540 REM W0 = WHO WE BORROWED FROM (INDEX INTO Z$)
1550 REM X  = LOOP INDEX
1560 REM Y  = TOTAL NUMBER OF YEARS FOR THIS GAME
1570 REM Z$ = LIST OF NAMES OF MONEYLENDERS
1580 REM
1590 DIM T(8)
1599 RANDOMIZE
1600 DIM Z$(11)
1610 A$(1) = "GHASTLY"
1620 A$(2) = "APPALLING"
1630 A$(3) = "SLUGGISH AT BEST"
1640 A$(4) = "SO-SO"
1650 A$(5) = "GOOD"
1660 A$(6) = "VERY GOOD"
1670 A$(7) = "EXCELLENT"
1680 A$(8) = "SUPER FANTASTIC"
1690 Z$(1) = "IGNARP THE HAIRLESS"
1700 Z$(5) = "GONZOR THE TOOTHLESS"
1710 Z$(10) = "THE THUMBSCREW COLLECTION AGENCY"
1720 Z$(3) = "WILVILLE AND ORBUR"
1730 Z$(8) = "TRAXLER THE WISE"
1740 Z$(4) = "THUNDERMUG THE ODIFEROUS"
1750 Z$(11) = "DICKY THE TRICKY"
1760 Z$(2) = "YGGDRASIL THE STRANGE"
1770 Z$(7) = "THE TREEFROG FINANCE COMPANY"
1780 Z$(9) = "ZARDOZ THE WICKED"
1790 Z$(6) = "SHOOGAR THE MAGICIAN"
1800 DATA 20,35,50,67,75,84,95,999
1810 DATA 400,10,0,0,0,0,750,675,10,300,2.5,750,75,400,15,40,0,1,0,5
1820 MAT READ T
1830 READ A,D,E2,E5,E8,E9,H3,I,I1,N1,N2,N3,N4,N5,N6,P,R,R9,W,Y
1840 D9 = 0
1850 F3 = 0
1860 L  = 0
1870 G1 = 0
1880 P1 = 0
1890 G2 = 0
1900 Q9 = 150
1910 B$ = CLK$
1920 CHANGE B$ TO W2
1930 W2 = W2 + 50 * RND(P)
1940 J  = INT(RND(W2)*100+1)
1950 J  = RND(J)
1960 Z  = J
1970 J  = RND( INT( SQR( Z * Z + .5)))
1980 N6 = INT( 7 * J + 13)
1990 Y  =  INT( RND(J)*5) + 8
2000 IF Y > 4 GOTO 2020
2010 Y  = 5
2020 PRINT USING 2030,Y
2030 :SUMER VERSION 1.35   (## YEARS)
2040 PRINT
2050 PRINT
2060 PRINT "MY LORD AND MASTER,"
2070 PRINT "ABSOLUTE RULER OF SUMER,"
2080 PRINT "I, YOUR HUMBLE SERVANT, THE M5 MULTITRONIC UNIT,"
2090 PRINT "BEG TO REPORT ON THE STATE OF YOUR DOMAIN..."
2100 REM
2110 REM SUBSEQUENT YEARS LOOP BACK TO NEXT STATEMENT
2120 REM
2130 PRINT "IT IS NOW YEAR"R+1" OF YOUR REIGN."
2140 PRINT "LAST YEAR" D" PE";
2150 IF D = 1 GOTO 2180
2160 PRINT "OPLE";
2170 GOTO 2190
2180 PRINT "RSON";
2190 PRINT " DIED AND"I1" IMMIGRANT";
2200 IF I1 = 1 GOTO 2220
2210 PRINT "S";
2220 PRINT " CAME INTO YOUR DOMAIN"
2230 D9 = D9 + D
2240 IF I1 > 0 GOTO 2270
2250 PRINT "(YOU'VE BEEN RECEIVING A BAD PRESS LATELY...)"
2260 GOTO 2360
2270 IF P1 = 1 GOTO 2290
2280 GOTO 2360
2290 IF I1 < 2 GOTO 2360
2300 PRINT "MOST REGRETTABLY, THEY BROUGHT WITH THEM A MYSTERIOUS PLAGUE"
2310 J  = RND(J)
2320 D5 = INT( I1 / 2 + 10 * J * I1 / P)
2330 D9 = D9 + D5
2340 P  = P - D5
2350 PRINT " AND"D5" PEOPLE DIED IN THE ENSUING EPIDEMIC."
2360 PRINT "THE PRESENT POPULATION OF SUMER IS THEREFORE"P;
2370 IF G1 = 0 GOTO 2400
2380 PRINT "HUNGRY SUBJECTS"
2390 GOTO 2410
2400 PRINT "LOYAL SUBJECTS"
2410 IF P > 9 GOTO 2460
2420 PRINT "WE WHO REMAIN HAVE DECIDED TO LEAVE FOR A HEALTHIER PLANET."
2430 PRINT "FRANKLY, MASTER, AS A RULER YOU ARE A FLOP"
2440 F3 = 1
2450 GOTO 6410
2460 PRINT
2470 IF Q9 < 150 GOTO 2490
2480 N2 = (150 * 150) / (Q9 * Q9) * N2
2490 PRINT "THE PEASANTS NOW WEIGH "Q9 "LBS."
2500 G2 = G2 + N2
2510 PRINT "WE PLANTED"N1" OF YOUR"N5" ACRES LAST YEAR"
2520 PRINT USING 2530,N2
2530 :    AND HARVESTED #.## BUSHELS PER ACRE...
2540 PRINT USING 2550,H3
2550 :THE TOTAL HARVEST WAS THEREFORE ######## BUSHELS
2560 IF W  = 0 GOTO 2690
2570 IF H3 = 0 GOTO 2600
2580 PRINT "BUT, UNFORTUNATELY, STORMS DESTROYED HALF YOUR CROP"
2590 G2 = G2 - N2 / 2
2600 W  = 0
2610 IF N4 = 0 GOTO 2670
2620 PRINT "AND";
2630 PRINT " THE PSSSTOCK";
2640 IF N4 = 0 GOTO 2720
2650 PRINT "S STOLE"N4" BUSHELS"
2660 IF W = 0 GOTO 2730
2670 PRINT "- HOWEVER";
2680 GOTO 2630
2690 IF N4 = 0 GOTO 2620
2700 PRINT "BUT";
2710 GOTO 2630
2720 PRINT " RAIDERS WERE SUCCESSFULLY REPELLED"
2730 IF L <= 0 GOTO 2960
2740 L = INT( ((100 + I2) * L) / 100)
2750 IF I >= L GOTO 2860
2760 IF I + (N5-P)*(N6/6)<L GOTO 3070
2770 PRINT "UNFORTUNATELY, YOU DO NOT HAVE ENOUGH GRAIN LEFT TO "
2780 PRINT USING 2790, Z$(W0)
2790 :REPAY YOUR DEBT TO 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
2800 PRINT "OF "L" BUSHELS. HOWEVER, IN HIS INFINITE GENEROSITY, HE HAS"
2810 PRINT "DECIDED NOT TO FORECLOSE ON OUR KINGDOM BUT WILL TAKE"
2820 PRINT "LAND IN REPAYMENT AT ONE-SIXTH THE GOING RATE (IN"
2830 PRINT "ADDITION TO THE GRAIN IN THE STOREHOUSE) UNTIL YOUR DEBT"
2840 PRINT "IS PAID."
2850 GOTO 2900
2860 PRINT USING 2870,Z$(W0)
2870 : AND 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
2880 PRINT "COLLECTED THE "L" BUSHELS  THAT YOU OWED."
2890 GOTO 2950
2900 Z8 = INT((6*(L-I)/N6)+.5)
2910 N5 = N5 - Z8
2920 PRINT "YOU THEREFORE HAVE "N5" ACRES OF LAND REMAINING."
2930 I = 0
2940 GOTO 2960
2950 I = I - L
2960 L = 0
2970 PRINT USING 2980,I
2980 :THUS YOU NOW HAVE ######## BUSHELS IN YOUR STOREHOUSE.
2990 IF E2 = 0 GOTO 3190
3000 IF E1 > 0 GOTO 3140
3010 IF E1 < 0 GOTO 3030
3020 IF E2 = 1 GOTO 3050
3030 PRINT "HOWEVER, ALAS! A RECENT COUP D'ETAT HAS DEPOSED YOU FROM OFFICE."
3040 GOTO 2430
3050 PRINT "LUCKILY, YOU MANAGED TO MAINTAIN YOUR DICTATORSHIP DURING THE YEAR."
3060 GOTO 3180
3070 PRINT USING 2980,I
3080 PRINT "HOWEVER AND ALAS! THIS IS LESS THAN THE "L" BUSHELS"
3090 PRINT USING 3100,Z$(W0)
3100 :    THAT YOU OWE 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
3110 PRINT " WE HAVE THEREFORE BEEN FORECLOSED"
3120 PRINT "   ON YOUR HAPPY KINGDOM.  YOU ARE DEPOSED."
3130 GOTO 2430
3140 IF E2 = 1 GOTO 3170
3150 PRINT "ALAS! YOU LOST THE ELECTION - IT THEREFORE SEEMS"
3160 GOTO 2430
3170 PRINT "LUCKILY, THE ELECTION GAVE YOU THE REQUIRED MAJORITY."
3180 E2 = 0
3190 PRINT
3200 REM
3210 REM TEST IF TERM OF OFFICE HAS EXPIRED
3220 REM
3230 IF R >= Y GOTO 6280
3240 IF E9 > 1 GOTO 3270
3250 IF R = INT(Y/2) GOTO 3270
3260 GOTO 3590
3270 IF E5 = 0 GOTO 3300
3280 PRINT "AGAIN"
3290 GOTO 3320
3300 PRINT "NOW";
3310 E5 = 1
3320 PRINT ", A MOVEMENT IS AFOOT TO OUST YOU FROM OFFICE AND"
3330 PRINT "YOUR ADVISERS URGE YOU TO OBTAIN A MANDATE FROM THE PEOPLE."
3340 PRINT "SHOULD YOU DECIDE TO HOLD AN ELECTION,"
3350 PRINT "YOUR CAMPAIGN WORKERS MAY BE PAID IN BUSHELS OF GRAIN:"
3360 PRINT "NOW, ";
3370 PRINT "HOW MANY (IF ANY) BUSHELS DO YOU WISH TO DISTRIBUTE IN THIS MANNER?"
3380 GOSUB 6080
3390 E1 = Q
3400 E8 = E8 + E9
3410 E9 = 0
3420 E2 = 1
3430 IF E1 = 0 GOTO 3590
3440 IF E1 > 0 GOTO 3490
3450 PRINT "OH, MASTER!! THEFT FROM THY CAMPAIGN WORKERS"
3460 PRINT "    IS A PUNISHABLE OFFENCE!"
3470 GOSUB 6180
3480 GOTO 3370
3490 IF I > E1 GOTO 3560
3500 PRINT "YOUR GENEROSITY, SIRE, IS A SOURCE OF CONTINUAL EMBARRASSMENT"
3510 PRINT USING 3520,I
3520 :TO YOUR PEOPLE...(AT THIS JUNCTURE, YOU POSSESS A MERE ######## BUSHELS)
3530 E9 = E9 + INT(.5 + RND(Q9 + E9))
3540 PRINT "PLEASE TELL ME AGAIN:"
3550 GOTO 3370
3560 PRINT "THANK YOU, SIRE...."
3570 PRINT "AN ELECTION WILL BE HELD TO STABILIZE CONFIDENCE IN YOUR REGIME."
3580 I = I - E1
3590 IF R >= 1 GOTO 3640
3600 PRINT "THE GODS DECREE THAT ONE BUSHEL IS REQUIRED TO PLANT ONE ACRE AND"
3610 PRINT "THE LAWS DECREE THAT ONE ACRE PER PERSON MUST BE SET ASIDE"
3620 PRINT "    FOR NON-AGRICULTURAL USE"
3630 PRINT
3640 IF RND(0) * 8 > 6 GOTO 3660
3650 GOTO 3920
3660 PRINT "SOOTHSAYERS ARE PROPHESYING BAD WEATHER THIS SUMMER, MASTER."
3670 W  = 1
3680 IF I > 2*P+N5+L+100 GOTO 3920
3690 PRINT "THAT'S KIND OF A ROUGH BLOW, MASTER.  IF YOU WISH, YOU MAY"
3700 PRINT "EMPLOY THE PRIESTS IN AN EFFORT TO WARD OFF THE BAD WEATHER."
3710 PRINT "NOW, HOW MANY (IF ANY) BUSHELS DO YOU WISH TO GIVE THE"
3720 PRINT "PRIESTS FOR THIS CEREMONY?"
3730 GOSUB 6080
3740 F9 = Q
3750 IF F9 > 0 GOTO 3790
3760 PRINT "DE PREESTS AIN'T GONNA LIKE BEIN TAXED, MASTER."
3770 E9 = E9 + INT( RND( J) + .5)
3780 F9 = 0
3790 IF F9 = 0 GOTO 3920
3800 IF F9<=I GOTO 3840
3810 E9=E9+INT(RND(J)+.5)
3820 PRINT "YOU AIN'T GOT THAT MUCH. I'M GONNA BLOW THE WHOLE WAD, MASTER."
3830 F9 = I
3840 PRINT "THANK YOU, EMINENCE.  THE PRIESTS WILL DO THEIR THING!"
3850 REM CALC. CHANCES OF SUCCESSFUL RAIN DANCE
3860 W = 1-(F9/P)*RND(J)
3870 W = INT(W)
3880 IF W>0 GOTO 3900
3890 W = 0
3900 IF W<1 GOTO 3920
3910 W = 1
3920 PRINT"THIS YEAR WE CAN BUY OR SELL LAND FOR"N6" BUSHELS PER ACRE."
3930 IF 5*P<N5 GOTO 3960
3940 PRINT"HOWEVER, I RESPECTFULLY REMIND YOU THAT SUMER IS BECOMING"
3950 PRINT"    RATHER OVERCROWDED, SO"
3960 PRINT "HOW MANY ACRES OF LAND DO YOU WISH TO BUY THIS YEAR?"
3970 IF N6>12 GOTO 3990
3980 PRINT "(THE PRICE IS RIGHT!)"
3990 GOSUB6080
4000 N7 = Q
4010 IF N7 = 0 GOTO 4060
4020 IF N7>0 GOTO 4160
4030 PRINT "IT IS WRITTEN THAT THOU CANST NOT BUY A NEGATIVE NUMBER OF ACRES."
4040 E9 = E9+INT(.5+RND(Q9+E9))
4050 GOTO 3960
4060 PRINT "HOW MANY ACRES DO YOU WISH TO SELL?"
4070 IF N6<20 GOTO 4090
4080 PRINT"(THE PRICE IS RIGHT!)"
4090 GOSUB6080
4100 N8 = Q
4110 IF N8 = 0 GOTO 4450
4120 IF N8>0 GOTO 4260
4130 PRINT"IT IS WRITTEN THAT THOU CANST NOT SELL A NEGATIVE NUMBER OF ACRES."
4140 E9 = E9+INT(.5+RND(Q9+E9))
4150 GOTO 4060
4160 IF I-N6*N7 = 0 GOTO 4230
4170 IF I-N6*N7>0 GOTO 4410
4180 PRINT"MUCH THOUGH I WOULD LIKE TO EFFECT THIS TRANSACTION ON YOUR BEHALF,"
4190 PRINT"MASTER, IT WOULD COST"N6*N7" BUSHELS -- WHICH IS"
4200 PRINT"MORE THAN THE"I" BUSHELS IN YOUR STOREHOUSE."
4210 PRINT"THEREFORE, PLEASE RECONSIDER:"
4220 GOTO 4040
4230 PRINT"YOU WILL HAVE NO GRAIN LEFT IN THE STOREHOUSE FOR SEED."
4240 GOSUB 6190
4250 GOTO 4040
4260 IF N5-N8 = 0 GOTO 4320
4270 IF N5-N8>P GOTO 4380
4280 IF N5>N8 GOTO 4340
4290 PRINT"GOOD GRIEF, MASTER.  YOU HAVE ONLY"N5" ACRES."
4300 GOSUB6190
4310 GOTO 4140
4320 PRINT "HEAVENS, MASTER! YOU WILL HAVE NO LAND LEFT!!"
4330 GOTO 4300
4340 F6 = N5-N8
4350 PRINT "BY GOSH, MASTER! IF"P" PEOPLE ARE CRAMMED INTO "F6" ACRES,"
4360 PRINT "THERE WILL BE TROUBLE AT THE PALACE TONIGHT!"
4370 GOTO 4300
4380 N5 = N5-N8
4390 I = I+N6*N8
4400 GOTO 4430
4410 N5 = N5+N7
4420 I = I-N6*N7
4430 PRINT"AS YOU KNOW, MASTER, THAT MEANS THERE ARE NOW"I"BUSHELS"
4440 PRINT"     STASHED IN THE STOREHOUSE."
4450 PRINT "HOW MANY BUSHELS OF GRAIN DO YOU WISH TO DISTRIBUTE AS FOOD?"
4460 GOSUB6080
4470 N9 = Q
4480 G1 = 0
4490 IF N9>= P GOTO 4620
4500 G1 = 1
4510 IF N9>= 0 GOTO 4540
4520 PRINT "I KNOW NOT THE MEANING OF NEGATIVE NUMBERS, MASTER."
4530 GOTO 4660
4540 PRINT "TYRANT!! "
4550 R9 = N9/P
4560 IF R9 = 0 GOTO 4590
4570 PRINT"MANY ";
4580 GOTO 4600
4590 PRINT"ALL THY ";
4600 PRINT "PEOPLE WILL STARVE... I SHALL LEAD THE REVOLUTION!!"
4610 E8 = E8+1
4620 IF I-N9 = 0 GOTO 4680
4630 IF I-N9>0 GOTO 4710
4640 PRINT"THINK, MASTER. YOU HAVE ONLY"I" BUSHELS LEFT IN THE ";
4650 PRINT "STOREHOUSE"
4660 E9 = E9+INT(.5+RND(Q9+E9))
4670 GOTO 4450
4680 PRINT"YOU WILL HAVE NO GRAIN LEFT IN THE STOREHOUSE FOR SEED"
4690 PRINT"SURELY I MISHEARD YOU, MASTER.  PRAY TELL ME AGAIN,"
4700 GOTO 4660
4710 Q9 = Q9*((LOG(2+N9/P))/(LOG(6)))*(SQR(150/Q9))
4720 IF N9>= 2*P GOTO 4750
4730 IF N9<P GOTO 4750
4740 PRINT"NO POINT LETTING THEM GET TOO FAT, EH MASTER?"
4750 IF N9<6*P GOTO 4780
4760 PRINT "BY GOLLY, MASTER, THY PEOPLE WILL BLOAT UP LIKE ZEPPELINS!"
4770 E9 = E9+INT(.5+RND(Q9+E9))
4780 I = I-N9
4790 PRINT"THERE ARE"N5-P"ACRES AVAILABLE FOR CULTIVATION, SIRE"
4800 PRINT "HOW MANY DO YOU WISH TO PLANT WITH SEED?"
4810 GOSUB6080
4820 N1 = Q
4830 IF N1>= 0 GOTO 4880
4840 PRINT "I KNOW NOT THE MEANING OF NEGATIVE NUMBERS, MASTER."
4850 PRINT "PRAY TELL ME AGAIN,"
4860 E9 = E9+INT(.5+RND(Q9+E9))
4870 GOTO 4800
4880 F7 = N5-P
4890 IF F7>=N1 GOTO4940
4900 PRINT " YOU DON'T HAVE THAT MUCH LAND, MASTER."
4910 E9 = E9+INT(.5+RND(Q9+E9))
4920 PRINT " BUT I'LL GIVE YOU ANOTHER CHANCE TO MAKE GOOD"
4930 GOTO 4800
4940 IF N1>F7/3 GOTO 4970
4950 PRINT "YOUR DISTASTE FOR AGRICULTURE NEVER FAILS TO AMAZE ME, SIRE"
4960 E9 = E9+INT(.5+RND(Q9+E9))
4970 IF N1>F7 GOTO 4990
4980 IF I>= N1 GOTO 5170
4990 IF F7>I GOTO 5050
5000 PRINT"COME NOW, MASTER..."
5010 PRINT"SUMER CURRENTLY HAS ONLY"F7" ACRES CAPABLE OF CULTIVATION"
5020 IF N1>N5 GOTO 4860
5030 PRINT"(YOUR PEOPLE HAVE TO LIVE SOMEWHERE)"
5040 GOTO 4860
5050 PRINT USING 5060,I
5060 :THINK, MASTER YOU HAVE ONLY ######## BUSHELS LEFT IN THE STOREHOUSE.
5070 PRINT"(REMEMBER: ONE BUSHEL PER ACRE)"
5080 IF N1-I<20 GOTO 4860
5090 W0=INT(RND(F6+F7+H3+I+P+6+J)*11+1)
5100 PRINT USING 5110,Z$(W0)
5110 :HOWEVER, YOUR NEIGHBOR 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
5120 I2 = INT(25+25*(RND(J))+INT(50*W0/11))
5130 L = N1-I
5140 PRINT" HAS AGREED TO LEND YOU THE NECESSARY "L" BUSHELS AT A MODEST"
5150 PRINT"   RATE OF "I2"% INTEREST"
5160 I = I+L
5170 IF 40*P>N1 GOTO 5240
5180 PRINT"YOUR"P" PEOPLE ARE GOING TO BE HARD-PRESSED TO PLANT"
5190 PRINT N1" ACRES THIS SPRING, MASTER, WATCH OUT!"
5200 N9 = N9+N1-50*P
5210 N9 = 50*P
5220 IF N9>0 GOTO 5240
5230 N1 =0
5240 I = I-N1
5250 IF I<1 GOTO 5430
5260 PRINT"AND HOW MANY OF YOUR"I"BUSHELS DO YOU WISH TO SPEND"
5270 PRINT"    ON PROTECTING YOUR GRAIN FROM THE PSSSTOCKS?"
5280 GOSUB6080
5290 A1 = Q
5300 IF A1>= 0 GOTO 5350
5310 PRINT"NEGATIVE NUMBERS REMAIN A COMPLETE MYSTERY TO ME, MASTER,"
5320 PRINT"CAN YOU PLEASE GIVE ME THAT FIGURE AGAIN?"
5330 E9 = E9+INT(.5+RND(Q9+E9))
5340 GOTO 5280
5350 IF I>= A1 GOTO 5490
5360 PRINT"THOU, MASTER, ART TRULY AFRAID OF THE MIGHTY PSSSTOCKS"
5370 IF I = 0 GOTO 5460
5380 PRINT USING 5390,I
5390 :HOWEVER THOU HAST A MERE ######## BUSHELS
5400 PRINT"REPOSING IN A CORNER OF YOUR STOREHOUSE..."
5410 PRINT"I SHALL PRESUME UPON YOUR DESIRE TO BLOW IT ALL ON THE OUTER"
5420 PRINT"WALLS, RATHER THAN LET IT FALL INTO THE HANDS OF THE ENEMY."
5430 A1 = I
5440 I = 0
5450 GOTO 5500
5460 PRINT"BUT THIS YEAR THY FEARS ARE UNFOUNDED,"
5470 PRINT"FOR THOU HAST LEFT NO GRAIN IN THE STOREHOUSE FOR THE THIEVES."
5480 GOTO 5430
5490 I = I-A1
5500 IF E2 = 0 GOTO 5590
5510 J = RND(J)
5520 IF J>.5 GOTO 5550
5530 J = 1-J
5540 REM CALC. CHANCE OF SURVIVING NEXT YR. WITH CONTRIB. OF E1
5550 IF R9<.5 GOTO 5570
5560 IF 2.5*J+E1/P+P/40>3 GOTO 5590
5570 E2 = 2
5580 REM CALC. HARVEST
5590 J = RND(J)
5600 N2 = 3.5*J+1.5
5610 N3 = INT(N2*N1)
5620 IF Q9<150 GOTO 5640
5630 N3 = N3*((150*150)/(Q9*Q9))
5640 H3 = N3
5650 IF W = 0 GOTO 5670
5660 N3 = INT(H3/2)
5670 J = RND(J)
5680 REM CALCULATE N4: PSSSTOCK THEFT
5690 N4 = I^2/(2*(I+A1+1))-A1*J+(N3-8*A1)/(10-N2-E9)
5700 IF N4>20 GOTO 5720
5710 N4 = 0
5720 N4 = INT(N4)
5730 I = I+N3-N4
5740 REM CALCULATE I1: NUMBER OF IMMIGRANTS
5750 I1 = R9*(N5^2*SQR(A1+N9)/(A*P^1.5)-4*E9-2*E8)
5760 I1 = INT(I1)
5770 IF I1<N5-P GOTO 5790
5780 I1=N5-P
5790 P1 = 0
5800 IF 10*RND(J)<9 GOTO 5820
5810 P1 = 1
5820 IF I1<15 GOTO 5850
5830 PRINT"A RUMOR OF SUMER'S PROSPERITY IS SPREADING TO"
5840 PRINT"NEIGHBORING COUNTRIES."
5850 J = RND(J)
5860 REM CALCULATE D: NUMBER OF DEATHS FROM STARVATION AND MISC CAUSES
5870 D = (P^2)/((2*N9+1)*(Q9*Q9)/(150*150)) + (10*E9*J) - (20*A1)/(I+1)
5880 D = D*((150*150)/(Q9*Q9))
5890 IF D>0 GOTO 5910
5900 D = 0
5910 IF P>D GOTO 5970
5920 D = (P-1)*(5+J+E9)/(6+E9)
5930 PRINT"UNDER YOUR RULE, MASTER, YOUR PEOPLE ARE FAST SICKENING"
5940 IF E8<2 GOTO 5970
5950 PRINT"AND THE INTELLIGENTSIA ARE COMMITTING SUICIDE,"
5960 PRINT"RATHER THAN SUFFER THE RESULTS OF YOUR MISTAKES"
5970 D = INT(D)
5980 P = P-D+I1
5990 REM CALC. PRICE OF LAND
6000 J = RND(J)
6010 N6 = 11*J+11
6020 N6 = INT(N6)
6030 PRINT
6040 PRINT "   (A YEAR PASSETH.....)"
6050 PRINT
6060 R = R+1
6070 GOTO 2130
6080 REM SUBROUTINE TO READ ONE BUDGET FIGURE
6090 INPUT B
6100 Q = INT(B)
6110 IF Q = B GOTO 6160
6120 PRINT "LAND O'GOSHEN,MASTER, FRACTIONS!!  MY POOR LITTLE CPU REELS"
6130 PRINT"PLEASE GIVE ME THAT NUMBER AGAIN, OH GREAT ONE"
6140 E9 = E9+INT(.5+RND(Q9+E9))
6150 GOTO 6090
6160 IF Q = -73 GOTO 6610
6170 RETURN
6180 REM SUBROUTINE TO DEDUCT 10% OF STOREHOUSE GRAIN FOR SILLY MISTAKES
6190 I5 = I/10
6200 I5 = INT(I5)
6210 PRINT"FOR A GIFT OF BUT"I5" BUSHELS, I GUARANTEE THAT NO-ONE SHALL"
6220 PRINT"EXPOSE YOUR STUPIDITY BEFORE THE POPULACE."
6230 PRINT
6240 REM
6250 I = I-I5
6260 PRINT "THANK YOU, SIRE.  NOW, PRAY TELL ME AGAIN,"
6270 RETURN
6280 PRINT USING 6290,P
6290 :HONOURED MASTER, I AND YOUR ####  LOYAL SUBJECTS,
6300 IF D9<12*Y GOTO 6330
6310 PRINT"HAVING SUFFERED FOR"R"YEARS UNDER YOUR REIGN,"
6320 GOTO 6350
6330 PRINT USING 6340,R
6340 :HAVING PROSPERED FOR ## YEARS UNDER YOUR REIGN,
6350 PRINT"HAVE ALL DECIDED TO EMIGRATE AND JOIN THE"
6360 IF P>50 GOTO 6390
6370 PRINT"JANITORIAL DEPARTMENT"
6380 GOTO 6400
6390 PRINT"RESEARCH AND DEVELOPMENT DEPARTMENT"
6400 PRINT"THAT WE MIGHT LEARN TO BE AS WISE AS THEE..."
6410 GOSUB 6620
6420 PRINT"FAREWELL"
6430 PRINT"SCORE BREAKDOWN"
6440 PRINT"---------------"
6450 C1 =INT(P*.8+.5)-22
6460 PRINT"POPULATION"C1
6470 C2 =  INT(I/40+0.5)
6480 PRINT"GRAIN     "C2
6490 C3 = INT(N5/20+0.5)
6500 PRINT"LAND      "C3
6510 C4 = -INT(E8/2+0.5)
6520 PRINT"MISTAKES  "C4
6529 Q1=-INT(G1*9+0.5)
6530 PRINT"HUNGER    "Q1
6539 Q1=-INT(Y*4+0.5)+36
6540 PRINT"YEARS     "Q1
6549 Q1=-INT((G2/(R+1))*3+0.5)+7
6550 PRINT"HARVEST   "Q1
6559 Q1=-INT(F3*50+0.5)
6560 PRINT"FLOP      "Q1
6569 Q1=-INT((D9/(R+1))*1.5+0.5)+10
6570 PRINT"DEATHS    "Q1
6580 PRINT"---------- ---"
6590 PRINT"TOTAL     "INT(S)
6600 J = RND(J)
6610 CHAIN "DSK:BASIC.BAS",20
6611 STOP
6620 S = P*.8+I/40+N5/20-E8/2-G1*9-Y*4-(G2/(R+1))*3-F3*50-(D9/(R+1))*1.5+8
6630 FOR X = 1 TO 8
6640 IF S<T(X) GOTO 6660
6650 NEXT X
6660 PRINT USING 6670,A$(X)
6670 :YOUR PERFORMANCE WAS 'LLLLLLLLLLLLLLLLLL
6680 RETURN
6690 END
