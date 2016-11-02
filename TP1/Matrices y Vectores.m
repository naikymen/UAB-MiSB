#Definir una matriz, las columnas separadas por punto y coma
M1 = [1:4;5:8;9:12]

#Definir vectores, usar la comilla para hacer un vector columna (es decir, la transpuesta de una fila)
V1 = [20 30 40 50]'
V2 = M1*V1
V3 = V1*25
V1.*V3

#Conocer las dimensiones de la matriz M1
sz = size(M1)
#Guardar los datos en un vector de variables
[fil col]=size(M1) #Obs: las variables se pueden consultar de a una


#Longitud de un vector
L1 = length(V1)

V5 = [0:2:100]
V5 = linspace(25,130,500)

#Otra forma de escribir una matriz
M2 = [1 2 3 4
5 6 7 8
9 10 11 12]

#Sacar un cacho de la matriz
M3 = M2(2:3,3:4)