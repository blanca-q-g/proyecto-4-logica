// Función para validar las rondas de la competencia y participantes

SubProceso Validacion_Rondas_Participantes(CantPart Por Referencia, CantRondas Por Referencia)
	Si CantRondas>1 Entonces
		Escribir " ";	
		Escribir "Comité de deportes";
		Escribir "Módulo Control de puntuaciones";
		
	SiNo
		Escribir "Favor digitar un número mayor a 1";
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
	
	Definir MenorPosicion1 como Entero;
	Definir MenorPosicion2 como Entero;
	Definir MenorPuntos1 como Entero;
	Definir MenorPuntos2 como Entero;
	
	MenorPosicion1=0;
	MenorPosicion2=0;
	
	GenerarReporte=Falso;
	
	Si EsPrimeraVez=Verdadero Entonces;
		
		Para i=0 Hasta CantRondas-1 Hacer
			
			MenorPosicion1=0;
			MenorPosicion2=0;
			MenorPuntos1=0;
			MenorPuntos2=0;
			
			Para j=0 Hasta CantPart-1 Hacer
				
				Puntos=Aleatorio(0,10);
				Matriz_Competencia[i,j]=ConvertirATexto(Puntos);
				Vector_Participantes[j]=j+1;
				
				// Buscando últimos dos participantes
				
				Si MenorPuntos1<Puntos Entonces
					MenorPuntos1=ConvertirANumero(Matriz_Competencia[i,j]);
					MenorPosicion1=j;
				FinSi
				
				Si MenorPuntos2<ConvertirANumero(Matriz_Competencia[i,j]) Y ConvertirANumero(Matriz_Competencia[i,j]) > MenorPuntos1 Entonces
					MenorPuntos2=ConvertirANumero(Matriz_Competencia[i,j]);
					MenorPosicion2=j;
				FinSi
				
				Si i=CantRondas-1 Y j=CantPart-1 Entonces
					GenerarReporte=Verdadero;
				FinSi
				
			FinPara
				
			Matriz_Competencia[i,MenorPosicion1]="PE";
			Matriz_Competencia[i,MenorPosicion2]="PE";
				
		FinPara
		
		Si GenerarReporte=Verdadero Entonces 
			Reporte_Puntuaciones(Matriz_Competencia, Vector_Participantes, CantPart, CantRondas, ReporteDeRonda, RondasFinalizadas);
		FinSi
		
	SiNo
		Escribir "Debe de Inicializar los puntajes (opción 1) para elegir esta opción.";
		Escribir "Digite Enter para volver al menú.";
		Esperar Tecla;
	FinSi
		
FinSubproceso


Subproceso Reporte_Puntuaciones(Matriz_Competencia Por Referencia, Vector_Participantes Por Referencia, CantPart Por Referencia, CantRondas Por Referencia, ReporteDeRonda por Referencia, RondasFinalizadas Por Referencia)
	
	Definir i, j, k, l, Aux, AuxParticipante Como Entero;
	Definir Puntos Como Entero;
	
	Puntos=0;
	
	Para i=0 Hasta CantRondas-1 Hacer
		Para j=0 Hasta CantPart-1 Hacer
			Para k=0 Hasta CantRondas-1 Hacer
				Para l=0 Hasta CantPart-1 Hacer
					
					Si Matriz_Competencia[k,l]<>"PE" Y Matriz_Competencia[i,j]<>"PE" Entonces
						
						Si ConvertirANumero(Matriz_Competencia[i,j]) > ConvertirANumero(Matriz_Competencia[k,l]) Entonces
							Aux=ConvertirANumero(Matriz_Competencia[i,j]);
							AuxParticipante=Vector_Participantes[j];
							Matriz_Competencia[i,j]=Matriz_Competencia[k,l];
							Vector_Participantes[j]=l;
							Matriz_Competencia[k,l]=ConvertirATexto(Aux);
							Vector_Participantes[l]=AuxParticipante;
						FinSi
						
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
			RondasFinalizadas=Verdadero;
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
				
			Para i=0 Hasta CantRondas-1 Hacer
				Para j=0 Hasta CantPart-1 Hacer
					Para k=0 Hasta CantRondas-1 Hacer
						Para l=0 Hasta CantPart-1 Hacer
							
							Si Matriz_Competencia[k,l]<>"PE" Y Matriz_Competencia[i,j]<>"PE" Entonces
							
							Si ConvertirANumero(Matriz_Competencia[i,j]) > ConvertirANumero(Matriz_Competencia[k,l]) Entonces
								Aux=ConvertirANumero(Matriz_Competencia[i,j]);
								AuxParticipante=Vector_Participantes[j];
								Matriz_Competencia[i,j]=Matriz_Competencia[k,l];
								Vector_Participantes[j]=l;
								Matriz_Competencia[k,l]=ConvertirATexto(Aux);
								Vector_Participantes[l]=AuxParticipante;
							FinSi
							
							FinSi
							
						FinPara
					FinPara
				FinPara
			FinPara
			
			Escribir "";
			Para i=0 Hasta CantRondas-1 Hacer
				Para j=0 Hasta CantPart-1 Hacer
					Si j>=CantPart-2 Y j<=CantPart-1 Entonces
						Matriz_Competencia[i,j]="PE";
					FinSi
				FinPara
			FinPara
			
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

Funcion Reporte_Ganadores(Matriz_Competencia Por Referencia, Vector_Participantes Por Referencia, EsPrimeraVez Por Referencia, RondasFinalizadas Por Referencia, CantRondas Por Referencia, CantPart Por Referencia, ReporteDeRonda Por Referencia)
	
	Definir i, j, k, l, Aux, AuxParticipante Como Entero;
	Definir Participantes Como Caracter;
	Definir PuntosCaracter Como Caracter;
	Definir Puntos Como Entero;
	
	Definir PrimerLugar Como Entero;
	Definir PrimerPosicion Como Entero;
	
	Definir SegundoLugar Como Entero;
	Definir SegundaPosicion Como Entero;
	
	Definir TercerLugar Como Entero;
	Definir TercerPosicion Como Entero;
	
	Definir Contador Como Entero;
	
	Definir Matriz_Ganadores Como Caracter;
	
	Definir TotalDepuntos Como Entero;
	
	Definir PromedioPuntos Como Entero;
	
	Definir PromedioPuntos1 Como Real;
	Definir PuntuacionMenor1 Como Entero;
	Definir PuntuacionMayor1 Como Entero;
	
	Definir PromedioPuntos2 Como Real;
	Definir PuntuacionMenor2 Como Entero;
	Definir PuntuacionMayor2 Como Entero;
	
	Definir PromedioPuntos3 Como Real;
	Definir PuntuacionMenor3 Como Entero;
	Definir PuntuacionMayor3 Como Entero;
	
	PromedioPuntos1=0;
	PuntuacionMenor1=0;
	PuntuacionMayor1=0;
	
	PromedioPuntos2=0;
	PuntuacionMenor2=0;
	PuntuacionMayor2=0; 
	
	PromedioPuntos3=0;
	PuntuacionMenor3=0; 
	PuntuacionMayor3=0;
	
	Dimension Matriz_Ganadores[CantRondas,2];
	Matriz_Ganadores[0,0]=ConvertirATexto(0);
	
	PrimerLugar=0;
	PrimerPosicion=0;
	
	SegundoLugar=0;
	SegundaPosicion=0;
	
	TercerLugar=0;
	TercerPosicion=0;
	
	Puntos=0;
	Contador=0;
	TotalDepuntos=0;
	
	
Si EsPrimeraVez=Verdadero Y RondasFinalizadas=Verdadero Entonces;

	//Ordenamiento de la matriz de mayor a menor para mejor facilidad al mostrar a los ganadores 
	Para i=0 Hasta CantRondas-1 Hacer
		Para j=0 Hasta CantPart-1 Hacer
			Para k=0 Hasta CantRondas-1 Hacer
				Para l=0 Hasta CantPart-1 Hacer
					
					Si Matriz_Competencia[k,l]<>"PE" Y Matriz_Competencia[i,j]<>"PE" Entonces
						
						Si ConvertirANumero(Matriz_Competencia[i,j]) > ConvertirANumero(Matriz_Competencia[k,l]) Entonces
							Aux=ConvertirANumero(Matriz_Competencia[i,j]);
							AuxParticipante=Vector_Participantes[j];
							Matriz_Competencia[i,j]=Matriz_Competencia[k,l];
							Vector_Participantes[j]=l;
							Matriz_Competencia[k,l]=ConvertirATexto(Aux);
							Vector_Participantes[l]=AuxParticipante;
						FinSi
						
					FinSi
					
				FinPara
			FinPara
		FinPara
	FinPara
	
	
	// Ciclo para encontrar a los primeros tres lugares de la competencia
		
	Para i=0 Hasta CantRondas-1 Hacer
		Para j=0 Hasta CantPart-1 Hacer
				
				Si EsNumero(Matriz_Competencia[i,j])=Verdadero Y PrimerLugar=0 Entonces
					PrimerLugar=ConvertirANumero(Matriz_Competencia[i,j]);
					SegundoLugar=0;
					TercerLugar=0;
				FinSi
				
		FinPara
	FinPara
	
	Para i=0 Hasta CantRondas-1 Hacer
		Para j=0 Hasta CantPart-1 Hacer
			
			Si EsNumero(Matriz_Competencia[i,j])=Verdadero Entonces
				
				Si PrimerLugar<ConvertirANumero(Matriz_Competencia[i,j]) Entonces
					PrimerLugar=ConvertirANumero(Matriz_Competencia[i,j]);
					PrimerPosicion=j;
				FinSi
					
				Si SegundoLugar<ConvertirANumero(Matriz_Competencia[i,j]) Y PrimerLugar<>ConvertirANumero(Matriz_Competencia[i,j]) Entonces
					SegundoLugar=ConvertirANumero(Matriz_Competencia[i,j]);
					SegundaPosicion=j;
				FinSi
					
				Si TercerLugar<ConvertirANumero(Matriz_Competencia[i,j]) Y SegundoLugar<>ConvertirANumero(Matriz_Competencia[i,j]) Y PrimerLugar<>ConvertirANumero(Matriz_Competencia[i,j]) Y SegundoLugar<>ConvertirANumero(Matriz_Competencia[i,j]) Entonces
					TercerLugar=ConvertirANumero(Matriz_Competencia[i,j]);
					TercerPosicion=j;
				FinSi
					
			FinSi
				
		FinPara
	FinPara
	
	
	// Ciclo para obtener promedio, resultado mayor y menor de los ganadores
	
	Para i=0 Hasta CantRondas-1 Hacer
		
		Contador=0;
		
		Para j=0 Hasta CantPart-1 Hacer 
			
			Si EsNumero(Matriz_Ganadores[i,Contador])=Verdadero Entonces
				
				Si j=PrimerPosicion Entonces
					
					Matriz_Competencia[i,j]=Matriz_Ganadores[i,Contador];
					
					TotalDepuntos=TotalDepuntos+ConvertirANumero(Matriz_Ganadores[i,Contador]);
					PromedioPuntos1=TotalDepuntos/3;
					
						Si PuntuacionMenor1<ConvertirANumero(Matriz_Ganadores[i,Contador]) Entonces
							PuntuacionMenor1=ConvertirANumero(Matriz_Ganadores[i,Contador]);
						FinSi
						
						Si PuntuacionMayor1>ConvertirANumero(Matriz_Ganadores[i,Contador]) Y PuntuacionMenor1<>ConvertirANumero(Matriz_Ganadores[i,Contador]) Entonces
							PuntuacionMayor1=ConvertirANumero(Matriz_Ganadores[i,Contador]);
						FinSi
						
				FinSi
					
				Si j=SegundaPosicion Entonces
					
					Matriz_Ganadores[i,Contador]=Matriz_Competencia[i,j];
					
					TotalDepuntos=TotalDepuntos+ConvertirANumero(Matriz_Ganadores[i,Contador]);
					PromedioPuntos2=TotalDepuntos/3;
						
						Si PuntuacionMenor2<ConvertirANumero(Matriz_Ganadores[i,Contador]) Entonces
							PuntuacionMenor2=ConvertirANumero(Matriz_Ganadores[i,Contador]);
						FinSi
						
						Si PuntuacionMayor2>ConvertirANumero(Matriz_Ganadores[i,Contador]) Y PuntuacionMenor2<>ConvertirANumero(Matriz_Ganadores[i,Contador]) Entonces
							PuntuacionMayor2=ConvertirANumero(Matriz_Ganadores[i,Contador]);
						FinSi
				FinSi
					
				Si j=TercerPosicion Entonces
					
					Matriz_Competencia[i,j]=Matriz_Ganadores[i,Contador];
					
					TotalDepuntos=TotalDepuntos+ConvertirANumero(Matriz_Ganadores[i,Contador]);
					PromedioPuntos3=TotalDepuntos/3;
					
						Si PuntuacionMenor3<ConvertirANumero(Matriz_Ganadores[i,Contador]) Entonces
							PuntuacionMenor3=ConvertirANumero(Matriz_Ganadores[i,Contador]);
						FinSi
						
						Si PuntuacionMayor3>ConvertirANumero(Matriz_Ganadores[i,Contador]) Y PuntuacionMenor3<>ConvertirANumero(Matriz_Ganadores[i,Contador]) Entonces
							PuntuacionMayor3=ConvertirANumero(Matriz_Ganadores[i,Contador]);
						FinSi
				FinSi
			FinSi
			
			Contador=Contador+1;
			
		FinPara
	FinPara
			
		Escribir "";
		Escribir "Comité de deportes";
		Escribir "Módulo Control de puntuaciones";
		Escribir "Resultados finales de la competencia";
		Escribir "------------------------------------------------------------------";
		Escribir "Lugar Ronda Participantes Puntuación";
			
			
		Para i=0 Hasta CantRondas-1 Hacer
			Para j=0 Hasta CantPart-1 Hacer
			FinPara
			Escribir "1: ", "     ", i+1, "        ", PrimerLugar, "           ", Contador;
		FinPara		
			
		Escribir "------------------------------------------------------------------";
		Escribir "Promedio de puntuación: ", PromedioPuntos1; 
		Escribir "Puntuación más baja: ", PuntuacionMenor1;
		Escribir "Puntuación más alta: ", PuntuacionMayor1;
			
			
		Escribir "------------------------------------------------------------------";
		Para i=0 Hasta CantRondas-1 Hacer
			Para j=0 Hasta CantPart-1 Hacer
			FinPara
				Escribir "2:  ", "    ", i+1, "       ", SegundoLugar, "           ", Contador;
		FinPara		
			
			
		Escribir "------------------------------------------------------------------";
		Escribir "Promedio de puntuación: ", PromedioPuntos2; 
		Escribir "Puntuación más baja: ", PuntuacionMenor2;
		Escribir "Puntuación más alta: ", PuntuacionMayor2;
		
		Escribir "------------------------------------------------------------------";
		Para i=0 Hasta CantRondas-1 Hacer
			Para j=0 Hasta CantPart-1 Hacer
			FinPara
				Escribir "3:  ", "    ", i+1, "       ", TercerLugar, "           ", Contador;
		FinPara		
			
		Escribir "------------------------------------------------------------------";
		Escribir "Promedio de puntuación: ", PromedioPuntos3; 
		Escribir "Puntuación más baja: ", PuntuacionMenor3;
		Escribir "Puntuación más alta: ", PuntuacionMayor3;
		Escribir "------------------------------------------------------------------";
			
		Escribir "Digite ENTER para continuar.";
		Esperar Tecla;
		
SiNo
	Escribir "Debe de Inicializar los puntajes y registrar los datos de las rondas (opción 1 y 2) para elegir esta opción.";
	Escribir "Digite ENTER para volver al menú.";
	Esperar Tecla;
FinSi
		
		
FinFuncion
		
		
Funcion ValidacionNumero <- EsNumero (PValor Por Valor)
		
	Definir ValidacionNumero Como Logico;
	Definir i Como Entero;
		
	i=0;
		
	ValidacionNumero=Falso;
		
	Para i=0 Hasta Longitud(PValor) Hacer
		Si Subcadena(PValor,i,1)="0" O Subcadena(PValor,i,1)="1" O Subcadena(PValor,i,1)="2" O Subcadena(PValor,i,1)="3" O Subcadena(PValor,i,1)="4" O Subcadena(PValor,i,1)="5" O Subcadena(PValor,i,1)="6" O Subcadena(PValor,i,1)="7" O Subcadena(PValor,i,1)="8" O Subcadena(PValor,i,1)="9" Entonces
			ValidacionNumero=Verdadero;
		FinSi
	FinPara
		
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
			
			Reporte_Ganadores(Matriz_Competencia, Vector_Participantes, EsPrimeraVez, RondasFinalizadas, CantRondas, CantPart, ReporteDeRonda);
			
	FinSegun
	
Hasta que OpcionMenu=6
Escribir "Saliendo del sistema.";
	
FinAlgoritmo