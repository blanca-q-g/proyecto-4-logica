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
		
		Escribir "Rondas ", CantRondas;
		Escribir "Participantes ", CantPart;
			
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

SubProceso Llenar_Matriz(Matriz_Competencia Por Referencia, EsPrimeraVez Por Referencia, RondasFinalizadas Por Referencia, CantRondas Por Referencia, CantPart Por Referencia)
	
	Definir i,j,k Como Entero;
	Definir Puntos Como Entero;
	//Definir Competencias Como Entero;
	
	//Dimension Competencias[CantRondas, CantPart];
	//Competencias=Matriz_Competencia;
	
	Escribir "2.1.Matriz: ", Matriz_Competencia[0,0];

	
	Si EsPrimeraVez=Verdadero Entonces;
		RondasFinalizadas=Falso;
		
		Escribir Matriz_Competencia[0,0];
		
		Para i=0 Hasta CantRondas-1 Hacer
			Para j=0 Hasta CantPart-1 Hacer
				Puntos=Aleatorio(0,10);
				Escribir "Puntitos, ", Puntos;
				Escribir "2. Rondas ", i;
				Escribir "3. participantes ", j;
				Matriz_Competencia[i,j]=Puntos;
			FinPara
		FinPara
				
		Escribir "";
				
				Escribir "Ejecutando la Ronda ", i+1;
				Escribir " ";
				Escribir "Resultado de esta ronda";
				Escribir "Posición ", " Competidor ", CantPart, " Puntos ", Puntos;
		
	SiNo
		Escribir "Debe de Inicializar los puntajes (opción 1) para elegir esta opción.";
		Escribir "Digite Enter para volver al menú.";
		Esperar Tecla;
	FinSi
	
	
FinSubproceso
	


// OpciónMenú3. Función consulta puntuaciones

Funcion Consulta_Puntuaciones(EsPrimeraVez Por Referencia, Puntos Por Referencia, CantRondas Por Referencia, CantPart Por Referencia, RondaConsulta Por Referencia)
	
	Definir i,j,k Como Entero;
	Definir Participantes Como Caracter;
	
	Participantes="";

	
	Si EsPrimeraVez=Verdadero Entonces;
			
		Escribir "Escribir la ronda que desea consultar";
		Leer RondaConsulta;
				
		Si RondaConsulta<>0 Entonces
			
			Para i=0 Hasta CantRondas Hacer
				Para j=0 Hasta CantPart Hacer
					
					//Repetir
						Participantes = Concatenar(Participantes,Concatenar(, convertirATexto(j+1))); 
					//Hasta que Participantes = convertirATexto(j);
						
						Escribir "P", Participantes;
						Escribir "	"			;		
					Escribir "-----------------------------------------------------------------------------------------";
					Escribir Puntos;
					Escribir "-----------------------------------------------------------------------------------------";
					Escribir "Digite ENTER para continuar";
					Esperar Tecla;
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

Funcion Matriz_Competencia <- Reporte_Competencia(EsPrimeraVez Por Referencia, RondasFinalizadas Por Referencia, Puntos Por Referencia, CantRondas Por Referencia, CantPart Por Referencia, Matriz_Competencia Por Referencia)

	Si EsPrimeraVez=Verdadero Y RondasFinalizadas=Verdadero Entonces;
		Escribir "";
		
		Escribir "Comité de deportes";
		Escribir "Módulo Control de Puntuaciones";
		Escribir "Resultados de la competencia";
		Escribir "------------------------------------------------------------------------------";
		Escribir "P", Participantes;
		//Matriz_Competencia
		
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
	Definir RondaConsulta Como Entero;
	Definir Puntos Como Entero;

		
	//Declaración matriz
	Definir Matriz_Competencia Como Entero;
	
	
	//Inicialización de variables
	
	CantPart=0;
	CantRondas=0;
	EsPrimeraVez=Falso;
	RondasFinalizadas=Falso;
	Puntos=0;
	
	
	
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
			Matriz_Competencia[0, 0]=99;
			
		2: // Llenado de la Matriz_Competencia
			
			Llenar_Matriz(Matriz_Competencia, EsPrimeraVez, RondasFinalizadas, CantRondas, CantPart);
			
		3: // Consulta de puntuaciones de una ronda
			
			Consulta_Puntuaciones(EsPrimeraVez, Puntos, CantRondas, CantPart, RondaConsulta);
			
		4: // Reporte de la competencia
			
			Matriz_Competencia <- Reporte_Competencia(EsPrimeraVez, RondasFinalizadas, Puntos, CantRondas, CantPart, Matriz_Competencia);
			
			
		5: // Reporte de ganadores
			
			Matriz_Competencia <- Reporte_Ganadores(EsPrimeraVez, RondasFinalizadas, Puntos, CantRondas, CantPart, Matriz_Competencia);
		
	FinSegun
	
Hasta que OpcionMenu=6
Escribir "Saliendo del sistema.";
	
FinAlgoritmo
