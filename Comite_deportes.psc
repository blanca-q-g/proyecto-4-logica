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


// Funci�n para presentar el men� de opciones




// Inicio del algoritmo

Algoritmo Comite_deportes
	
	//Declaraci�n de variables

	Definir CantPart Como Entero;
	Definir CantRondas Como Entero;
	
	//Declaraci�n matriz
	Definir Matriz_Datos_Rondas Como Entero;
	
	//Inizializaci�n de variables
	
	CantPart=0;
	CantRondas=0;
	
	
	
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
		
	Hasta que OpcionMenu=6
	
FinAlgoritmo
