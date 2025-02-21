# JMLang

JMLang es un lenguaje de programación creado como parte de un proyecto académico en la materia **Matemáticas Discretas II** en Diciembre del 2022. Este lenguaje cuenta con una gramática propia y un compilador desarrollado utilizando **Flex** y **Yacc**.

## Características

- Declaración de variables sin tipos.
- Condicionales `if-else`.
- Ciclos `for` y `while`.
- Ejecución de operaciones aritméticas y lógicas.

## Estructura del Proyecto

- `Lexer.l`: Define los tokens del lenguaje usando Flex. Contiene reglas para identificar palabras clave, identificadores, operadores aritméticos y lógicos, así como delimitadores.

  ### Especificación Léxica

  - **Palabras clave:**
    - `danif ... entonces ... manuelse ...` como equivalente a `if-else`.
    - `mientrasjoan ... hacejoan ...` como equivalente a `while`.
    - `camilor ... hacejoan ...` como equivalente a `for`.
  - **Identificadores:** Se definen con la palabra reservada `isaficador`, seguidos de un nombre alfanumérico.
  - **Tipos de datos:**
    - **Enteros:** Se declaran con la palabra clave `isant`, seguida del nombre de la variable.
    - **Booleanos:** `true`, `false`.
  - **Operadores:**
    - Aritméticos: `+`, `-`, `*`, `/`.
    - Relacionales: `==`, `!=`, `<`, `>`, `<=`, `>=`.
    - Lógicos: `&&`, `||`, `!`.
  - **Delimitadores:** `;`, `{`, `}`.
  - **Números:** Se reconocen enteros y decimales.

- `Parser.y`: Contiene la gramática del lenguaje en Yacc. La estructura del parser se diseñó con limitaciones en los bucles `while` para evitar desbordamientos. Se implementó un análisis de expresiones con manejo de precedencia para operaciones aritméticas y lógicas. Además, se usó C para la gestión de variables, asegurando una ejecución eficiente en memoria.

- `Ejemplos.txt`: Contiene ejemplos de código en JMLang.

## Instalación y Uso

### Requisitos

- **Linux o Windows**
- En Linux: **Flex** y **Bison (Lex y Yacc)** instalados.
- En Windows: **[Flex y Bison (Lex y Yacc) para Windows](https://web.archive.org/web/20240224194534/https://techapple.net/2014/07/flex-windows-lex-and-yacc-flex-and-bison-installer-for-windows-xp788-1/)** instalados.

### Instalación y Compilación

#### En Linux:

1. Abre una terminal en la carpeta del proyecto.
2. Ejecuta el siguiente comando para generar el analizador léxico y sintáctico:
   ```sh
   flex Lexer.l && yacc -dy Parser.y
   ```
3. Compila el código fuente con:
   ```sh
   gcc lex.yy.c y.tab.c -o Programa -std=c99
   ```
4. Ejecuta el programa con un archivo de entrada:
   ```sh
   ./Programa < Ejemplos.txt
   ```

#### En Windows (PowerShell):

1. Abre PowerShell en la carpeta del proyecto.
2. Ejecuta el siguiente comando para generar el analizador léxico y sintáctico:
   ```powershell
   flex Lexer.l; yacc -dy Parser.y
   ```
3. Compila el código fuente con:
   ```powershell
   gcc lex.yy.c y.tab.c -o Programa.exe -std=c99
   ```
4. Ejecuta el programa con un archivo de entrada:
   ```powershell
   Get-Content Ejemplos.txt | .\Programa.exe
   ```

## Ejemplos de Código

```txt
x=3;
y=7;
z=x+y;
x>5;
x<5;
n=true;
k=false;
danif x==3 entonces 5*5;
danif x==1 entonces 5*5 manuelse 2*8;
camilor 0:5 hacejoan a=7-3;
mientrasjoan true hacejoan 10/2;
```

## Resultado Esperado

```txt
La variable x es igual a 3
La variable y es igual a 7
La variable z es igual a 10
Resultado de la expresion: 0
Resultado de la expresion: 1
La variable n es igual a 1
La variable k es igual a 0
Resultado del IF: 25
Resultado del ELSE: 16
Resultado del ciclo FOR: 4
Resultado del ciclo FOR: 4
Resultado del ciclo FOR: 4
Resultado del ciclo FOR: 4
Resultado del ciclo FOR: 4
Resultado del ciclo FOR: 4
Resultado del ciclo WHILE: 5
Resultado del ciclo WHILE: 5
Resultado del ciclo WHILE: 5
Resultado del ciclo WHILE: 5
Resultado del ciclo WHILE: 5
Resultado del ciclo WHILE: 5
Resultado del ciclo WHILE: 5
Resultado del ciclo WHILE: 5
Ciclo WHILE parado para no agotar la memoria
```

## Autores

- Joan Manuel Jaramillo Avila

## Licencia

Este proyecto es de código abierto y se distribuye bajo la licencia MIT.

