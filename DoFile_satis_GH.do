
**********************************************************
*************** PRE PROCESAMIENTO DE DATOS ***************
**********************************************************

br
drop DC

count // 178

codebook Puntuación // No missing
tab Puntuación // No será utilizado

codebook Accedoaserpartícipevoluntari // No missing
tab Accedoaserpartícipevoluntari // 9 no desean participar
list Accedoaserpartícipevoluntari if Accedoaserpartícipevoluntari=="No deseo participar en la presente investigación"
drop if Accedoaserpartícipevoluntari=="No deseo participar en la presente investigación"
codebook Accedoaserpartícipevoluntari // No missing
tab Accedoaserpartícipevoluntari // Ahora hay 169

codebook Heleídooalguienmehaleído
tab Heleídooalguienmehaleído // 169 desean participar

codebook CondicióndelEncuestado // No missing
tab CondicióndelEncuestado

codebook EdaddelEncuestado
tab EdaddelEncuestado
replace EdaddelEncuestado="43" if EdaddelEncuestado=="43 años"
replace EdaddelEncuestado="50" if EdaddelEncuestado=="50 años"
replace EdaddelEncuestado="51" if EdaddelEncuestado=="51 años" | EdaddelEncuestado=="51 años " | EdaddelEncuestado=="51años"
replace EdaddelEncuestado="55" if EdaddelEncuestado=="55 años"
replace EdaddelEncuestado="56" if EdaddelEncuestado=="56 años"
replace EdaddelEncuestado="61" if EdaddelEncuestado=="61 años"
replace EdaddelEncuestado="62" if EdaddelEncuestado=="62 años"
replace EdaddelEncuestado="66" if EdaddelEncuestado=="66 años"
replace EdaddelEncuestado="67" if EdaddelEncuestado=="67 años"
replace EdaddelEncuestado="73" if EdaddelEncuestado=="73 años"
replace EdaddelEncuestado="78" if EdaddelEncuestado=="78 años"
replace EdaddelEncuestado="" if EdaddelEncuestado=="Acompañante" | EdaddelEncuestado=="En tratamiento " | EdaddelEncuestado=="____@gmail.com" 
tab EdaddelEncuestado
destring EdaddelEncuestado, replace
codebook EdaddelEncuestado // 3 datos perdidos
tab EdaddelEncuestado
hist EdaddelEncuestado, normal // Es NORMAL
swilk EdaddelEncuestado // Es NORMAL
tabstat EdaddelEncuestado, s(mean sd count)
	// Mean: 48.93976  sd:10.69619       n=166

codebook Sexo // No missing
tab Sexo

codebook NiveldeEstudios // No missing
tab NiveldeEstudios

codebook MotivodelaConsulta // No missing
tab MotivodelaConsulta

codebook Especialidaddondefueatendido // No missing
tab Especialidaddondefueatendido


// 1. EXPECTATIVAS PRESENCIAL

codebook Queelpersonaldeinformesl // No missing
rename Queelpersonaldeinformesl p_e1
codebook p_e1
tab p_e1
gen p_e1_numeric = p_e1
order p_e1_numeric, after(p_e1)
replace p_e1_numeric="1" if p_e1=="1– Totalmente en desacuerdo"
replace p_e1_numeric="2" if p_e1=="2- En desacuerdo"
replace p_e1_numeric="3" if p_e1=="3 -Parcialmente en desacuerdo"
replace p_e1_numeric="4" if p_e1=="4- Neutro"
replace p_e1_numeric="5" if p_e1=="5 -Parcialmente de acuerdo"
replace p_e1_numeric="6" if p_e1=="6- De acuerdo"
replace p_e1_numeric="7" if p_e1=="7 -Totalmente de acuerdo"
tab p_e1_numeric
destring p_e1_numeric, replace
tab p_e1_numeric
label define serv 1 "1– Totalmente en desacuerdo" 2 "2- En desacuerdo" 3 "3 -Parcialmente en desacuerdo" 4 "4- Neutro" 5 "5 -Parcialmente de acuerdo" 6 "6- De acuerdo" 7 "7 -Totalmente de acuerdo"
label value p_e1_numeric serv
tab p_e1_numeric

codebook Quelaatenciónpresencialco // No missing
rename Quelaatenciónpresencialco p_e2
codebook p_e2
tab p_e2
encode p_e2, gen(p_e2_numeric)
order p_e2_numeric, after(p_e2)
tab p_e2_numeric

codebook Quelaatenciónpresencialse // No missing
rename Quelaatenciónpresencialse p_e3
codebook p_e3
tab p_e3
encode p_e3, gen(p_e3_numeric)
order p_e3_numeric, after(p_e3)
tab p_e3_numeric

codebook Quesuhistoriaclínicaseen // No missing
rename Quesuhistoriaclínicaseen p_e4
codebook p_e4
tab p_e4
gen p_e4_numeric = p_e4
order p_e4_numeric, after(p_e4)
replace p_e4_numeric="1" if p_e4=="1– Totalmente en desacuerdo"
replace p_e4_numeric="2" if p_e4=="2- En desacuerdo"
replace p_e4_numeric="3" if p_e4=="3 -Parcialmente en desacuerdo"
replace p_e4_numeric="4" if p_e4=="4- Neutro"
replace p_e4_numeric="5" if p_e4=="5 -Parcialmente de acuerdo"
replace p_e4_numeric="6" if p_e4=="6- De acuerdo"
replace p_e4_numeric="7" if p_e4=="7 -Totalmente de acuerdo"
tab p_e4_numeric
destring p_e4_numeric, replace
tab p_e4_numeric
label value p_e4_numeric serv
tab p_e4_numeric

codebook Quelascitasseencuentrend // No missing
rename Quelascitasseencuentrend p_e5
codebook p_e5
tab p_e5
encode p_e5, gen(p_e5_numeric)
order p_e5_numeric, after(p_e5)
tab p_e5_numeric

codebook Quelaatenciónenelmódulo // No missing
rename Quelaatenciónenelmódulo p_e6
codebook p_e6
tab p_e6
gen p_e6_numeric = p_e6
order p_e6_numeric, after(p_e6)
replace p_e6_numeric="1" if p_e6=="1– Totalmente en desacuerdo"
replace p_e6_numeric="2" if p_e6=="2- En desacuerdo"
replace p_e6_numeric="3" if p_e6=="3 -Parcialmente en desacuerdo"
replace p_e6_numeric="4" if p_e6=="4- Neutro"
replace p_e6_numeric="5" if p_e6=="5 -Parcialmente de acuerdo"
replace p_e6_numeric="6" if p_e6=="6- De acuerdo"
replace p_e6_numeric="7" if p_e6=="7 -Totalmente de acuerdo"
tab p_e6_numeric
destring p_e6_numeric, replace
tab p_e6_numeric
label value p_e6_numeric serv
tab p_e6_numeric

codebook Quelaatenciónparaprograma // No missing
rename Quelaatenciónparaprograma p_e7
codebook p_e7
tab p_e7
encode p_e7, gen(p_e7_numeric)
order p_e7_numeric, after(p_e7)
tab p_e7_numeric

codebook T // No missing
rename T p_e8
codebook p_e8
tab p_e8
gen p_e8_numeric = p_e8
order p_e8_numeric, after(p_e8)
replace p_e8_numeric="1" if p_e8=="1– Totalmente en desacuerdo"
replace p_e8_numeric="2" if p_e8=="2- En desacuerdo"
replace p_e8_numeric="3" if p_e8=="3 -Parcialmente en desacuerdo"
replace p_e8_numeric="4" if p_e8=="4- Neutro"
replace p_e8_numeric="5" if p_e8=="5 -Parcialmente de acuerdo"
replace p_e8_numeric="6" if p_e8=="6- De acuerdo"
replace p_e8_numeric="7" if p_e8=="7 -Totalmente de acuerdo"
tab p_e8_numeric
destring p_e8_numeric, replace
tab p_e8_numeric
label value p_e8_numeric serv
tab p_e8_numeric

codebook Quelaatenciónyentregade // No missing
rename Quelaatenciónyentregade p_e9
codebook p_e9
tab p_e9
gen p_e9_numeric = p_e9
order p_e9_numeric, after(p_e9)
replace p_e9_numeric="1" if p_e9=="1– Totalmente en desacuerdo"
replace p_e9_numeric="2" if p_e9=="2- En desacuerdo"
replace p_e9_numeric="3" if p_e9=="3 -Parcialmente en desacuerdo"
replace p_e9_numeric="4" if p_e9=="4- Neutro"
replace p_e9_numeric="5" if p_e9=="5 -Parcialmente de acuerdo"
replace p_e9_numeric="6" if p_e9=="6- De acuerdo"
replace p_e9_numeric="7" if p_e9=="7 -Totalmente de acuerdo"
tab p_e9_numeric
destring p_e9_numeric, replace
tab p_e9_numeric
label value p_e9_numeric serv
tab p_e9_numeric

codebook Quedurantesuatenciónpres // No missing
rename Quedurantesuatenciónpres p_e10
codebook p_e10
tab p_e10
gen p_e10_numeric = p_e10
order p_e10_numeric, after(p_e10)
replace p_e10_numeric="1" if p_e10=="1– Totalmente en desacuerdo"
replace p_e10_numeric="2" if p_e10=="2- En desacuerdo"
replace p_e10_numeric="3" if p_e10=="3 -Parcialmente en desacuerdo"
replace p_e10_numeric="4" if p_e10=="4- Neutro"
replace p_e10_numeric="5" if p_e10=="5 -Parcialmente de acuerdo"
replace p_e10_numeric="6" if p_e10=="6- De acuerdo"
replace p_e10_numeric="7" if p_e10=="7 -Totalmente de acuerdo"
tab p_e10_numeric
destring p_e10_numeric, replace
tab p_e10_numeric
label value p_e10_numeric serv
tab p_e10_numeric

codebook Queelmédicolerealiceun // No missing
rename Queelmédicolerealiceun p_e11
codebook p_e11
tab p_e11
gen p_e11_numeric = p_e11
order p_e11_numeric, after(p_e11)
replace p_e11_numeric="1" if p_e11=="1– Totalmente en desacuerdo"
replace p_e11_numeric="2" if p_e11=="2- En desacuerdo"
replace p_e11_numeric="3" if p_e11=="3 -Parcialmente en desacuerdo"
replace p_e11_numeric="4" if p_e11=="4- Neutro"
replace p_e11_numeric="5" if p_e11=="5 -Parcialmente de acuerdo"
replace p_e11_numeric="6" if p_e11=="6- De acuerdo"
replace p_e11_numeric="7" if p_e11=="7 -Totalmente de acuerdo"
tab p_e11_numeric
destring p_e11_numeric, replace
tab p_e11_numeric
label value p_e11_numeric serv
tab p_e11_numeric

codebook Queelmédicolebrindeelt // No missing
rename Queelmédicolebrindeelt p_e12
codebook p_e12
tab p_e12
gen p_e12_numeric = p_e12
order p_e12_numeric, after(p_e12)
replace p_e12_numeric="1" if p_e12=="1– Totalmente en desacuerdo"
replace p_e12_numeric="2" if p_e12=="2- En desacuerdo"
replace p_e12_numeric="3" if p_e12=="3 -Parcialmente en desacuerdo"
replace p_e12_numeric="4" if p_e12=="4- Neutro"
replace p_e12_numeric="5" if p_e12=="5 -Parcialmente de acuerdo"
replace p_e12_numeric="6" if p_e12=="6- De acuerdo"
replace p_e12_numeric="7" if p_e12=="7 -Totalmente de acuerdo"
tab p_e12_numeric
destring p_e12_numeric, replace
tab p_e12_numeric
label value p_e12_numeric serv
tab p_e12_numeric

codebook Queelmédicoqueatenderás // No missing
rename Queelmédicoqueatenderás p_e13
codebook p_e13
tab p_e13
gen p_e13_numeric = p_e13
order p_e13_numeric, after(p_e13)
replace p_e13_numeric="1" if p_e13=="1– Totalmente en desacuerdo"
replace p_e13_numeric="2" if p_e13=="2- En desacuerdo"
replace p_e13_numeric="3" if p_e13=="3 -Parcialmente en desacuerdo"
replace p_e13_numeric="4" if p_e13=="4- Neutro"
replace p_e13_numeric="5" if p_e13=="5 -Parcialmente de acuerdo"
replace p_e13_numeric="6" if p_e13=="6- De acuerdo"
replace p_e13_numeric="7" if p_e13=="7 -Totalmente de acuerdo"
tab p_e13_numeric
destring p_e13_numeric, replace
tab p_e13_numeric
label value p_e13_numeric serv
tab p_e13_numeric

codebook Queelpersonaldeatención // No missing
rename Queelpersonaldeatención p_e14
codebook p_e14
tab p_e14
gen p_e14_numeric = p_e14
order p_e14_numeric, after(p_e14)
replace p_e14_numeric="1" if p_e14=="1– Totalmente en desacuerdo"
replace p_e14_numeric="2" if p_e14=="2- En desacuerdo"
replace p_e14_numeric="3" if p_e14=="3 -Parcialmente en desacuerdo"
replace p_e14_numeric="4" if p_e14=="4- Neutro"
replace p_e14_numeric="5" if p_e14=="5 -Parcialmente de acuerdo"
replace p_e14_numeric="6" if p_e14=="6- De acuerdo"
replace p_e14_numeric="7" if p_e14=="7 -Totalmente de acuerdo"
tab p_e14_numeric
destring p_e14_numeric, replace
tab p_e14_numeric
label value p_e14_numeric serv
tab p_e14_numeric

codebook Queelmédicoqueleatender // No missing
rename Queelmédicoqueleatender p_e15
codebook p_e15
tab p_e15
gen p_e15_numeric = p_e15
order p_e15_numeric, after(p_e15)
replace p_e15_numeric="1" if p_e15=="1– Totalmente en desacuerdo"
replace p_e15_numeric="2" if p_e15=="2- En desacuerdo"
replace p_e15_numeric="3" if p_e15=="3 -Parcialmente en desacuerdo"
replace p_e15_numeric="4" if p_e15=="4- Neutro"
replace p_e15_numeric="5" if p_e15=="5 -Parcialmente de acuerdo"
replace p_e15_numeric="6" if p_e15=="6- De acuerdo"
replace p_e15_numeric="7" if p_e15=="7 -Totalmente de acuerdo"
tab p_e15_numeric
destring p_e15_numeric, replace
tab p_e15_numeric
label value p_e15_numeric serv
tab p_e15_numeric

codebook Queustedcomprendalaexpli // No missing
rename Queustedcomprendalaexpli p_e16
codebook p_e16
tab p_e16
gen p_e16_numeric = p_e16
order p_e16_numeric, after(p_e16)
replace p_e16_numeric="1" if p_e16=="1– Totalmente en desacuerdo"
replace p_e16_numeric="2" if p_e16=="2- En desacuerdo"
replace p_e16_numeric="3" if p_e16=="3 -Parcialmente en desacuerdo"
replace p_e16_numeric="4" if p_e16=="4- Neutro"
replace p_e16_numeric="5" if p_e16=="5 -Parcialmente de acuerdo"
replace p_e16_numeric="6" if p_e16=="6- De acuerdo"
replace p_e16_numeric="7" if p_e16=="7 -Totalmente de acuerdo"
tab p_e16_numeric
destring p_e16_numeric, replace
tab p_e16_numeric
label value p_e16_numeric serv
tab p_e16_numeric

codebook AC // No missing
rename AC p_e17
codebook p_e17
tab p_e17
gen p_e17_numeric = p_e17
order p_e17_numeric, after(p_e17)
replace p_e17_numeric="1" if p_e17=="1– Totalmente en desacuerdo"
replace p_e17_numeric="2" if p_e17=="2- En desacuerdo"
replace p_e17_numeric="3" if p_e17=="3 -Parcialmente en desacuerdo"
replace p_e17_numeric="4" if p_e17=="4- Neutro"
replace p_e17_numeric="5" if p_e17=="5 -Parcialmente de acuerdo"
replace p_e17_numeric="6" if p_e17=="6- De acuerdo"
replace p_e17_numeric="7" if p_e17=="7 -Totalmente de acuerdo"
tab p_e17_numeric
destring p_e17_numeric, replace
tab p_e17_numeric
label value p_e17_numeric serv
tab p_e17_numeric

codebook AD // No missing
rename AD p_e18
codebook p_e18
tab p_e18
gen p_e18_numeric = p_e18
order p_e18_numeric, after(p_e18)
replace p_e18_numeric="1" if p_e18=="1– Totalmente en desacuerdo"
replace p_e18_numeric="2" if p_e18=="2- En desacuerdo"
replace p_e18_numeric="3" if p_e18=="3 -Parcialmente en desacuerdo"
replace p_e18_numeric="4" if p_e18=="4- Neutro"
replace p_e18_numeric="5" if p_e18=="5 -Parcialmente de acuerdo"
replace p_e18_numeric="6" if p_e18=="6- De acuerdo"
replace p_e18_numeric="7" if p_e18=="7 -Totalmente de acuerdo"
tab p_e18_numeric
destring p_e18_numeric, replace
tab p_e18_numeric
label value p_e18_numeric serv
tab p_e18_numeric

codebook Queloscartelesletrerosy // No missing
rename Queloscartelesletrerosy p_e19
codebook p_e19
tab p_e19
gen p_e19_numeric = p_e19
order p_e19_numeric, after(p_e19)
replace p_e19_numeric="1" if p_e19=="1– Totalmente en desacuerdo"
replace p_e19_numeric="2" if p_e19=="2- En desacuerdo"
replace p_e19_numeric="3" if p_e19=="3 -Parcialmente en desacuerdo"
replace p_e19_numeric="4" if p_e19=="4- Neutro"
replace p_e19_numeric="5" if p_e19=="5 -Parcialmente de acuerdo"
replace p_e19_numeric="6" if p_e19=="6- De acuerdo"
replace p_e19_numeric="7" if p_e19=="7 -Totalmente de acuerdo"
tab p_e19_numeric
destring p_e19_numeric, replace
tab p_e19_numeric
label value p_e19_numeric serv
tab p_e19_numeric

codebook Quelaatenciónpresencialc // No missing
rename Quelaatenciónpresencialc p_e20
codebook p_e20
tab p_e20
gen p_e20_numeric = p_e20
order p_e20_numeric, after(p_e20)
replace p_e20_numeric="1" if p_e20=="1– Totalmente en desacuerdo"
replace p_e20_numeric="2" if p_e20=="2- En desacuerdo"
replace p_e20_numeric="3" if p_e20=="3 -Parcialmente en desacuerdo"
replace p_e20_numeric="4" if p_e20=="4- Neutro"
replace p_e20_numeric="5" if p_e20=="5 -Parcialmente de acuerdo"
replace p_e20_numeric="6" if p_e20=="6- De acuerdo"
replace p_e20_numeric="7" if p_e20=="7 -Totalmente de acuerdo"
tab p_e20_numeric
destring p_e20_numeric, replace
tab p_e20_numeric
label value p_e20_numeric serv
tab p_e20_numeric

codebook Quelosconsultorioscuenten // No missing
rename Quelosconsultorioscuenten p_e21
codebook p_e21
tab p_e21
gen p_e21_numeric = p_e21
order p_e21_numeric, after(p_e21)
replace p_e21_numeric="1" if p_e21=="1– Totalmente en desacuerdo"
replace p_e21_numeric="2" if p_e21=="2- En desacuerdo"
replace p_e21_numeric="3" if p_e21=="3 -Parcialmente en desacuerdo"
replace p_e21_numeric="4" if p_e21=="4- Neutro"
replace p_e21_numeric="5" if p_e21=="5 -Parcialmente de acuerdo"
replace p_e21_numeric="6" if p_e21=="6- De acuerdo"
replace p_e21_numeric="7" if p_e21=="7 -Totalmente de acuerdo"
tab p_e21_numeric
destring p_e21_numeric, replace
tab p_e21_numeric
label value p_e21_numeric serv
tab p_e21_numeric

codebook Queelconsultorioylasala // No missing
rename Queelconsultorioylasala p_e22
codebook p_e22
tab p_e22
gen p_e22_numeric = p_e22
order p_e22_numeric, after(p_e22)
replace p_e22_numeric="1" if p_e22=="1– Totalmente en desacuerdo"
replace p_e22_numeric="2" if p_e22=="2- En desacuerdo"
replace p_e22_numeric="3" if p_e22=="3 -Parcialmente en desacuerdo"
replace p_e22_numeric="4" if p_e22=="4- Neutro"
replace p_e22_numeric="5" if p_e22=="5 -Parcialmente de acuerdo"
replace p_e22_numeric="6" if p_e22=="6- De acuerdo"
replace p_e22_numeric="7" if p_e22=="7 -Totalmente de acuerdo"
tab p_e22_numeric
destring p_e22_numeric, replace
tab p_e22_numeric
label value p_e22_numeric serv
tab p_e22_numeric



// 2. PERCEPCIONES PRESENCIAL

codebook Elpersonaldeinformesloo // No missing
rename Elpersonaldeinformesloo p_p1
codebook p_p1
tab p_p1
encode p_p1, gen(p_p1_numeric)
order p_p1_numeric, after(p_p1)
tab p_p1_numeric

codebook Elmédicoloatendióenelh // No missing
rename Elmédicoloatendióenelh p_p2
codebook p_p2
tab p_p2
encode p_p2, gen(p_p2_numeric)
order p_p2_numeric, after(p_p2)
tab p_p2_numeric

codebook Suatenciónpresencialsere // No missing
rename Suatenciónpresencialsere p_p3
codebook p_p3
tab p_p3
encode p_p3, gen(p_p3_numeric)
order p_p3_numeric, after(p_p3)
tab p_p3_numeric

codebook Suhistoriaclínicaseencon // No missing
rename Suhistoriaclínicaseencon p_p4
codebook p_p4
tab p_p4
gen p_p4_numeric = p_p4
order p_p4_numeric, after(p_p4)
replace p_p4_numeric="1" if p_p4=="1– Totalmente en desacuerdo"
replace p_p4_numeric="2" if p_p4=="2- En desacuerdo"
replace p_p4_numeric="3" if p_p4=="3 -Parcialmente en desacuerdo"
replace p_p4_numeric="4" if p_p4=="4- Neutro"
replace p_p4_numeric="5" if p_p4=="5 -Parcialmente de acuerdo"
replace p_p4_numeric="6" if p_p4=="6- De acuerdo"
replace p_p4_numeric="7" if p_p4=="7 -Totalmente de acuerdo"
tab p_p4_numeric
destring p_p4_numeric, replace
tab p_p4_numeric
label value p_p4_numeric serv
tab p_p4_numeric

codebook Ustedencontrócitasdisponi // No missing
rename Ustedencontrócitasdisponi p_p5
codebook p_p5
tab p_p5
encode p_p5, gen(p_p5_numeric)
order p_p5_numeric, after(p_p5)
tab p_p5_numeric

codebook Laatenciónenelmódulode // No missing
rename Laatenciónenelmódulode p_p6
codebook p_p6
tab p_p6
encode p_p6, gen(p_p6_numeric)
order p_p6_numeric, after(p_p6)
tab p_p6_numeric

codebook Laatenciónparaprogramary // No missing
rename Laatenciónparaprogramary p_p7
codebook p_p7
tab p_p7
encode p_p7, gen(p_p7_numeric)
order p_p7_numeric, after(p_p7)
tab p_p7_numeric

codebook AP // No missing
rename AP p_p8
codebook p_p8
tab p_p8
encode p_p8, gen(p_p8_numeric)
order p_p8_numeric, after(p_p8)
tab p_p8_numeric

codebook Laatenciónyentregaenfar // No missing
rename Laatenciónyentregaenfar p_p9
codebook p_p9
tab p_p9
gen p_p9_numeric = p_p9
order p_p9_numeric, after(p_p9)
replace p_p9_numeric="1" if p_p9=="1– Totalmente en desacuerdo"
replace p_p9_numeric="2" if p_p9=="2- En desacuerdo"
replace p_p9_numeric="3" if p_p9=="3 -Parcialmente en desacuerdo"
replace p_p9_numeric="4" if p_p9=="4- Neutro"
replace p_p9_numeric="5" if p_p9=="5 -Parcialmente de acuerdo"
replace p_p9_numeric="6" if p_p9=="6- De acuerdo"
replace p_p9_numeric="7" if p_p9=="7 -Totalmente de acuerdo"
tab p_p9_numeric
destring p_p9_numeric, replace
tab p_p9_numeric
label value p_p9_numeric serv
tab p_p9_numeric

codebook Serespetósuprivacidaddu // No missing
rename Serespetósuprivacidaddu p_p10
codebook p_p10
tab p_p10
gen p_p10_numeric = p_p10
order p_p10_numeric, after(p_p10)
replace p_p10_numeric="1" if p_p10=="1– Totalmente en desacuerdo"
replace p_p10_numeric="2" if p_p10=="2- En desacuerdo"
replace p_p10_numeric="3" if p_p10=="3 -Parcialmente en desacuerdo"
replace p_p10_numeric="4" if p_p10=="4- Neutro"
replace p_p10_numeric="5" if p_p10=="5 -Parcialmente de acuerdo"
replace p_p10_numeric="6" if p_p10=="6- De acuerdo"
replace p_p10_numeric="7" if p_p10=="7 -Totalmente de acuerdo"
tab p_p10_numeric
destring p_p10_numeric, replace
tab p_p10_numeric
label value p_p10_numeric serv
tab p_p10_numeric

codebook Elmédicolerealizóunexa // No missing
rename Elmédicolerealizóunexa p_p11
codebook p_p11
tab p_p11
gen p_p11_numeric = p_p11
order p_p11_numeric, after(p_p11)
replace p_p11_numeric="1" if p_p11=="1– Totalmente en desacuerdo"
replace p_p11_numeric="2" if p_p11=="2- En desacuerdo"
replace p_p11_numeric="3" if p_p11=="3 -Parcialmente en desacuerdo"
replace p_p11_numeric="4" if p_p11=="4- Neutro"
replace p_p11_numeric="5" if p_p11=="5 -Parcialmente de acuerdo"
replace p_p11_numeric="6" if p_p11=="6- De acuerdo"
replace p_p11_numeric="7" if p_p11=="7 -Totalmente de acuerdo"
tab p_p11_numeric
destring p_p11_numeric, replace
tab p_p11_numeric
label value p_p11_numeric serv
tab p_p11_numeric

codebook Elmédicolebrindóeltiem // No missing
rename Elmédicolebrindóeltiem p_p12
codebook p_p12
tab p_p12
encode p_p12, gen(p_p12_numeric)
order p_p12_numeric, after(p_p12)
tab p_p12_numeric

codebook Elmédicoqueleatendióle // No missing
rename Elmédicoqueleatendióle p_p13
codebook p_p13
tab p_p13
encode p_p13, gen(p_p13_numeric)
order p_p13_numeric, after(p_p13)
tab p_p13_numeric

codebook Elpersonaldeatenciónamb // No missing
rename Elpersonaldeatenciónamb p_p14
codebook p_p14
tab p_p14
gen p_p14_numeric = p_p14
order p_p14_numeric, after(p_p14)
replace p_p14_numeric="1" if p_p14=="1– Totalmente en desacuerdo"
replace p_p14_numeric="2" if p_p14=="2- En desacuerdo"
replace p_p14_numeric="3" if p_p14=="3 -Parcialmente en desacuerdo"
replace p_p14_numeric="4" if p_p14=="4- Neutro"
replace p_p14_numeric="5" if p_p14=="5 -Parcialmente de acuerdo"
replace p_p14_numeric="6" if p_p14=="6- De acuerdo"
replace p_p14_numeric="7" if p_p14=="7 -Totalmente de acuerdo"
tab p_p14_numeric
destring p_p14_numeric, replace
tab p_p14_numeric
label value p_p14_numeric serv
tab p_p14_numeric

codebook Elmédicoqueleatendiómo // No missing
rename Elmédicoqueleatendiómo p_p15
codebook p_p15
tab p_p15
gen p_p15_numeric = p_p15
order p_p15_numeric, after(p_p15)
replace p_p15_numeric="1" if p_p15=="1– Totalmente en desacuerdo"
replace p_p15_numeric="2" if p_p15=="2- En desacuerdo"
replace p_p15_numeric="3" if p_p15=="3 -Parcialmente en desacuerdo"
replace p_p15_numeric="4" if p_p15=="4- Neutro"
replace p_p15_numeric="5" if p_p15=="5 -Parcialmente de acuerdo"
replace p_p15_numeric="6" if p_p15=="6- De acuerdo"
replace p_p15_numeric="7" if p_p15=="7 -Totalmente de acuerdo"
tab p_p15_numeric
destring p_p15_numeric, replace
tab p_p15_numeric
label value p_p15_numeric serv
tab p_p15_numeric

codebook Ustedcomprendiólaexplica // No missing
rename Ustedcomprendiólaexplica p_p16
codebook p_p16
tab p_p16
gen p_p16_numeric = p_p16
order p_p16_numeric, after(p_p16)
replace p_p16_numeric="1" if p_p16=="1– Totalmente en desacuerdo"
replace p_p16_numeric="2" if p_p16=="2- En desacuerdo"
replace p_p16_numeric="3" if p_p16=="3 -Parcialmente en desacuerdo"
replace p_p16_numeric="4" if p_p16=="4- Neutro"
replace p_p16_numeric="5" if p_p16=="5 -Parcialmente de acuerdo"
replace p_p16_numeric="6" if p_p16=="6- De acuerdo"
replace p_p16_numeric="7" if p_p16=="7 -Totalmente de acuerdo"
tab p_p16_numeric
destring p_p16_numeric, replace
tab p_p16_numeric
label value p_p16_numeric serv
tab p_p16_numeric

codebook AY // No missing
rename AY p_p17
codebook p_p17
tab p_p17
gen p_p17_numeric = p_p17
order p_p17_numeric, after(p_p17)
replace p_p17_numeric="1" if p_p17=="1– Totalmente en desacuerdo"
replace p_p17_numeric="2" if p_p17=="2- En desacuerdo"
replace p_p17_numeric="3" if p_p17=="3 -Parcialmente en desacuerdo"
replace p_p17_numeric="4" if p_p17=="4- Neutro"
replace p_p17_numeric="5" if p_p17=="5 -Parcialmente de acuerdo"
replace p_p17_numeric="6" if p_p17=="6- De acuerdo"
replace p_p17_numeric="7" if p_p17=="7 -Totalmente de acuerdo"
tab p_p17_numeric
destring p_p17_numeric, replace
tab p_p17_numeric
label value p_p17_numeric serv
tab p_p17_numeric

codebook AZ // No missing
rename AZ p_p18
codebook p_p18
tab p_p18
gen p_p18_numeric = p_p18
order p_p18_numeric, after(p_p18)
replace p_p18_numeric="1" if p_p18=="1– Totalmente en desacuerdo"
replace p_p18_numeric="2" if p_p18=="2- En desacuerdo"
replace p_p18_numeric="3" if p_p18=="3 -Parcialmente en desacuerdo"
replace p_p18_numeric="4" if p_p18=="4- Neutro"
replace p_p18_numeric="5" if p_p18=="5 -Parcialmente de acuerdo"
replace p_p18_numeric="6" if p_p18=="6- De acuerdo"
replace p_p18_numeric="7" if p_p18=="7 -Totalmente de acuerdo"
tab p_p18_numeric
destring p_p18_numeric, replace
tab p_p18_numeric
label value p_p18_numeric serv
tab p_p18_numeric

codebook Loscartelesletrerosyfl // No missing
rename Loscartelesletrerosyfl p_p19
codebook p_p19
tab p_p19
gen p_p19_numeric = p_p19
order p_p19_numeric, after(p_p19)
replace p_p19_numeric="1" if p_p19=="1– Totalmente en desacuerdo"
replace p_p19_numeric="2" if p_p19=="2- En desacuerdo"
replace p_p19_numeric="3" if p_p19=="3 -Parcialmente en desacuerdo"
replace p_p19_numeric="4" if p_p19=="4- Neutro"
replace p_p19_numeric="5" if p_p19=="5 -Parcialmente de acuerdo"
replace p_p19_numeric="6" if p_p19=="6- De acuerdo"
replace p_p19_numeric="7" if p_p19=="7 -Totalmente de acuerdo"
tab p_p19_numeric
destring p_p19_numeric, replace
tab p_p19_numeric
label value p_p19_numeric serv
tab p_p19_numeric

codebook Laatenciónpresencialcont // No missing
rename Laatenciónpresencialcont p_p20
codebook p_p20
tab p_p20
encode p_p20, gen(p_p20_numeric)
order p_p20_numeric, after(p_p20)
tab p_p20_numeric

codebook Losconsultorioscontaronc // No missing
rename Losconsultorioscontaronc p_p21
codebook p_p21
tab p_p21
gen p_p21_numeric = p_p21
order p_p21_numeric, after(p_p21)
replace p_p21_numeric="1" if p_p21=="1– Totalmente en desacuerdo"
replace p_p21_numeric="2" if p_p21=="2- En desacuerdo"
replace p_p21_numeric="3" if p_p21=="3 -Parcialmente en desacuerdo"
replace p_p21_numeric="4" if p_p21=="4- Neutro"
replace p_p21_numeric="5" if p_p21=="5 -Parcialmente de acuerdo"
replace p_p21_numeric="6" if p_p21=="6- De acuerdo"
replace p_p21_numeric="7" if p_p21=="7 -Totalmente de acuerdo"
tab p_p21_numeric
destring p_p21_numeric, replace
tab p_p21_numeric
label value p_p21_numeric serv
tab p_p21_numeric

codebook Elconsultorioylasalade // No missing
rename Elconsultorioylasalade p_p22
codebook p_p22
tab p_p22
gen p_p22_numeric = p_p22
order p_p22_numeric, after(p_p22)
replace p_p22_numeric="1" if p_p22=="1– Totalmente en desacuerdo"
replace p_p22_numeric="2" if p_p22=="2- En desacuerdo"
replace p_p22_numeric="3" if p_p22=="3 -Parcialmente en desacuerdo"
replace p_p22_numeric="4" if p_p22=="4- Neutro"
replace p_p22_numeric="5" if p_p22=="5 -Parcialmente de acuerdo"
replace p_p22_numeric="6" if p_p22=="6- De acuerdo"
replace p_p22_numeric="7" if p_p22=="7 -Totalmente de acuerdo"
tab p_p22_numeric
destring p_p22_numeric, replace
tab p_p22_numeric
label value p_p22_numeric serv
tab p_p22_numeric


codebook BE // No missing
tab BE

codebook BF



// 3. EXPECTATIVAS TELECONSULTA

codebook BK // No missing
rename BK t_e1
codebook t_e1
tab t_e1
encode t_e1, gen(t_e1_numeric)
order t_e1_numeric, after(t_e1)
tab t_e1_numeric

codebook Quelaatenciónporteleconsu // No missing
rename Quelaatenciónporteleconsu t_e2
codebook t_e2
tab t_e2
encode t_e2, gen(t_e2_numeric)
order t_e2_numeric, after(t_e2)
tab t_e2_numeric

codebook BM // No missing
rename BM t_e3
codebook t_e3
tab t_e3
gen t_e3_numeric = t_e3
order t_e3_numeric, after(t_e3)
replace t_e3_numeric="1" if t_e3=="1– Totalmente en desacuerdo"
replace t_e3_numeric="2" if t_e3=="2- En desacuerdo"
replace t_e3_numeric="3" if t_e3=="3 -Parcialmente en desacuerdo"
replace t_e3_numeric="4" if t_e3=="4- Neutro"
replace t_e3_numeric="5" if t_e3=="5 -Parcialmente de acuerdo"
replace t_e3_numeric="6" if t_e3=="6- De acuerdo"
replace t_e3_numeric="7" if t_e3=="7 -Totalmente de acuerdo"
tab t_e3_numeric
destring t_e3_numeric, replace
tab t_e3_numeric
label value t_e3_numeric serv
tab t_e3_numeric

codebook BN // No missing
rename BN t_e4
codebook t_e4
tab t_e4
gen t_e4_numeric = t_e4
order t_e4_numeric, after(t_e4)
replace t_e4_numeric="1" if t_e4=="1– Totalmente en desacuerdo"
replace t_e4_numeric="2" if t_e4=="2- En desacuerdo"
replace t_e4_numeric="3" if t_e4=="3 -Parcialmente en desacuerdo"
replace t_e4_numeric="4" if t_e4=="4- Neutro"
replace t_e4_numeric="5" if t_e4=="5 -Parcialmente de acuerdo"
replace t_e4_numeric="6" if t_e4=="6- De acuerdo"
replace t_e4_numeric="7" if t_e4=="7 -Totalmente de acuerdo"
tab t_e4_numeric
destring t_e4_numeric, replace
tab t_e4_numeric
label value t_e4_numeric serv
tab t_e4_numeric

codebook BO // No missing
rename BO t_e5
codebook t_e5
tab t_e5
encode t_e5, gen(t_e5_numeric)
order t_e5_numeric, after(t_e5)
tab t_e5_numeric

codebook Queellinkdeatenciónport // No missing
rename Queellinkdeatenciónport t_e6
codebook t_e6
tab t_e6
encode t_e6, gen(t_e6_numeric)
order t_e6_numeric, after(t_e6)
tab t_e6_numeric

codebook BQ // No missing
rename BQ t_e7
codebook t_e7
tab t_e7
encode t_e7, gen(t_e7_numeric)
order t_e7_numeric, after(t_e7)
tab t_e7_numeric

codebook BR // No missing
rename BR t_e8
codebook t_e8
tab t_e8
encode t_e8, gen(t_e8_numeric)
order t_e8_numeric, after(t_e8)
tab t_e8_numeric

codebook BS // No missing
rename BS t_e9
codebook t_e9
tab t_e9
gen t_e9_numeric = t_e9
order t_e9_numeric, after(t_e9)
replace t_e9_numeric="1" if t_e9=="1– Totalmente en desacuerdo"
replace t_e9_numeric="2" if t_e9=="2- En desacuerdo"
replace t_e9_numeric="3" if t_e9=="3 -Parcialmente en desacuerdo"
replace t_e9_numeric="4" if t_e9=="4- Neutro"
replace t_e9_numeric="5" if t_e9=="5 -Parcialmente de acuerdo"
replace t_e9_numeric="6" if t_e9=="6- De acuerdo"
replace t_e9_numeric="7" if t_e9=="7 -Totalmente de acuerdo"
tab t_e9_numeric
destring t_e9_numeric, replace
tab t_e9_numeric
label value t_e9_numeric serv
tab t_e9_numeric

codebook Quedurantesuatenciónpor // No missing
rename Quedurantesuatenciónpor t_e10
codebook t_e10
tab t_e10
gen t_e10_numeric = t_e10
order t_e10_numeric, after(t_e10)
replace t_e10_numeric="1" if t_e10=="1– Totalmente en desacuerdo"
replace t_e10_numeric="2" if t_e10=="2- En desacuerdo"
replace t_e10_numeric="3" if t_e10=="3 -Parcialmente en desacuerdo"
replace t_e10_numeric="4" if t_e10=="4- Neutro"
replace t_e10_numeric="5" if t_e10=="5 -Parcialmente de acuerdo"
replace t_e10_numeric="6" if t_e10=="6- De acuerdo"
replace t_e10_numeric="7" if t_e10=="7 -Totalmente de acuerdo"
tab t_e10_numeric
destring t_e10_numeric, replace
tab t_e10_numeric
label value t_e10_numeric serv
tab t_e10_numeric

codebook Queelmédicolerealiceuna // No missing
rename Queelmédicolerealiceuna t_e11
codebook t_e11
tab t_e11
encode t_e11, gen(t_e11_numeric)
order t_e11_numeric, after(t_e11)
tab t_e11_numeric

codebook BV // No missing
rename BV t_e12
codebook t_e12
tab t_e12
encode t_e12, gen(t_e12_numeric)
order t_e12_numeric, after(t_e12)
tab t_e12_numeric

codebook BW // No missing
rename BW t_e13
codebook t_e13
tab t_e13
encode t_e13, gen(t_e13_numeric)
order t_e13_numeric, after(t_e13)
tab t_e13_numeric

codebook BX // No missing
rename BX t_e14
codebook t_e14
tab t_e14
encode t_e14, gen(t_e14_numeric)
order t_e14_numeric, after(t_e14)
tab t_e14_numeric

codebook BY // No missing
rename BY t_e15
codebook t_e15
tab t_e15
encode t_e15, gen(t_e15_numeric)
order t_e15_numeric, after(t_e15)
tab t_e15_numeric

codebook BZ // No missing
rename BZ t_e16
codebook t_e16
tab t_e16
replace t_e16="7- Totalmente de acuerdo" if t_e16=="Opción 7"
tab t_e16
encode t_e16, gen(t_e16_numeric)
order t_e16_numeric, after(t_e16)
tab t_e16_numeric

codebook CA // No missing
rename CA t_e17
codebook t_e17
tab t_e17
gen t_e17_numeric = t_e17
order t_e17_numeric, after(t_e17)
replace t_e17_numeric="1" if t_e17=="1– Totalmente en desacuerdo"
replace t_e17_numeric="2" if t_e17=="2- En desacuerdo"
replace t_e17_numeric="3" if t_e17=="3 -Parcialmente en desacuerdo"
replace t_e17_numeric="4" if t_e17=="4- Neutro"
replace t_e17_numeric="5" if t_e17=="5 -Parcialmente de acuerdo"
replace t_e17_numeric="6" if t_e17=="6- De acuerdo"
replace t_e17_numeric="7" if t_e17=="7 -Totalmente de acuerdo"
tab t_e17_numeric
destring t_e17_numeric, replace
tab t_e17_numeric
label value t_e17_numeric serv
tab t_e17_numeric

codebook CB // No missing
rename CB t_e18
codebook t_e18
tab t_e18
encode t_e18, gen(t_e18_numeric)
order t_e18_numeric, after(t_e18)
tab t_e18_numeric

codebook Quelosmediosdigitalespá // No missing
rename Quelosmediosdigitalespá t_e19
codebook t_e19
tab t_e19
encode t_e19, gen(t_e19_numeric)
order t_e19_numeric, after(t_e19)
tab t_e19_numeric

codebook Quelaatenciónportelecons // No missing
rename Quelaatenciónportelecons t_e20
codebook t_e20
tab t_e20
gen t_e20_numeric = t_e20
order t_e20_numeric, after(t_e20)
replace t_e20_numeric="1" if t_e20=="1– Totalmente en desacuerdo"
replace t_e20_numeric="2" if t_e20=="2- En desacuerdo"
replace t_e20_numeric="3" if t_e20=="3 -Parcialmente en desacuerdo"
replace t_e20_numeric="4" if t_e20=="4- Neutro"
replace t_e20_numeric="5" if t_e20=="5 -Parcialmente de acuerdo"
replace t_e20_numeric="6" if t_e20=="6- De acuerdo"
replace t_e20_numeric="7" if t_e20=="7 -Totalmente de acuerdo"
tab t_e20_numeric
destring t_e20_numeric, replace
tab t_e20_numeric
label value t_e20_numeric serv
tab t_e20_numeric

codebook Quelacomunicaciónvirtual // No missing
rename Quelacomunicaciónvirtual t_e21
codebook t_e21
tab t_e21
encode t_e21, gen(t_e21_numeric)
order t_e21_numeric, after(t_e21)
tab t_e21_numeric

codebook Quelasaladeesperavirtua // No missing
rename Quelasaladeesperavirtua t_e22
codebook t_e22
tab t_e22
encode t_e22, gen(t_e22_numeric)
order t_e22_numeric, after(t_e22)
tab t_e22_numeric



// 4. PERCEPCIONES TELECONSULTA

codebook CG // No missing
rename CG t_p1
codebook t_p1
tab t_p1
gen t_p1_numeric = t_p1
order t_p1_numeric, after(t_p1)
replace t_p1_numeric="1" if t_p1=="1– Totalmente en desacuerdo"
replace t_p1_numeric="2" if t_p1=="2- En desacuerdo"
replace t_p1_numeric="3" if t_p1=="3 -Parcialmente en desacuerdo"
replace t_p1_numeric="4" if t_p1=="4- Neutro"
replace t_p1_numeric="5" if t_p1=="5 -Parcialmente de acuerdo"
replace t_p1_numeric="6" if t_p1=="6- De acuerdo"
replace t_p1_numeric="7" if t_p1=="7 -Totalmente de acuerdo"
tab t_p1_numeric
destring t_p1_numeric, replace
tab t_p1_numeric
label value t_p1_numeric serv
tab t_p1_numeric

codebook Elmédicoleatendióenelh // No missing
rename Elmédicoleatendióenelh t_p2
codebook t_p2
tab t_p2
encode t_p2, gen(t_p2_numeric)
order t_p2_numeric, after(t_p2)
tab t_p2_numeric

codebook Suatenciónporteleconsulta // No missing
rename Suatenciónporteleconsulta t_p3
codebook t_p3
tab t_p3
encode t_p3, gen(t_p3_numeric)
order t_p3_numeric, after(t_p3)
tab t_p3_numeric

codebook CJ // No missing
rename CJ t_p4
codebook t_p4
tab t_p4
gen t_p4_numeric = t_p4
order t_p4_numeric, after(t_p4)
replace t_p4_numeric="1" if t_p4=="1– Totalmente en desacuerdo"
replace t_p4_numeric="2" if t_p4=="2- En desacuerdo"
replace t_p4_numeric="3" if t_p4=="3 -Parcialmente en desacuerdo"
replace t_p4_numeric="4" if t_p4=="4- Neutro"
replace t_p4_numeric="5" if t_p4=="5 -Parcialmente de acuerdo"
replace t_p4_numeric="6" if t_p4=="6- De acuerdo"
replace t_p4_numeric="7" if t_p4=="7 -Totalmente de acuerdo"
tab t_p4_numeric
destring t_p4_numeric, replace
tab t_p4_numeric
label value t_p4_numeric serv
tab t_p4_numeric

codebook CK // Hay 2 missing
rename CK t_p5
codebook t_p5 // Hay 2 missing
tab t_p5
encode t_p5, gen(t_p5_numeric)
order t_p5_numeric, after(t_p5)
tab t_p5_numeric
list id if t_p5_numeric==.

codebook Ellinkdeatenciónportele // No missing
rename Ellinkdeatenciónportele t_p6
codebook t_p6 // No missing
encode t_p6, gen(t_p6_numeric)
order t_p6_numeric, after(t_p6)
tab t_p6_numeric

codebook Laatenciónparalaprograma // No missing
rename Laatenciónparalaprograma t_p7
codebook t_p7
tab t_p7
gen t_p7_numeric = t_p7
order t_p7_numeric, after(t_p7)
replace t_p7_numeric="1" if t_p7=="1– Totalmente en desacuerdo"
replace t_p7_numeric="2" if t_p7=="2- En desacuerdo"
replace t_p7_numeric="3" if t_p7=="3 -Parcialmente en desacuerdo"
replace t_p7_numeric="4" if t_p7=="4- Neutro"
replace t_p7_numeric="5" if t_p7=="5 -Parcialmente de acuerdo"
replace t_p7_numeric="6" if t_p7=="6- De acuerdo"
replace t_p7_numeric="7" if t_p7=="7 -Totalmente de acuerdo"
tab t_p7_numeric
destring t_p7_numeric, replace
tab t_p7_numeric
label value t_p7_numeric serv
tab t_p7_numeric

codebook CN // No missing
rename CN t_p8
codebook t_p8
tab t_p8
encode t_p8, gen(t_p8_numeric)
order t_p8_numeric, after(t_p8)
tab t_p8_numeric

codebook Laatenciónyentregademed // No missing
rename Laatenciónyentregademed t_p9
codebook t_p9
tab t_p9
gen t_p9_numeric = t_p9
order t_p9_numeric, after(t_p9)
replace t_p9_numeric="1" if t_p9=="1– Totalmente en desacuerdo"
replace t_p9_numeric="2" if t_p9=="2- En desacuerdo"
replace t_p9_numeric="3" if t_p9=="3 -Parcialmente en desacuerdo"
replace t_p9_numeric="4" if t_p9=="4- Neutro"
replace t_p9_numeric="5" if t_p9=="5 -Parcialmente de acuerdo"
replace t_p9_numeric="6" if t_p9=="6- De acuerdo"
replace t_p9_numeric="7" if t_p9=="7 -Totalmente de acuerdo"
tab t_p9_numeric
destring t_p9_numeric, replace
tab t_p9_numeric
label value t_p9_numeric serv
tab t_p9_numeric

codebook CP // No missing
rename CP t_p10
codebook t_p10
tab t_p10
gen t_p10_numeric = t_p10
order t_p10_numeric, after(t_p10)
replace t_p10_numeric="1" if t_p10=="1– Totalmente en desacuerdo"
replace t_p10_numeric="2" if t_p10=="2- En desacuerdo"
replace t_p10_numeric="3" if t_p10=="3 -Parcialmente en desacuerdo"
replace t_p10_numeric="4" if t_p10=="4- Neutro"
replace t_p10_numeric="5" if t_p10=="5 -Parcialmente de acuerdo"
replace t_p10_numeric="6" if t_p10=="6- De acuerdo"
replace t_p10_numeric="7" if t_p10=="7 -Totalmente de acuerdo"
tab t_p10_numeric
destring t_p10_numeric, replace
tab t_p10_numeric
label value t_p10_numeric serv
tab t_p10_numeric

codebook Elmédicolerealizóunaev // No missing
rename Elmédicolerealizóunaev t_p11
codebook t_p11
tab t_p11
encode t_p11, gen(t_p11_numeric)
order t_p11_numeric, after(t_p11)
tab t_p11_numeric

codebook CR // No missing
rename CR t_p12
codebook t_p12
tab t_p12
encode t_p12, gen(t_p12_numeric)
order t_p12_numeric, after(t_p12)
tab t_p12_numeric

codebook CS // No missing
rename CS t_p13
codebook t_p13
tab t_p13
encode t_p13, gen(t_p13_numeric)
order t_p13_numeric, after(t_p13)
tab t_p13_numeric

codebook Elpersonaldeatenciónpor // No missing
rename Elpersonaldeatenciónpor t_p14
codebook t_p14
tab t_p14
gen t_p14_numeric = t_p14
order t_p14_numeric, after(t_p14)
replace t_p14_numeric="1" if t_p14=="1– Totalmente en desacuerdo"
replace t_p14_numeric="2" if t_p14=="2- En desacuerdo"
replace t_p14_numeric="3" if t_p14=="3 -Parcialmente en desacuerdo"
replace t_p14_numeric="4" if t_p14=="4- Neutro"
replace t_p14_numeric="5" if t_p14=="5 -Parcialmente de acuerdo"
replace t_p14_numeric="6" if t_p14=="6- De acuerdo"
replace t_p14_numeric="7" if t_p14=="7 -Totalmente de acuerdo"
tab t_p14_numeric
destring t_p14_numeric, replace
tab t_p14_numeric
label value t_p14_numeric serv
tab t_p14_numeric

codebook Elmédicoqueleatendióma // No missing
rename Elmédicoqueleatendióma t_p15
codebook t_p15
tab t_p15
gen t_p15_numeric = t_p15
order t_p15_numeric, after(t_p15)
replace t_p15_numeric="1" if t_p15=="1– Totalmente en desacuerdo"
replace t_p15_numeric="2" if t_p15=="2- En desacuerdo"
replace t_p15_numeric="3" if t_p15=="3 -Parcialmente en desacuerdo"
replace t_p15_numeric="4" if t_p15=="4- Neutro"
replace t_p15_numeric="5" if t_p15=="5 -Parcialmente de acuerdo"
replace t_p15_numeric="6" if t_p15=="6- De acuerdo"
replace t_p15_numeric="7" if t_p15=="7 -Totalmente de acuerdo"
tab t_p15_numeric
destring t_p15_numeric, replace
tab t_p15_numeric
label value t_p15_numeric serv
tab t_p15_numeric

codebook CV // No missing
rename CV t_p16
codebook t_p16
tab t_p16
gen t_p16_numeric = t_p16
order t_p16_numeric, after(t_p16)
replace t_p16_numeric="1" if t_p16=="1– Totalmente en desacuerdo"
replace t_p16_numeric="2" if t_p16=="2- En desacuerdo"
replace t_p16_numeric="3" if t_p16=="3 -Parcialmente en desacuerdo"
replace t_p16_numeric="4" if t_p16=="4- Neutro"
replace t_p16_numeric="5" if t_p16=="5 -Parcialmente de acuerdo"
replace t_p16_numeric="6" if t_p16=="6- De acuerdo"
replace t_p16_numeric="7" if t_p16=="7 -Totalmente de acuerdo"
tab t_p16_numeric
destring t_p16_numeric, replace
tab t_p16_numeric
label value t_p16_numeric serv
tab t_p16_numeric

codebook CW // No missing
rename CW t_p17
codebook t_p17
tab t_p17
gen t_p17_numeric = t_p17
order t_p17_numeric, after(t_p17)
replace t_p17_numeric="1" if t_p17=="1– Totalmente en desacuerdo"
replace t_p17_numeric="2" if t_p17=="2- En desacuerdo"
replace t_p17_numeric="3" if t_p17=="3 -Parcialmente en desacuerdo"
replace t_p17_numeric="4" if t_p17=="4- Neutro"
replace t_p17_numeric="5" if t_p17=="5 -Parcialmente de acuerdo"
replace t_p17_numeric="6" if t_p17=="6- De acuerdo"
replace t_p17_numeric="7" if t_p17=="7 -Totalmente de acuerdo"
tab t_p17_numeric
destring t_p17_numeric, replace
tab t_p17_numeric
label value t_p17_numeric serv
tab t_p17_numeric

codebook CX // No missing
rename CX t_p18
codebook t_p18
tab t_p18
gen t_p18_numeric = t_p18
order t_p18_numeric, after(t_p18)
replace t_p18_numeric="1" if t_p18=="1– Totalmente en desacuerdo"
replace t_p18_numeric="2" if t_p18=="2- En desacuerdo"
replace t_p18_numeric="3" if t_p18=="3 -Parcialmente en desacuerdo"
replace t_p18_numeric="4" if t_p18=="4- Neutro"
replace t_p18_numeric="5" if t_p18=="5 -Parcialmente de acuerdo"
replace t_p18_numeric="6" if t_p18=="6- De acuerdo"
replace t_p18_numeric="7" if t_p18=="7 -Totalmente de acuerdo"
tab t_p18_numeric
destring t_p18_numeric, replace
tab t_p18_numeric
label value t_p18_numeric serv
tab t_p18_numeric

codebook Losmediosdigitalespágin // No missing
rename Losmediosdigitalespágin t_p19
codebook t_p19
tab t_p19
gen t_p19_numeric = t_p19
order t_p19_numeric, after(t_p19)
replace t_p19_numeric="1" if t_p19=="1– Totalmente en desacuerdo"
replace t_p19_numeric="2" if t_p19=="2- En desacuerdo"
replace t_p19_numeric="3" if t_p19=="3 -Parcialmente en desacuerdo"
replace t_p19_numeric="4" if t_p19=="4- Neutro"
replace t_p19_numeric="5" if t_p19=="5 -Parcialmente de acuerdo"
replace t_p19_numeric="6" if t_p19=="6- De acuerdo"
replace t_p19_numeric="7" if t_p19=="7 -Totalmente de acuerdo"
tab t_p19_numeric
destring t_p19_numeric, replace
tab t_p19_numeric
label value t_p19_numeric serv
tab t_p19_numeric

codebook Laatenciónporteleconsult // No missing
rename Laatenciónporteleconsult t_p20
codebook t_p20
tab t_p20
encode t_p20, gen(t_p20_numeric)
order t_p20_numeric, after(t_p20)
tab t_p20_numeric

codebook Lacomunicaciónvirtualfue // No missing
rename Lacomunicaciónvirtualfue t_p21
codebook t_p21
tab t_p21
encode t_p21, gen(t_p21_numeric)
order t_p21_numeric, after(t_p21)
tab t_p21_numeric

codebook Lasaladeesperavirtualp // No missing
rename Lasaladeesperavirtualp t_p22
codebook t_p22
tab t_p22
encode t_p22, gen(t_p22_numeric)
order t_p22_numeric, after(t_p22)
tab t_p22_numeric



// 5. CONVERSACIÓN CON EL INVESTIGADOR PRINCIPAL

// NOTA: Se acordó eliminar los id 104 y 126 debido a que presenta
// valores perdidos en las columna t_p5

list id if t_p5_numeric==.

drop if id==104
drop if id==126



// 6. CUANTIFICACIÓN GLOBAL DE LA SATISFACCIÓN

// 6.1 PRESENCIAL
	*Expectativas
gen p_exp_fiab = p_e1_numeric + p_e2_numeric + p_e3_numeric + p_e4_numeric + p_e5_numeric
gen p_exp_capa = p_e6_numeric + p_e7_numeric + p_e8_numeric + p_e9_numeric
gen p_exp_segu = p_e10_numeric + p_e11_numeric + p_e12_numeric + p_e13_numeric
gen p_exp_empa = p_e14_numeric + p_e15_numeric + p_e16_numeric + p_e17_numeric + p_e18_numeric
gen p_exp_tang = p_e19_numeric + p_e20_numeric + p_e21_numeric + p_e22_numeric

	*Percepciones
gen p_per_fiab = p_p1_numeric + p_p2_numeric + p_p3_numeric + p_p4_numeric + p_p5_numeric
gen p_per_capa = p_p6_numeric + p_p7_numeric + p_p8_numeric + p_p9_numeric
gen p_per_segu = p_p10_numeric + p_p11_numeric + p_p12_numeric + p_p13_numeric
gen p_per_empa = p_p14_numeric + p_p15_numeric + p_p16_numeric + p_p17_numeric + p_p18_numeric
gen p_per_tang = p_p19_numeric + p_p20_numeric + p_p21_numeric + p_p22_numeric

	*Sumatoria de expectativas y percepciones
gen suma_p_exp = p_exp_fiab + p_exp_capa + p_exp_segu + p_exp_empa + p_exp_tang
gen suma_p_per = p_per_fiab + p_per_capa + p_per_segu + p_per_empa + p_per_tang

	*Resta de percepciones - expectativas
gen p_restaPE = suma_p_per - suma_p_exp

	*Satisfacción de la atención presencial
gen eva_presencial = 0 if p_restaPE>=0
replace eva_presencial = 1 if p_restaPE<0
label define eva 0 "Satisfecho" 1 "Insatisfecho"
label value eva_presencial eva
tab eva_presencial


// 6.2 TELECONSULTA
	*Expectativas
gen t_exp_fiab = t_e1_numeric + t_e2_numeric + t_e3_numeric + t_e4_numeric + t_e5_numeric
gen t_exp_capa = t_e6_numeric + t_e7_numeric + t_e8_numeric + t_e9_numeric
gen t_exp_segu = t_e10_numeric + t_e11_numeric + t_e12_numeric + t_e13_numeric
gen t_exp_empa = t_e14_numeric + t_e15_numeric + t_e16_numeric + t_e17_numeric + t_e18_numeric
gen t_exp_tang = t_e19_numeric + t_e20_numeric + t_e21_numeric + t_e22_numeric

	*Percepciones
gen t_per_fiab = t_p1_numeric + t_p2_numeric + t_p3_numeric + t_p4_numeric + t_p5_numeric
gen t_per_capa = t_p6_numeric + t_p7_numeric + t_p8_numeric + t_p9_numeric
gen t_per_segu = t_p10_numeric + t_p11_numeric + t_p12_numeric + t_p13_numeric
gen t_per_empa = t_p14_numeric + t_p15_numeric + t_p16_numeric + t_p17_numeric + t_p18_numeric
gen t_per_tang = t_p19_numeric + t_p20_numeric + t_p21_numeric + t_p22_numeric

	*Sumatoria de expectativas y percepciones
gen suma_t_exp = t_exp_fiab + t_exp_capa + t_exp_segu + t_exp_empa + t_exp_tang
gen suma_t_per = t_per_fiab + t_per_capa + t_per_segu + t_per_empa + t_per_tang

	*Resta de percepciones - expectativas
gen t_restaPE = suma_t_per - suma_t_exp

	*Satisfacción de la atención por teleconsulta
gen eva_teleconsulta = 0 if t_restaPE>=0
replace eva_teleconsulta = 1 if t_restaPE<0
label define eva 0 "Satisfecho" 1 "Insatisfecho"
label value eva_teleconsulta eva
tab eva_teleconsulta



// 7. CUANTIFICACIÓN POR DIMENSIONES DE LA SATISFACCIÓN

// 7.1 PRESENCIAL
	*Fiabilidad
gen p_fiab_resta = p_per_fiab - p_exp_fiab
gen eva_p_fiab = 0 if p_fiab_resta>=0
replace eva_p_fiab = 1 if p_fiab_resta<0
label value eva_p_fiab eva
tab eva_p_fiab

	*Capacidad de respuesta
gen p_capa_resta = p_per_capa - p_exp_capa
gen eva_p_capa = 0 if p_capa_resta>=0
replace eva_p_capa = 1 if p_capa_resta<0
label value eva_p_capa eva
tab eva_p_capa

	*Seguridad
gen p_segu_resta = p_per_segu - p_exp_segu
gen eva_p_segu = 0 if p_segu_resta>=0
replace eva_p_segu = 1 if p_segu_resta<0
label value eva_p_segu eva
tab eva_p_segu

	*Empatía
gen p_empa_resta = p_per_empa - p_exp_empa
gen eva_p_empa = 0 if p_empa_resta>=0
replace eva_p_empa = 1 if p_empa_resta<0
label value eva_p_empa eva
tab eva_p_empa

	*Aspecto tangibles
gen p_tang_resta = p_per_tang - p_exp_tang
gen eva_p_tang = 0 if p_tang_resta>=0
replace eva_p_tang = 1 if p_tang_resta<0
label value eva_p_tang eva
tab eva_p_tang


// 7.2 TELECONSULTA
	*Fiabilidad
gen t_fiab_resta = t_per_fiab - t_exp_fiab
gen eva_t_fiab = 0 if t_fiab_resta>=0
replace eva_t_fiab = 1 if t_fiab_resta<0
label value eva_t_fiab eva
tab eva_t_fiab

	*Capacidad de respuesta
gen t_capa_resta = t_per_capa - t_exp_capa
gen eva_t_capa = 0 if t_capa_resta>=0
replace eva_t_capa = 1 if t_capa_resta<0
label value eva_t_capa eva
tab eva_t_capa

	*Seguridad
gen t_segu_resta = t_per_segu - t_exp_segu
gen eva_t_segu = 0 if t_segu_resta>=0
replace eva_t_segu = 1 if t_segu_resta<0
label value eva_t_segu eva
tab eva_t_segu

	*Empatía
gen t_empa_resta = t_per_empa - t_exp_empa
gen eva_t_empa = 0 if t_empa_resta>=0
replace eva_t_empa = 1 if t_empa_resta<0
label value eva_t_empa eva
tab eva_t_empa

	*Aspecto tangibles
gen t_tang_resta = t_per_tang - t_exp_tang
gen eva_t_tang = 0 if t_tang_resta>=0
replace eva_t_tang = 1 if t_tang_resta<0
label value eva_t_tang eva
tab eva_t_tang



// 8. CUANTIFICACIÓN POR PREGUNTA DE LA SATISFACCIÓN

// 8.1 PRESENCIAL

	*Pregunta 1 (p1)
gen p_resta_p1 = p_p1_numeric - p_e1_numeric
gen eva_p_resta_p1 = 0 if p_resta_p1>=0
replace eva_p_resta_p1 = 1 if p_resta_p1<0
label value eva_p_resta_p1 eva
tab eva_p_resta_p1

	*Pregunta 2 (p2)
gen p_resta_p2 = p_p2_numeric - p_e2_numeric
gen eva_p_resta_p2 = 0 if p_resta_p2>=0
replace eva_p_resta_p2 = 1 if p_resta_p2<0
label value eva_p_resta_p2 eva
tab eva_p_resta_p2

	*Pregunta 3 (p3)
gen p_resta_p3 = p_p3_numeric - p_e3_numeric
gen eva_p_resta_p3 = 0 if p_resta_p3>=0
replace eva_p_resta_p3 = 1 if p_resta_p3<0
label value eva_p_resta_p3 eva
tab eva_p_resta_p3

	*Pregunta 4 (p4)
gen p_resta_p4 = p_p4_numeric - p_e4_numeric
gen eva_p_resta_p4 = 0 if p_resta_p4>=0
replace eva_p_resta_p4 = 1 if p_resta_p4<0
label value eva_p_resta_p4 eva
tab eva_p_resta_p4

	*Pregunta 5 (p5)
gen p_resta_p5 = p_p5_numeric - p_e5_numeric
gen eva_p_resta_p5 = 0 if p_resta_p5>=0
replace eva_p_resta_p5 = 1 if p_resta_p5<0
label value eva_p_resta_p5 eva
tab eva_p_resta_p5

	*Pregunta 6 (p6)
gen p_resta_p6 = p_p6_numeric - p_e6_numeric
gen eva_p_resta_p6 = 0 if p_resta_p6>=0
replace eva_p_resta_p6 = 1 if p_resta_p6<0
label value eva_p_resta_p6 eva
tab eva_p_resta_p6

	*Pregunta 7 (p7)
gen p_resta_p7 = p_p7_numeric - p_e7_numeric
gen eva_p_resta_p7 = 0 if p_resta_p7>=0
replace eva_p_resta_p7 = 1 if p_resta_p7<0
label value eva_p_resta_p7 eva
tab eva_p_resta_p7

	*Pregunta 8 (p8)
gen p_resta_p8 = p_p8_numeric - p_e8_numeric
gen eva_p_resta_p8 = 0 if p_resta_p8>=0
replace eva_p_resta_p8 = 1 if p_resta_p8<0
label value eva_p_resta_p8 eva
tab eva_p_resta_p8

	*Pregunta 9 (p9)
gen p_resta_p9 = p_p9_numeric - p_e9_numeric
gen eva_p_resta_p9 = 0 if p_resta_p9>=0
replace eva_p_resta_p9 = 1 if p_resta_p9<0
label value eva_p_resta_p9 eva
tab eva_p_resta_p9

	*Pregunta 10 (p10)
gen p_resta_p10 = p_p10_numeric - p_e10_numeric
gen eva_p_resta_p10 = 0 if p_resta_p10>=0
replace eva_p_resta_p10 = 1 if p_resta_p10<0
label value eva_p_resta_p10 eva
tab eva_p_resta_p10

	*Pregunta 11 (p11)
gen p_resta_p11 = p_p11_numeric - p_e11_numeric
gen eva_p_resta_p11 = 0 if p_resta_p11>=0
replace eva_p_resta_p11 = 1 if p_resta_p11<0
label value eva_p_resta_p11 eva
tab eva_p_resta_p11

	*Pregunta 12 (p12)
gen p_resta_p12 = p_p12_numeric - p_e12_numeric
gen eva_p_resta_p12 = 0 if p_resta_p12>=0
replace eva_p_resta_p12 = 1 if p_resta_p12<0
label value eva_p_resta_p12 eva
tab eva_p_resta_p12

	*Pregunta 13 (p13)
gen p_resta_p13 = p_p13_numeric - p_e13_numeric
gen eva_p_resta_p13 = 0 if p_resta_p13>=0
replace eva_p_resta_p13 = 1 if p_resta_p13<0
label value eva_p_resta_p13 eva
tab eva_p_resta_p13

	*Pregunta 14 (p14)
gen p_resta_p14 = p_p14_numeric - p_e14_numeric
gen eva_p_resta_p14 = 0 if p_resta_p14>=0
replace eva_p_resta_p14 = 1 if p_resta_p14<0
label value eva_p_resta_p14 eva
tab eva_p_resta_p14

	*Pregunta 15 (p15)
gen p_resta_p15 = p_p15_numeric - p_e15_numeric
gen eva_p_resta_p15 = 0 if p_resta_p15>=0
replace eva_p_resta_p15 = 1 if p_resta_p15<0
label value eva_p_resta_p15 eva
tab eva_p_resta_p15

	*Pregunta 16 (p16)
gen p_resta_p16 = p_p16_numeric - p_e16_numeric
gen eva_p_resta_p16 = 0 if p_resta_p16>=0
replace eva_p_resta_p16 = 1 if p_resta_p16<0
label value eva_p_resta_p16 eva
tab eva_p_resta_p16

	*Pregunta 17 (p17)
gen p_resta_p17 = p_p17_numeric - p_e17_numeric
gen eva_p_resta_p17 = 0 if p_resta_p17>=0
replace eva_p_resta_p17 = 1 if p_resta_p17<0
label value eva_p_resta_p17 eva
tab eva_p_resta_p17

	*Pregunta 18 (p18)
gen p_resta_p18 = p_p18_numeric - p_e18_numeric
gen eva_p_resta_p18 = 0 if p_resta_p18>=0
replace eva_p_resta_p18 = 1 if p_resta_p18<0
label value eva_p_resta_p18 eva
tab eva_p_resta_p18

	*Pregunta 19 (p19)
gen p_resta_p19 = p_p19_numeric - p_e19_numeric
gen eva_p_resta_p19 = 0 if p_resta_p19>=0
replace eva_p_resta_p19 = 1 if p_resta_p19<0
label value eva_p_resta_p19 eva
tab eva_p_resta_p19

	*Pregunta 20 (p20)
gen p_resta_p20 = p_p20_numeric - p_e20_numeric
gen eva_p_resta_p20 = 0 if p_resta_p20>=0
replace eva_p_resta_p20 = 1 if p_resta_p20<0
label value eva_p_resta_p20 eva
tab eva_p_resta_p20

	*Pregunta 21 (p21)
gen p_resta_p21 = p_p21_numeric - p_e21_numeric
gen eva_p_resta_p21 = 0 if p_resta_p21>=0
replace eva_p_resta_p21 = 1 if p_resta_p21<0
label value eva_p_resta_p21 eva
tab eva_p_resta_p21

	*Pregunta 22 (p22)
gen p_resta_p22 = p_p22_numeric - p_e22_numeric
gen eva_p_resta_p22 = 0 if p_resta_p22>=0
replace eva_p_resta_p22 = 1 if p_resta_p22<0
label value eva_p_resta_p22 eva
tab eva_p_resta_p22



// 8.2 TELECONSULTA

	*Pregunta 1 (p1)
gen t_resta_p1 = t_p1_numeric - t_e1_numeric
gen eva_t_resta_p1 = 0 if t_resta_p1>=0
replace eva_t_resta_p1 = 1 if t_resta_p1<0
label value eva_t_resta_p1 eva
tab eva_t_resta_p1

	*Pregunta 2 (p2)
gen t_resta_p2 = t_p2_numeric - t_e2_numeric
gen eva_t_resta_p2 = 0 if t_resta_p2>=0
replace eva_t_resta_p2 = 1 if t_resta_p2<0
label value eva_t_resta_p2 eva
tab eva_t_resta_p2

	*Pregunta 3 (p3)
gen t_resta_p3 = t_p3_numeric - t_e3_numeric
gen eva_t_resta_p3 = 0 if t_resta_p3>=0
replace eva_t_resta_p3 = 1 if t_resta_p3<0
label value eva_t_resta_p3 eva
tab eva_t_resta_p3

	*Pregunta 4 (p4)
gen t_resta_p4 = t_p4_numeric - t_e4_numeric
gen eva_t_resta_p4 = 0 if t_resta_p4>=0
replace eva_t_resta_p4 = 1 if t_resta_p4<0
label value eva_t_resta_p4 eva
tab eva_t_resta_p4

	*Pregunta 5 (p5)
gen t_resta_p5 = t_p5_numeric - t_e5_numeric
gen eva_t_resta_p5 = 0 if t_resta_p5>=0
replace eva_t_resta_p5 = 1 if t_resta_p5<0
label value eva_t_resta_p5 eva
tab eva_t_resta_p5

	*Pregunta 6 (p6)
gen t_resta_p6 = t_p6_numeric - t_e6_numeric
gen eva_t_resta_p6 = 0 if t_resta_p6>=0
replace eva_t_resta_p6 = 1 if t_resta_p6<0
label value eva_t_resta_p6 eva
tab eva_t_resta_p6

	*Pregunta 7 (p7)
gen t_resta_p7 = t_p7_numeric - t_e7_numeric
gen eva_t_resta_p7 = 0 if t_resta_p7>=0
replace eva_t_resta_p7 = 1 if t_resta_p7<0
label value eva_t_resta_p7 eva
tab eva_t_resta_p7

	*Pregunta 8 (p8)
gen t_resta_p8 = t_p8_numeric - t_e8_numeric
gen eva_t_resta_p8 = 0 if t_resta_p8>=0
replace eva_t_resta_p8 = 1 if t_resta_p8<0
label value eva_t_resta_p8 eva
tab eva_t_resta_p8

	*Pregunta 9 (p9)
gen t_resta_p9 = t_p9_numeric - t_e9_numeric
gen eva_t_resta_p9 = 0 if t_resta_p9>=0
replace eva_t_resta_p9 = 1 if t_resta_p9<0
label value eva_t_resta_p9 eva
tab eva_t_resta_p9

	*Pregunta 10 (p10)
gen t_resta_p10 = t_p10_numeric - t_e10_numeric
gen eva_t_resta_p10 = 0 if t_resta_p10>=0
replace eva_t_resta_p10 = 1 if t_resta_p10<0
label value eva_t_resta_p10 eva
tab eva_t_resta_p10

	*Pregunta 11 (p11)
gen t_resta_p11 = t_p11_numeric - t_e11_numeric
gen eva_t_resta_p11 = 0 if t_resta_p11>=0
replace eva_t_resta_p11 = 1 if t_resta_p11<0
label value eva_t_resta_p11 eva
tab eva_t_resta_p11

	*Pregunta 12 (p12)
gen t_resta_p12 = t_p12_numeric - t_e12_numeric
gen eva_t_resta_p12 = 0 if t_resta_p12>=0
replace eva_t_resta_p12 = 1 if t_resta_p12<0
label value eva_t_resta_p12 eva
tab eva_t_resta_p12

	*Pregunta 13 (p13)
gen t_resta_p13 = t_p13_numeric - t_e13_numeric
gen eva_t_resta_p13 = 0 if t_resta_p13>=0
replace eva_t_resta_p13 = 1 if t_resta_p13<0
label value eva_t_resta_p13 eva
tab eva_t_resta_p13

	*Pregunta 14 (p14)
gen t_resta_p14 = t_p14_numeric - t_e14_numeric
gen eva_t_resta_p14 = 0 if t_resta_p14>=0
replace eva_t_resta_p14 = 1 if t_resta_p14<0
label value eva_t_resta_p14 eva
tab eva_t_resta_p14

	*Pregunta 15 (p15)
gen t_resta_p15 = t_p15_numeric - t_e15_numeric
gen eva_t_resta_p15 = 0 if t_resta_p15>=0
replace eva_t_resta_p15 = 1 if t_resta_p15<0
label value eva_t_resta_p15 eva
tab eva_t_resta_p15

	*Pregunta 16 (p16)
gen t_resta_p16 = t_p16_numeric - t_e16_numeric
gen eva_t_resta_p16 = 0 if t_resta_p16>=0
replace eva_t_resta_p16 = 1 if t_resta_p16<0
label value eva_t_resta_p16 eva
tab eva_t_resta_p16

	*Pregunta 17 (p17)
gen t_resta_p17 = t_p17_numeric - t_e17_numeric
gen eva_t_resta_p17 = 0 if t_resta_p17>=0
replace eva_t_resta_p17 = 1 if t_resta_p17<0
label value eva_t_resta_p17 eva
tab eva_t_resta_p17

	*Pregunta 18 (p18)
gen t_resta_p18 = t_p18_numeric - t_e18_numeric
gen eva_t_resta_p18 = 0 if t_resta_p18>=0
replace eva_t_resta_p18 = 1 if t_resta_p18<0
label value eva_t_resta_p18 eva
tab eva_t_resta_p18

	*Pregunta 19 (p19)
gen t_resta_p19 = t_p19_numeric - t_e19_numeric
gen eva_t_resta_p19 = 0 if t_resta_p19>=0
replace eva_t_resta_p19 = 1 if t_resta_p19<0
label value eva_t_resta_p19 eva
tab eva_t_resta_p19

	*Pregunta 20 (p20)
gen t_resta_p20 = t_p20_numeric - t_e20_numeric
gen eva_t_resta_p20 = 0 if t_resta_p20>=0
replace eva_t_resta_p20 = 1 if t_resta_p20<0
label value eva_t_resta_p20 eva
tab eva_t_resta_p20

	*Pregunta 21 (p21)
gen t_resta_p21 = t_p21_numeric - t_e21_numeric
gen eva_t_resta_p21 = 0 if t_resta_p21>=0
replace eva_t_resta_p21 = 1 if t_resta_p21<0
label value eva_t_resta_p21 eva
tab eva_t_resta_p21

	*Pregunta 22 (p22)
gen t_resta_p22 = t_p22_numeric - t_e22_numeric
gen eva_t_resta_p22 = 0 if t_resta_p22>=0
replace eva_t_resta_p22 = 1 if t_resta_p22<0
label value eva_t_resta_p22 eva
tab eva_t_resta_p22
