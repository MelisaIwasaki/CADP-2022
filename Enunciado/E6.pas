{
Parcial 2017 11/11

Una empresa necesita un programa para administrar la información de sus empleados. Para ello, se debe:
a)Leer y almacenar la información de los empleados. De cada empleado se lee: DNI, apellido, nombre,fecha de 
nacimiento, categoría(1:temporal; 2:permanente), sueldo básico, fecha de ingreso a la empresa.La lectura de 
información finaliza cuando se lee el DNI -1(que no debe procesarse).La información debe ser almacenada de 
manera ordenada por DNI.
b)Una vez leída y almacenada toda la información, calcular e informar:
1)Para cada empleado:DNI,apellido,nombre y sueldo a cobrar por mes.
El sueldo a cobrar por mes, para cada empleado, se calcula de la siguiente manera: 
EMPLEADO TEMPORAL-> sueldo básico.
EMPLEADO PERMANENTE->Se adiciona,  al sueldo básico, 1000 pesos por cada año de trabajo en la empresa.

2)DNI de los dos empleados con mayor sueldo a cobrar por mes.
3)Para cada empleado, cuántas veces se repite cada dígito del 0 al 9 en su DNI.        
c)Implementar un módulo que aumente, en la estructura generada en “A)”, un 20% el sueldo básico de los empleados
temporales y un 25% el sueldo básico de los empleados permanentes.
Nota: Se pide realizar la invocación del módulo.
}
