// Función para validar las rondas de la competencia y participantes

SubProceso Validacion_Rondas_Participantes(CantPart Por Referencia, CantRondas Por Referencia)
	Si CantRondas>1 y CantRondas<Redon(CantPart/2) Entonces
		Escribir " ";	
		Escribir "Comité de deportes";
		Escribir "Módulo Control de puntuaciones";
		
	SiNo
		Escribir "Favor digitar un número mayor a 1 y menor a la mitad de los participantes";
		Leer CantRondas;
	FinSi
FinSubProceso


// OpciónMenú 1. Función para inicializar la Matriz_Competencia

Subproceso Inicio_Matriz(EsPrimeraVez Por Referencia, CantRondas Por Referencia, CantPart Por Referencia)
		
	Definir i,j,k Como Entero;
	
	Si EsPrimeraVez=Falso entonces
		EsPrimeraVez=Verdadero;
			
		Escribir "Inicializando Matriz de competencias...";
		Escribir "Digite ENTER para continuar";
		Esperar Tecla;
		
	SiNo
		Escribir "Esta opción no se puede volver a elegir una vez seleccionada";
		Escribir "Digite ENTER para continuar";
		Esperar Tecla;
		
	FinSi
		
FinSubProceso



// OpciónMenú2. Función para almacenar puntuaciones en matriz

SubProceso Llenar_Matriz(Matriz_Competencia Por Referencia, Vector_Participantes Por Referencia, EsPrimeraVez Por Referencia, RondasFinalizadas Por Referencia, CantRondas Por Referencia, CantPart Por Referencia, ReporteDeRonda Por Referencia)
	
	Definir i,j,k Como Entero;
	Definir Puntos Como Entero;
	Definir GenerarReporte Como Logico;
	
	GenerarReporte=Falso;
	
	Si EsPrimeraVez=Verdadero Entonces;
		
		
		Para i=0 Hasta CantRondas-1 Hacer
			Para j=0 Hasta CantPart-1 Hacer
				
				Puntos=Aleatorio(0,10);
				Matriz_Competencia[i,j]=ConvertirATexto(Puntos);
				Vector_Participantes[j]=j+1;
				
				Si i=CantRondas-1 Y j=CantPart-1 Entonces
					GenerarReporte=Verdadero;
					RondasFinalizadas=Verdadero;
				FinSi
				
			FinPara
			
		FinPara
		
		Si GenerarReporte=Verdadero Entonces 
			Reporte_Puntuaciones(Matriz_Competencia, Vector_Participantes, CantPart, CantRondas, ReporteDeRonda);
			
		FinSi
		
	SiNo
		Escribir "Debe de Inicializar los puntajes (opción 1) para elegir esta opción.";
		Escribir "Digite Enter para volver al menú.";
		Esperar Tecla;
	FinSi
FinSubproceso


Subproceso Reporte_Puntuaciones(Matriz_Competencia Por Referencia, Vector_Participantes Por Referencia, CantPart Por Referencia, CantRondas Por Referencia, ReporteDeRonda por Referencia)
	
	Definir i, j, k, l, Aux, AuxParticipante Como Entero;
	Definir Puntos Como Entero;
	
	Puntos=0;
	
	Para i=0 Hasta CantRondas-1 Hacer
		Para j=0 Hasta CantPart-1 Hacer
			Para k=0 Hasta CantRondas-1 Hacer
				Para l=0 Hasta CantPart-1 Hacer
					
					Si ConvertirANumero(Matriz_Competencia[i,j]) > ConvertirANumero(Matriz_Competencia[k,l]) Entonces
						Aux=ConvertirANumero(Matriz_Competencia[i,j]);
						AuxParticipante=Vector_Participantes[j];
						Matriz_Competencia[i,j]=Matriz_Competencia[k,l];
						Vector_Participantes[j]=l;
						Matriz_Competencia[k,l]=ConvertirATexto(Aux);
						Vector_Participantes[l]=AuxParticipante;
					FinSi
				
				FinPara
			FinPara
		FinPara
	FinPara
		
		
		Escribir "Comité de deportes";
		Escribir "Módulo control de puntuaciones";
		Escribir "-------------------------------------------";
		
		Si ReporteDeRonda < CantRondas-1 Entonces
			ReporteDeRonda = ReporteDeRonda+1;
			
			Escribir "Ejecutando la Ronda ", ReporteDeRonda;
			Escribir " ";
			Escribir "Resultado de esta ronda";
			
		SiNo
			ReporteDeRonda=0;
			Escribir "Resultados finales de la competencia";
			
		FinSi
		
		Para j=0 Hasta CantPart-1 Hacer
			Escribir "Posición ", j+1, " Competidor ", Vector_Participantes[j]+1, " Puntos ", Matriz_Competencia[ReporteDeRonda,j];
		FinPara
		
		Escribir "";
		Escribir "Digite Enter para volver al menú";
		Esperar Tecla;		
		
FinSubProceso



// OpciónMenú3. Función consulta puntuaciones

Funcion Consulta_Puntuaciones(Matriz_Competencia Por Referencia, Vector_Participantes Por Referencia, EsPrimeraVez Por Referencia, CantRondas Por Referencia, CantPart Por Referencia, RondaConsulta Por Referencia)
	
	Definir i, j, k, l, Aux, AuxParticipante Como Entero;
	Definir Participantes Como Caracter;
	Definir PuntosCaracter Como Caracter;
	
	Participantes="";
	PuntosCaracter="";
	
	Si EsPrimeraVez=Verdadero Entonces;
			
		Escribir "Escribir la ronda que desea consultar";
		Leer RondaConsulta;
			
		Si RondaConsulta<>0 Entonces
			
			Para j=0 Hasta CantPart-1 Hacer
					Participantes = Concatenar(Participantes,Concatenar(" ", Concatenar("P", convertirATexto(j+1)))); 
					PuntosCaracter = Concatenar(PuntosCaracter,Concatenar("  ", (Matriz_Competencia[RondaConsulta-1,j]))); 
			FinPara
				
			Escribir Participantes;
			Escribir "-----------------------------------------------------------------------------------------";
			Escribir PuntosCaracter;
			Escribir "-----------------------------------------------------------------------------------------";
			Escribir "Digite ENTER para continuar";
			Esperar Tecla;
				
				
		Si RondaConsulta = CantRondas-1 Entonces
			Para i=0 Hasta CantRondas-1 Hacer
				Para j=0 Hasta CantPart-1 Hacer
					Para k=0 Hasta CantRondas-1 Hacer
						Para l=0 Hasta CantPart-1 Hacer
								
							Si ConvertirANumero(Matriz_Competencia[i,j]) < ConvertirANumero(Matriz_Competencia[k,l]) Entonces
								Aux=ConvertirANumero(Matriz_Competencia[i,j]);
								AuxParticipante=Vector_Participantes[j];
								Matriz_Competencia[i,j]=Matriz_Competencia[k,l];
								Vector_Participantes[j]=l;
								Matriz_Competencia[k,l]=ConvertirATexto(Aux);
								Vector_Participantes[l]=AuxParticipante;
							FinSi
								
						FinPara
					FinPara
				FinPara
			FinPara
			
			Escribir "";
			Para i=0 Hasta CantRondas-1 Hacer
			Para j=0 Hasta CantPart-1 Hacer
				Si j<=1 Entonces
					Matriz_Competencia[i,j]="PE";
				FinSi
			FinPara
			FinPara
			
			
		FinSi
		
		
		SiNo 
			Escribir "Si no desea confirmar puntuaciones, digite ENTER.";
			Esperar Tecla;
		FinSi
			
	SiNo
		Escribir "Debe de Inicializar los puntajes (opción 1) para elegir esta opción.";
		Escribir "Digite Enter para volver al menú.";
		Esperar Tecla;
	FinSi
	
FinFuncion

// OpciónMenú4. Función para el reporte de toda la competencia

Funcion Reporte_Competencia(Matriz_Competencia Por Referencia, EsPrimeraVez Por Referencia, RondasFinalizadas Por Referencia, Vector_Participantes Por Referencia, CantRondas Por Referencia, CantPart Por Referencia, RondaConsulta Por Referencia)
	
	Definir i, j, k, l, Aux, AuxParticipante Como Entero;
	Definir Participantes Como Caracter;
	Definir PuntosCaracter Como Caracter;
	
	Participantes="";
	PuntosCaracter="";
	
	Si EsPrimeraVez=Verdadero Y RondasFinalizadas=Verdadero Entonces;
		Escribir "";
		
		Para j=0 Hasta CantPart-1 Hacer
			Participantes = Concatenar(Participantes,Concatenar(" ", Concatenar("P", convertirATexto(j+1)))); 
		FinPara
		

		
		Escribir "Comité de deportes";
		Escribir "Módulo Control de Puntuaciones";
		Escribir "Resultados de la competencia";
		Escribir "------------------------------------------------------------------------------";
		Escribir Participantes;
		Escribir "-----------------------------------------------------------------------------------------";
		Para i=0 Hasta CantRondas-1 Hacer
			PuntosCaracter="";
			Para j=0 Hasta CantPart-1 Hacer
				PuntosCaracter = Concatenar(PuntosCaracter,Concatenar("  ", (Matriz_Competencia[i,j]))); 
			FinPara
			Escribir PuntosCaracter;
		FinPara
		Escribir "-----------------------------------------------------------------------------------------";		
		
		
		
	SiNo
		Escribir "Debe de Inicializar los puntajes y registrar los datos de las rondas (opción 1 y 2) para elegir esta opción.";
		Escribir "Digite Enter para volver al menú.";
		Esperar Tecla;
	FinSi
	
FinFuncion


// OpciónMenú5.Función para el reporte de los ganadores

Funcion Matriz_Competencia <- Reporte_Ganadores(EsPrimeraVez Por Referencia, RondasFinalizadas Por Referencia, Puntos Por Referencia, CantRondas Por Referencia, CantPart Por Referencia, Matriz_Competencia Por Referencia)

Si EsPrimeraVez=Verdadero Y PrimeraVezEjecutada=Verdadero Entonces;
	Escribir "";
SiNo
	Escribir "Debe de Inicializar los puntajes y registrar los datos de las rondas (opción 1 y 2) para elegir esta opción.";
	Escribir "Digite Enter para volver al menú.";
	Esperar Tecla;
FinSi

FinFuncion


// Inicio del algoritmo

Algoritmo Comite_deportes
	
	//Declaración de variables
	
	Definir CantPart Como Entero;
	Definir CantRondas Como Entero;
	Definir OpcionMenu Como Entero;
	Definir EsPrimeraVez Como Logico;
	Definir RondasFinalizadas Como Logico;
	Definir ReporteDeRonda Como Entero;
	Definir RondaConsulta Como Entero;
	Definir Puntos Como Entero;

		
	//Declaración matriz
	Definir Matriz_Competencia Como Caracter;
	
	//Declaración matriz participantes
	Definir Vector_Participantes Como Entero;
	
	//Inicialización de variables
	
	CantPart=0;
	CantRondas=0;
	EsPrimeraVez=Falso;
	RondasFinalizadas=Falso;
	Puntos=0;
	ReporteDeRonda=0;
	
	
	
	Escribir "Comité de deportes";
	Escribir "Módulo Control de puntuaciones";
	Escribir "Inicialización de parámetros";
	
	Escribir "--------------------------------------";
	
	Escribir "Digitar cantidad de participantes";
	Leer CantPart;
	
	Escribir "Digitar cantidad de rondas";
	Leer CantRondas;
	Validacion_Rondas_Participantes(CantPart, CantRondas);
	
	
	// Menú módulo de control de puntuaciones
	
	Repetir
		
		Escribir "";
		Escribir "Comité de deportes";
		Escribir "Módulo Control de puntuaciones";
		Escribir "---------------------------------------------";
		Escribir "1. Inicialización de puntajes";
		Escribir "2. Registro de datos de cada ronda";
		Escribir "3. Consulta de puntuaciones de una ronda";
		Escribir "4. Reporte de toda la competencia";
		Escribir "5. Reporte de ganadores de la fecha";
		Escribir "6. Salir del menú";
		Leer OpcionMenu;
		
		Si OpcionMenu<>1 Y OpcionMenu<>2 Y OpcionMenu<>3 Y OpcionMenu<>4 Y OpcionMenu<>5 Y OpcionMenu<>6 Entonces
			Escribir "Error. Debe de digitar una de las opciones del menú.";
			Escribir "Presione cualquier tecla para continuar.";
			Esperar Tecla;
	FinSi
		
	
	Segun OpcionMenu Hacer
		
		1: //Inicialización de la Matriz_Competencia
			
			Inicio_Matriz(EsPrimeraVez, CantRondas, CantPart);
			
			Dimension Matriz_Competencia[CantRondas, CantPart];
			Matriz_Competencia[0, 0]=ConvertirATexto(99);
			
			Dimension Vector_Participantes[CantPart];
			Vector_Participantes[0]=0;
			
		2: // Llenado de la Matriz_Competencia
			
			Llenar_Matriz(Matriz_Competencia, Vector_Participantes, EsPrimeraVez, RondasFinalizadas, CantRondas, CantPart, ReporteDeRonda);
			
		3: // Consulta de puntuaciones de una ronda
			
			Consulta_Puntuaciones(Matriz_Competencia, Vector_Participantes, EsPrimeraVez, CantRondas, CantPart, RondaConsulta);
			
		4: // Reporte de la competencia
			
			Reporte_Competencia(Matriz_Competencia, EsPrimeraVez, RondasFinalizadas, Vector_Participantes, CantRondas, CantPart, RondaConsulta);
			
			
		5: // Reporte de ganadores
			
			Matriz_Competencia <- Reporte_Ganadores(EsPrimeraVez, RondasFinalizadas, Puntos, CantRondas, CantPart, Matriz_Competencia);
		
	FinSegun
	
Hasta que OpcionMenu=6
Escribir "Saliendo del sistema.";
	
FinAlgoritmo
