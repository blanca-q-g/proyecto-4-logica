// Funci�n para validar las rondas de la competencia y participantes

SubProceso Validacion_Rondas_Participantes(CantPart Por Referencia, CantRondas Por Referencia)
	Si CantRondas>1 y CantRondas<Redon(CantPart/2) Entonces
		Escribir " ";	
		Escribir "Comit� de deportes";
		Escribir "M�dulo Control de puntuaciones";
		
	SiNo
		Escribir "Favor digitar un n�mero mayor a 1 y menor a la mitad de los participantes";
		Leer CantRondas;
	FinSi
FinSubProceso


// Funci�n para inicializar la Matriz_Competencia

Funcion Matriz_Competencia <- Inicio_Matriz(EsPrimeraVez Por Referencia, CantRondas Por Referencia, CantPart Por Referencia)
	//Matriz_Competencia[CantRondas, CantPart];
		
	Definir Matriz_Competencia Como Entero;
	Definir i,j,k Como Entero;
	
	Si EsPrimeraVez=Falso entonces
		EsPrimeraVez=Verdadero;
		
		Escribir "Rondas ", CantRondas;
		Escribir "Participantes ", CantPart;
		
		Dimension Matriz_Competencia[CantRondas, CantPart];
		Matriz_Competencia[0, 0]=99;
		
		Escribir "Inicializando Matriz de competencias...";
		Escribir "Digite ENTER para continuar";
		Esperar Tecla;
		
	SiNo
		Escribir "Esta opci�n no se puede volver a elegir una vez seleccionada";
		Escribir "Digite ENTER para continuar";
		Esperar Tecla;
		
	FinSi
	
FinFuncion


//Funci�n para almacenar puntuaciones en matriz

SubProceso Llenar_Matriz(Puntos Por Referencia, CantRondas Por Referencia, CantPart Por Referencia)
	Dimension Puntuaciones[Puntos];
	Dimension Matriz_Competencia[CantRondas, CantPart];
	Matriz_Competencia[CantRondas, CantPart]=0;
	
	Para i=0 Hasta CantRondas-1 Hacer
		Para j=0 Hasta CantPart-1 Hacer
			Para k=0 Hasta Puntos Hacer
			FinPara
			Puntuaciones[k]=Aleatorio(0,10);
				
			Escribir "Ejecutando la Ronda ", i+1;
			Escribir " ";
			Escribir "Resultado de esta ronda";
			Escribir "Posici�n ", " Competidor ", CantPart, " Puntos ", Puntos;
				
		FinPara
	FinPara
FinSubProceso


// Funci�n consulta puntuaciones

SubProceso Consulta_Puntuaciones(Puntos Por Referencia, CantRondas Por Referencia, CantPart Por Referencia)
	Dimension Puntuaciones[Puntos];
	Dimension Matriz_Competencia[CantRondas, CantPart];
	Matriz_Competencia[CantRondas, CantPart]=0;
	
	Para i=0 Hasta CantRondas-1 Hacer
		Para j=0 Hasta CantPart-1 Hacer
			Para k=0 Hasta Puntos Hacer
			FinPara
			
			Escribir "P", CantPart;
			Escribir "-----------------------------------------------------------------------------------------";
			Escribir Puntuaciones[Puntos];
			Escribir "-----------------------------------------------------------------------------------------";
		FinPara
	FinPara


	
	Escribir "Digite ENTER para continuar";
	Esperar Tecla;
	
FinSubProceso	
	
// Inicio del algoritmo

Algoritmo Comite_deportes
	
	//Declaraci�n de variables
	
	Definir CantPart Como Entero;
	Definir CantRondas Como Entero;
	Definir OpcionMenu Como Entero;
	Definir EsPrimeraVez Como Logico;
	
	Definir PrimeraVezEjecutada Como Logico;
	
	//Declaraci�n matriz
	Definir Matriz_Competencia Como Entero;
	
	//Declaraci�n vector almacenador de puntuaciones
	Definir Puntuaciones Como Entero;
	Definir Puntos Como Entero;
	
	//Inicializaci�n de variables
	
	CantPart=0;
	CantRondas=0;
	EsPrimeraVez=Falso;
	PrimeraVezEjecutada=Falso;
	Puntos=0;
	
	
	
	Escribir "Comit� de deportes";
	Escribir "M�dulo Control de puntuaciones";
	Escribir "Inicializaci�n de par�metros";
	
	Escribir "--------------------------------------";
	
	Escribir "Digitar cantidad de participantes";
	Leer CantPart;
	
	Escribir "Digitar cantidad de rondas";
	Leer CantRondas;
	Validacion_Rondas_Participantes(CantPart, CantRondas);
	
	
	// Men� m�dulo de control de puntuaciones
	
	Repetir
		
		Escribir "";
		Escribir "Comit� de deportes";
		Escribir "M�dulo Control de puntuaciones";
		Escribir "---------------------------------------------";
		Escribir "1. Inicializaci�n de puntajes";
		Escribir "2. Registro de datos de cada ronda";
		Escribir "3. Consulta de puntuaciones de una ronda";
		Escribir "4. Reporte de toda la competencia";
		Escribir "5. Reporte de ganadores de la fecha";
		Escribir "6. Salir del men�";
		Leer OpcionMenu;
		
		Si OpcionMenu<>1 Y OpcionMenu<>2 Y OpcionMenu<>3 Y OpcionMenu<>4 Y OpcionMenu<>5 Y OpcionMenu<>6 Entonces
			Escribir "Error. Debe de digitar una de las opciones del men�.";
			Escribir "Presione cualquier tecla para continuar.";
			Esperar Tecla;
	FinSi
		
	
	Segun OpcionMenu Hacer
		
		1: //Inicializaci�n de la Matriz_Competencia
			
			Matriz_Competencia <- Inicio_Matriz(EsPrimeraVez, CantRondas, CantPart);
			
		2: // Llenado de la Matriz_Competencia
			
			Si EsPrimeraVez=Verdadero Entonces;
				PrimeraVezEjecutada=Verdadero;
				
				Dimension Puntuaciones[Puntos];
				Dimension Matriz_Competencia[CantRondas, CantPart];
				Matriz_Competencia[CantRondas, CantPart]=0;
				
				Escribir "";
				Llenar_Matriz(Puntos, CantRondas, CantPart);
				
			SiNo
				Escribir "Debe de Inicializar los puntajes (opci�n 1) para elegir esta opci�n.";
				Escribir "Digite Enter para volver al men�.";
				Esperar Tecla;
			FinSi
			
		3: // Consulta de puntuaciones de una ronda
			
			Si EsPrimeraVez=Verdadero Entonces;
				
				Escribir "Escribir la ronda que desea consultar";
				
				
			SiNo
				Escribir "Debe de Inicializar los puntajes (opci�n 1) para elegir esta opci�n.";
				Escribir "Digite Enter para volver al men�.";
				Esperar Tecla;
			FinSi
			
		4: // Reporte de la competencia
			Si EsPrimeraVez=Verdadero Y PrimeraVezEjecutada=Verdadero Entonces;
				Escribir "";
			SiNo
				Escribir "Debe de Inicializar los puntajes y registrar los datos de las rondas (opci�n 1 y 2) para elegir esta opci�n.";
				Escribir "Digite Enter para volver al men�.";
				Esperar Tecla;
			FinSi
			
		5: // Reporte de ganadores
			Si EsPrimeraVez=Verdadero Y PrimeraVezEjecutada=Verdadero Entonces;
				Escribir "";
			SiNo
				Escribir "Debe de Inicializar los puntajes y registrar los datos de las rondas (opci�n 1 y 2) para elegir esta opci�n.";
				Escribir "Digite Enter para volver al men�.";
				Esperar Tecla;
			FinSi
		
	FinSegun
	
Hasta que OpcionMenu=6
Escribir "Saliendo del sistema.";
	
FinAlgoritmo
