

* TABLA 1 * (base: Data_satis)

tab Sexo

tabstat EdaddelEncuestado, s(mean sd n)

gen grupo_eta=1 if EdaddelEncuestado<45
replace grupo_eta=2 if EdaddelEncuestado>=45 & EdaddelEncuestado<60
replace grupo_eta=3 if EdaddelEncuestado>=60
label define eta 1 "Menor de 45 años" 2 "De 45 a 59 años" 3 "Adulto mayor"
label value grupo_eta eta
tab grupo_eta
order grupo_eta, after(EdaddelEncuestado)

tab NiveldeEstudios

tab MotivodelaConsulta

tab Especialidaddondefueatendido

tab CondicióndelEncuestado


* FIGURA 1: Dimensiones de evaluación de satisfacción en el usuario en la atención presencial (base: Data_satis_graficos)

graph bar (asis) satis_porc insatis_porc if categoria=="Fiabilidad" | categoria=="Capacidad de respuesta" | categoria=="Seguridad" | categoria=="Empatía" | categoria=="Aspectos tangibles", over(categoria) blabel(bar)
	// Se realizaron agregados con la edición del STATA
	

* FIGURA 2: Dimensiones de evaluación de satisfacción en el usuario en la atención por teleconsulta (base: Data_satis_graficos)

graph bar (asis) satis_porc insatis_porc if categoria=="Fiabilidad_t" | categoria=="Capacidad de respuesta_t" | categoria=="Seguridad_t" | categoria=="Empatía_t" | categoria=="Aspectos tangibles_t", over(categoria) blabel(bar)
	// Se realizaron agregado con la edicion del STATA

	
* TABLA 2 * (base: Data_satis)

mcc eva_presencial eva_teleconsulta
	// p=0.0000

	

	
* MATERIAL SUPLEMENTARIO (base: Data_satis_graficos)

// PRESENCIAL //

// Fiabilidad
graph bar (asis) satis_porc insatis_porc if categoria=="Pregunta 1" | categoria=="Pregunta 2" | categoria=="Pregunta 3" | categoria=="Pregunta 4" | categoria=="Pregunta 5" | categoria=="Fiabilidad", over(categoria) blabel(bar)
	// Se realizarons agregados con la edición del STATA

// Capacidad de respuesta
graph bar (asis) satis_porc insatis_porc if categoria=="Pregunta 6" | categoria=="Pregunta 7" | categoria=="Pregunta 8" | categoria=="Pregunta 9" | categoria=="Capacidad de respuesta", over(categoria) blabel(bar)
	// Se realizarons agregados con la edición del STATA

// Seguridad
graph bar (asis) satis_porc insatis_porc if categoria=="Pregunta 10" | categoria=="Pregunta 11" | categoria=="Pregunta 12" | categoria=="Pregunta 13" | categoria=="Seguridad", over(categoria) blabel(bar) 
	// Se realizarons agregados con la edición del STATA

// Empatía
graph bar (asis) satis_porc insatis_porc if categoria=="Pregunta 14" | categoria=="Pregunta 15" | categoria=="Pregunta 16" | categoria=="Pregunta 17" | categoria=="Pregunta 18" | categoria=="Empatía", over(categoria) blabel(bar)
	// Se realizarons agregados con la edición del STATA

// Aspectos tangibles
graph bar (asis) satis_porc insatis_porc if categoria=="Pregunta 19" | categoria=="Pregunta 20" | categoria=="Pregunta 21" | categoria=="Pregunta 22" | categoria=="Aspectos tangibles", over(categoria) blabel(bar)



// TELECONSULTA //

// Fiabilidad
graph bar (asis) satis_porc insatis_porc if categoria=="Pregunta 1t" | categoria=="Pregunta 2t" | categoria=="Pregunta 3t" | categoria=="Pregunta 4t" | categoria=="Pregunta 5t" | categoria=="Fiabilidad_t", over(categoria) blabel(bar)
	// Se realizarons agregados con la edición del STATA

// Capacidad de respuesta
graph bar (asis) satis_porc insatis_porc if categoria=="Pregunta 6t" | categoria=="Pregunta 7t" | categoria=="Pregunta 8t" | categoria=="Pregunta 9t" | categoria=="Capacidad de respuesta_t", over(categoria) blabel(bar)
	// Se realizarons agregados con la edición del STATA

// Seguridad
graph bar (asis) satis_porc insatis_porc if categoria=="Pregunta 10t" | categoria=="Pregunta 11t" | categoria=="Pregunta 12t" | categoria=="Pregunta 13t" | categoria=="Seguridad_t", over(categoria) blabel(bar)
	// Se realizarons agregados con la edición del STATA

// Empatía
graph bar (asis) satis_porc insatis_porc if categoria=="Pregunta 14t" | categoria=="Pregunta 15t" | categoria=="Pregunta 16t" | categoria=="Pregunta 17t" | categoria=="Pregunta 18t" | categoria=="Empatía_t", over(categoria) blabel(bar)
	// Se realizarons agregados con la edición del STATA

// Aspectos tangibles
graph bar (asis) satis_porc insatis_porc if categoria=="Pregunta 19t" | categoria=="Pregunta 20t" | categoria=="Pregunta 21t" | categoria=="Pregunta 22t" | categoria=="Aspectos tangibles_t", over(categoria) blabel(bar)


