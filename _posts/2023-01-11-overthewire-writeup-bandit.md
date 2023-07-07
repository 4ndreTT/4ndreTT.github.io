---
layout: single
title: Bandit - Over The Wire 
excerpt: "Bandit es uno de los wargames disponibles en OverTheWire, el cual busca ayudar en la mejora de las habilidades de línea de comandos o terminal y la comprensión de la seguridad informática básica en Linux. El jugador debe resolver una serie de desafíos con la finalidad de obtener una 'flag' a través de la utilización de comandos y técnicas de seguridad. Los niveles van de dificultad creciente y se enfocan en diferentes áreas de seguridad, como privacidad, encriptación y autenticación. Bandit cuenta con 34 niveles." 
date: 2023-01-11
classes: wide
header:
  teaser: /assets/images/overthewire-writeup-bandit/logo_bandit.png
  teaser_home_page: true
  icon: /assets/images/overthewire.png
categories:
  - overthewire 
  - infosec
tags:  
  - linux 
  - bash 
  - terminal 
---

![](/assets/images/overthewire-writeup-bandit/logo_bandit.png)

Bandit es uno de los wargames disponibles en OverTheWire, el cual busca ayudar en la mejora de las habilidades de línea de comandos o terminal y la comprensión de la seguridad informática básica en Linux. El jugador debe resolver una serie de desafíos con la finalidad de obtener una "flag" a través de la utilización de comandos y técnicas de seguridad. Los niveles van de dificultad creciente y se enfocan en diferentes áreas de seguridad, como privacidad, encriptación y autenticación. Bandit cuenta con 34 niveles.

Puedes intentar resolver el wargame en el siguiente enlace: <a href="https://overthewire.org/wargames/bandit/" target="_blank">Bandit</a>

Para iniciar tendremos que conectarnos mediante <a href="https://www.hostinger.co/tutoriales/que-es-ssh" target="_blank">SSH</a> al servidor del juego "Bandit" en bandit.labs.overthewire.org a través del puerto 2220. 

Es indiferente en qué sistema operativo host nos encontremos, ya sea Windows, Linux, Mac o una MV, ya que lo único que necesitaremos para conectarnos al servidor de bandit es un cliente de SSH y por defecto los sistemas mencionados anteriormente ya cuentan con uno previamente instalado.

Simplemente nos conectamos con el siguiente comando 

```
ssh user@bandit.labs.overthewire.org -p 2220
```

Tendremos que sustituir el 'user' con cada usuario que bandit nos proporcione. La bandera -p de ssh, indica el puerto por el cual pretendemos conectarnos.
Las credenciales variarán a medida que avancemos de nivel.

Para poder salir de ssh escribiremos en la terminal el comando `exit`

## Menú de niveles <span id="#menu">

<a href="#bandit0">Bandit0</a> -> <a href="#bandit1">Bandit1</a> -> <a href="#bandit2">Bandit2</a> -> <a href="#bandit3">Bandit3</a> -> <a href="#bandit4">Bandit4</a> -> <a href="#bandit5">Bandit5</a> 

## Bandit0 <span id="bandit0">

Para este primer nivel, tenemos que conectarnos con las siguientes credenciales.
<br>User: bandit0
<br>Password: bandit0

Una vez proporcionadas las credenciales, estaremos conectados al servidor de Bandit.

### Flag

La contraseña para acceder al nivel 1 se almacena en un archivo llamado "readme" ubicado en el directorio home del usuario bandit0.

### Solución

Utilizaremos el comando "ls" para listar el contenido del directorio actual. Si queremos obtener más información, podemos usar las opciones <br>
`ls -l` Se mostrara un listado largo de los detalles de los archivos y directorios<br>
`ls -a` Se mostraran los archivos y directorios ocultos<br>

```
bandit0@bandit:~$ ls -l
total 4
-rw-r----- 1 bandit1 bandit0 33 Jan 11 19:18 readme
```

Vemos que existe un archivo llamado "readme" y el usuario bandit0 tiene permiso de lectura<br>
Con el comando `cat` podemos ver el contenido de un archivo.

```
bandit0@bandit:~$ cat readme 
NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL
```

Así obtendremos la constraseña del siguiente nivel :) 

<a href="#menu">Menú de niveles</a>

## Bandit1 <span id="bandit1">

Para este nivel, nos conectaremos con el usuario bandit1 y la constraseña obtenida en el nivel anterior.
<br>User: bandit1
<br>Password: NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL 

### Flag

La contraseña para el siguiente nivel se encuentra almacenada en un archivo llamado - ubicado en el directorio home del usuario bandit1.

### Solución

Listamos el contenido del directorio actual con el comando `ls`

```
bandit1@bandit:~$ ls
-
```

Ya que comprobamos que el archivo `-` esta precente intentamos mostrar su contenido con el comando `cat`

```
bandit1@bandit:~$ cat -


```
Sin embargo, en esta ocasión vemos que el comando queda en una especie de carga y no se nos muestra el contenido. Esto se debe a que el nombre del archivo está escrito con un caracter especial. Para solucionar esto, digitamos el comando `cat ./-` mediante este estaremos diciendo que queremos mostrar el archivo llamado `-`, el cual se encuentra en el directorio actual `./`

```
bandit1@bandit:~$ cat ./-
rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi
```

Así obtendremos la constraseña del siguiente nivel :) 

<a href="#menu">Menú de niveles</a>

## Bandit2 <span id="bandit2">

Para este nivel, nos conectaremos con el usuario bandit2 y la constraseña obtenida en el nivel anterior.
<br>User: bandit2
<br>Password: rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi

## Flag 

La contraseña para el siguiente nivel se almacena en un archivo llamado "space in this filename" ubicado en el directorio de home del usuario bandit2.

## Solución

Listamos el contenido del directorio actual con el comando `ls`

```
bandit2@bandit:~$ ls
spaces in this filename
```
Para comprobar que es un mismo archivo y no un archivo llamado "space" otro "in", etc. 
Utilizamos el comando `ls -l` 

```
bandit2@bandit:~$ ls -l
total 4
-rw-r----- 1 bandit3 bandit2 33 Jan 11 19:18 spaces in this filename
```

Vemos que se trata de un mismo archivo. Sin embargo si ejecutamos el comando `cat space in this filename` este nos genera un error. Debido a que toma cada palabra como un archivo diferente. 

```
bandit2@bandit:~$ cat space in this filename
cat: space: No such file or directory
cat: in: No such file or directory
cat: this: No such file or directory
cat: filename: No such file or directory
```
Existen varias soluciones para mostrar el contenido de un archivo cuyo nombre contine espacios. 

* Utilizar comillas alrededor del nombre del archivo `cat "space in this file"`
* Utilizar la barra invertida para escapar los espacios `cat space\ in\ this\ file`
* Utilizar la tabulación automatica para completa el nombre del archivo `Tecla TAB`

```
bandit2@bandit:~$ cat spaces\ in\ this\ filename 
aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG
```

Así obtendremos la contraseña del siguiente nivel :) 

<a href="#menu">Menú de niveles</a>

## Bandit3 <span id="bandit3">

Para este nivel, nos conectaremos con el usuario bandit3 y la constraseña obtenida en el nivel anterior.
<br>User: bandit3
<br>Password: aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG

## Flag 

La contraseña para el siguiente nivel se encuentra almacenada en un archivo oculto en el directorio inhere.

##  Solución 

Ejecutando el comando `ls -l`

```
bandit3@bandit:~$ ls -l 
total 4
drwxr-xr-x 2 root root 4096 Jan 11 19:19 inhere
```
Vemos que hay un directorio llamado "inhere", para poder ingresar a este utilizamos el comando `cd` y el nombre del directorio 

```
bandit3@bandit:~$ cd inhere/
```
```
bandit3@bandit:~/inhere$
```

Para poder listar los archivos ocultos utilizamos el comando `ls -a`

```
bandit3@bandit:~/inhere$ ls -a
.  ..  .hidden
```

Ahora solo nos queda mostrar el contenido del archivo con el comando `cat`, no debemos olvidar colocar el `.` que precedel el nombre del archivo, ya que este es el que nos indica que es un archivo oculto. 

``` 
bandit3@bandit:~/inhere$ cat .hidden 
2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe
```

Así obtendremos la contraseña del siguiente nivel :) 

<a href="#menu">Menú de niveles</a>

## Bandit4 <span id="bandit4">

Para este nivel, nos conectaremos con el usuario bandit4 y la constraseña obtenida en el nivel anterior.
<br>User: bandit4
<br>Password: 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe

## Flag 

La contraseña para el siguiente nivel se almacena en el único archivo legible por humanos en el directorio inhere. Consejo: si su terminal está desordenada, intente con el comando "reset".

## Solución 

Con el comando `ls` observamos el directorio **inhere** se encuentra en la misma posición que el nivel anterior, por lo que procedemos a ingresar a él con el comando `cd` y listar su contenido

```
bandit4@bandit:~$ ls
inhere
bandit4@bandit:~$ cd inhere/
bandit4@bandit:~/inhere$ 
bandit4@bandit:~/inhere$ ls
-file00  -file01  -file02  -file03  -file04  -file05  -file06  -file07  -file08  -file09
```

Como nos dice el enunciado, la contraseña está en el único archivo legible por humanos.

Para poder encontrar dicho archivo utilizaremos el siguiente comando 
`ls | file ./*`

* `|` Este simbolo sirve para conectar el resultado de un comando a la entrada del otro
* `file` Este comando se utiliza para determinar el tipo de un archivo específico
* `./*` Este comando significa todos los elementos del directorio actual

```
bandit4@bandit:~/inhere$ ls | file ./*
./-file00: data
./-file01: data
./-file02: data
./-file03: data
./-file04: data
./-file05: data
./-file06: data
./-file07: ASCII text
./-file08: data
./-file09: data
```

El output del comando nos muestra que en este caso hay dos tipos de archivos 
* Tipo `data` este tipo de archivo en Linux se refiere a un archivo que no se reconoce como perteneciente a ningún tipo de archivo específico, y por lo tanto no se puede abrir con un programa específico 
* Tipo `ASCII text` es un tipo de archivo en Linux que contiene solo caracteres <a href="https://elcodigoascii.com.ar/" target="_blank">ASCII</a>.

Por lo tanto el archivo `./-file07` es el que nos interesa, así que mostramos su contenido 

```
bandit4@bandit:~/inhere$ cat ./-file07
lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR
```

Así obtendremos la constraseña del siguiente nivel :) 

<a href="#menu">Menú de niveles</a>

## Bandit5 <span id="bandit5">

Para este nivel, nos conectaremos con el usuario bandit5 y la constraseña obtenida en el nivel anterior.
<br>User: bandit5
<br>Password:  lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR

## Flag 

La contraseña para el siguiente nivel se almacena en un archivo en algún lugar del directorio **inhere** y tiene todas las siguientes propiedades:

human-readable -> Legible por humanos
1033 bytes in size -> 1033 bytes de tamaño
not executable -> No es ejecutable

## Solución 

Si hacemos la misma inspección que en los niveles anteriores veremos que hay un gran número de directorios y archivos, por lo tanto no sería óptimo revisar las propiedades uno por uno.

```
bandit5@bandit:~$ ls
inhere
bandit5@bandit:~$ cd inhere/
bandit5@bandit:~/inhere$ ls
maybehere00  maybehere03  maybehere06  maybehere09  maybehere12  maybehere15  maybehere18
maybehere01  maybehere04  maybehere07  maybehere10  maybehere13  maybehere16  maybehere19
maybehere02  maybehere05  maybehere08  maybehere11  maybehere14  maybehere17
```

Para solucionar este problema haremos uso del siguiente comando. 

`find ./inhere/ -type f -size 1033c ! -executable`

* `find` es un comando en Linux que se utiliza para buscar archivos y directorios en un sistema de archivos. Acepta varios parámetros para especificar dónde buscar, qué buscar y qué hacer con los archivos encontrados.  
* `./inhere/` hace referencial la ruta de donde buscar.
* `-type f` este parametro especifica que los archivos a buscar deben ser archivos rfegulares, no directorios ni enlaces simbólicos. 
* `-size 1033c` este parametro es utilizado para dar un tamaño de archivo especifico el `c` hace referencia a que el tamñano sea en bytes
* `! -executable` este parametro se utiliza para buscar archivos que no tengan permiso de ejecución.

```
bandit5@bandit:~$ find ./inhere/ -type f -size 1033c ! -executable
./inhere/maybehere07/.file2
```
Simplemente nos queda mostrar el contenido del archivo encontrado, tomando en cuenta su ruta absoluta

```
bandit5@bandit:~$ cat ./inhere/maybehere07/.file2
P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU
```
Así obtendremos la contraseña del siguiente nivel :)

<a href="#menu">Menú de niveles</a>

## Bandit6 <span id="bandit6">

Para este nivel, nos conectaremos con el usuario bandit6 y la constraseña obtenida en el nivel anterior.
<br>User: bandit6
<br>Password: P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU

## Flag 

La contraseña para el siguiente nivel se almacena en algún lugar del servidor y tiene todas las siguientes propiedades:


  owned by user bandit7
  owned by group bandit6
  33 bytes in size


## Solución 

Al listar la carpeta de nuestru usuario, observamos que no se encuentra ningún archivo importante.

```
bandit6@bandit:~$ ls -la
total 20
drwxr-xr-x  2 root root 4096 Apr 23 18:04 .
drwxr-xr-x 70 root root 4096 Apr 23 18:05 ..
-rw-r--r--  1 root root  220 Jan  6  2022 .bash_logout
-rw-r--r--  1 root root 3771 Jan  6  2022 .bashrc
-rw-r--r--  1 root root  807 Jan  6  2022 .profile
```

Por lo tanto, procedemos a realizar la busqueda pero desde la carpeta raíz, teniendo en cuenta las características especificadas en el ejercicio.

`find / -user bandit7 -group bandit6 -size 33c 2>/dev/null`

* `find` es un comando en Linux que se utiliza para buscar archivos y directorios en un sistema de archivos. Acepta varios parámetros para especificar dónde buscar, qué buscar y qué hacer con los archivos encontrados.  
* `/` hace referencial la ruta de donde buscar.
* `-user` busca archivos propiedad de un usuario especifico.
* `-group` busca archivos propiedad de un grupo especifico.
* `-size 33c` este parametro es utilizado para dar un tamaño de archivo especifico el `c` hace referencia a que el tamñano sea en bytes
* `2>/dev/null`  es una redirección que redirige la salida de error (stderr) hacia el dispositivo `/dev/null` y esta ruta es conciderada como un "agujero negro" debido a que todo lo que se pone ahí se descarta y desaparece

```
bandit6@bandit:~$ find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
/var/lib/dpkg/info/bandit7.password
```
Simplemente nos queda mostrar el contenido del archivo encontrado, tomando en cuenta su ruta absoluta

```
bandit6@bandit:~$ cat /var/lib/dpkg/info/bandit7.password 
z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S
```
Así obtendremos la contraseña del siguiente nivel :)

<a href="#menu">Menú de niveles</a>
