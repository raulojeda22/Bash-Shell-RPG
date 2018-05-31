#!/bin/bash
#############################FUNCTIONS###############################
MAPA () {
	contadorY=0
	while [ $tamanyMapaY -gt $contadorY ]
	do
		contadorX=0
		while [ $tamanyMapaX -gt $contadorX ]
		do
			objecteAleatori=$(($RANDOM%32000))
			if  [ $objecteAleatori -lt 30000 ] #nada
			then 
				objecteGenerat=$nada
			elif [ $objecteAleatori -lt 31500 ] #rocas
			then 
				objecteGenerat=$roca
			elif [ $objecteAleatori -lt 31600 ] #flores
			then 
				if [ $objecteAleatori -lt 31650 ]
				then
					objecteGenerat=$flor
				elif [ $objecteAleatori -lt 31700 ]
				then
					objecteGenerat=$flor2
				fi
			elif [ $objecteAleatori -lt 31700 ] #trampas
			then 
				if [ $objecteAleatori -lt 31650 ]
				then
					objecteGenerat=$trampa
				elif [ $objecteAleatori -lt 31700 ]
				then
					objecteGenerat=$muerte
				fi
			elif [ $objecteAleatori -lt 31800 ] #amics
			then
				if [ $objecteAleatori -lt 31750 ]
				then
					objecteGenerat=$aldeano
				elif [ $objecteAleatori -lt 31800 ]
				then
					objecteGenerat=$oveja
				fi
			elif [ $objecteAleatori -lt 31950 ] #enemics
			then 
				if [ $objecteAleatori -lt 31875 ]
				then
					objecteGenerat=$monstruo
				elif [ $objecteAleatori -lt 31950 ]
				then
					objecteGenerat=$serpiente
				fi
			elif [ $objecteAleatori -lt 31990 ]     #armes
			then 
				if [ $objecteAleatori -lt 31955 ]
				then
					objecteGenerat=$escopeta
				elif [ $objecteAleatori -lt 31975 ]
				then
					objecteGenerat=$espadas
				elif [ $objecteAleatori -lt 31990 ]
				then
					objecteGenerat=$espadaCurvada
				fi
			elif [ $objecteAleatori -lt 32000 ] #finals
			then 
				if [ $objecteAleatori -lt 31993 ]
				then
					objecteGenerat=$corona
				elif [ $objecteAleatori -lt 31996 ]
				then
					objecteGenerat=$hijo
				elif [ $objecteAleatori -lt 32000 ]
				then
					objecteGenerat=$hija
				fi
			fi
			
			
			eval mapa$contadorY[$contadorX]=$objecteGenerat
			let contadorX=$contadorX+1
		done
		let contadorY=$contadorY+1
	done
}
MOSTRAR_MAPA () {

	contadorY=0	
	clear
	while [ $tamanyMapaY -gt $contadorY ]
	do
		eval mapaY='$'{mapa$contadorY[*]}
		echo "$mapaY"
		let contadorY=$contadorY+1
	done   

}
INTELIGENCIA_ARTIFICIAL () {
	contadorY=0
	while [ $contadorY -lt $tamanyMapaY ]
	do 
		contadorX=0
		eval mapaConAnimales='$'{mapa$contadorY[*]}
		for animal in $mapaConAnimales
		do
			if [ "$animal" = "$oveja" ]
			then
				movimientoAleatorio=$(($RANDOM%4))
				if [ $movimientoAleatorio -eq 0 ]
				then
						if [ $contadorX -le 0 ]
						then
							echo -n ##inutil
						else
							eval mapa$contadorY[$contadorX]="·"
							let movimientoIzquierdaX=$contadorX-1
							let movimientoIzquierdaY=$contadorY
							eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$oveja"
						fi
				elif [ $movimientoAleatorio -eq 1 ]
				then
						if [ $contadorX -ge $tamanyMapaXB ]
						then
							echo -n ##inutil
						else
							eval mapa$contadorY[$contadorX]="·"
							let movimientoIzquierdaX=$contadorX+1
							let movimientoIzquierdaY=$contadorY
							eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$oveja"
						fi
				elif [ $movimientoAleatorio -eq 2 ]
				then
						if [ $contadorY -le 0 ]
						then
							echo -n ##inutil
						else
						eval mapa$contadorY[$contadorX]="·"
						let movimientoIzquierdaX=$contadorX
						let movimientoIzquierdaY=$contadorY-1
						eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$oveja"
						fi
				elif [ $movimientoAleatorio -eq 3 ]
				then
						if [ $contadorY -ge $tamanyMapaYB ]
						then
							echo -n ##inutil
						else
							eval mapa$contadorY[$contadorX]="·"
							let movimientoIzquierdaX=$contadorX
							let movimientoIzquierdaY=$contadorY+1
							eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$oveja"
						fi					
				fi				
			elif [ "$animal" = "$aldeano" ]
			then
				movimientoAleatorio=$(($RANDOM%4))
				if [ $movimientoAleatorio -eq 0 ]
				then
						if [ $contadorX -le 0 ]
						then
							echo -n ##inutil
						else
							eval mapa$contadorY[$contadorX]="·"
							let movimientoIzquierdaX=$contadorX-1
							let movimientoIzquierdaY=$contadorY
							eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$aldeano"
						fi
				elif [ $movimientoAleatorio -eq 1 ]
				then
						if [ $contadorX -ge $tamanyMapaXB ]
						then
							echo -n ##inutil
						else
							eval mapa$contadorY[$contadorX]="·"
							let movimientoIzquierdaX=$contadorX+1
							let movimientoIzquierdaY=$contadorY
							eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$aldeano"
						fi
				elif [ $movimientoAleatorio -eq 2 ]
				then
						if [ $contadorY -le 0 ]
						then
							echo -n ##inutil
						else
						eval mapa$contadorY[$contadorX]="·"
						let movimientoIzquierdaX=$contadorX
						let movimientoIzquierdaY=$contadorY-1
						eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$aldeano"
						fi
				elif [ $movimientoAleatorio -eq 3 ]
				then
						if [ $contadorY -ge $tamanyMapaYB ]
						then
							echo -n ##inutil
						else
							eval mapa$contadorY[$contadorX]="·"
							let movimientoIzquierdaX=$contadorX
							let movimientoIzquierdaY=$contadorY+1
							eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$aldeano"
						fi					
				fi				
			
			elif [ "$animal" = "$serpiente" ]
			then
				
				if [ $contadorX -gt $x ]
				then
						eval mapa$contadorY[$contadorX]="·"
						let movimientoIzquierdaX=$contadorX-1
						let movimientoIzquierdaY=$contadorY
						eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$serpiente"
				elif [ $contadorX -lt $x ]
				then
						eval mapa$contadorY[$contadorX]="·"
						let movimientoIzquierdaX=$contadorX+1
						let movimientoIzquierdaY=$contadorY
						eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$serpiente"
				elif [ $contadorY -gt $y ]
				then
						eval mapa$contadorY[$contadorX]="·"
						let movimientoIzquierdaX=$contadorX
						let movimientoIzquierdaY=$contadorY-1
						eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$serpiente"
				elif [ $contadorY -lt $y ]
				then
						if [ $contadorX -eq $posicionGuardadaDeMonstruo ]
						then
							posicionGuardadaDeMonstruo=99999999999
						else
							eval mapa$contadorY[$contadorX]="·"
							let movimientoIzquierdaX=$contadorX
							let movimientoIzquierdaY=$contadorY+1
							eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$serpiente"
							posicionGuardadaDeMonstruo=$contadorX	
						fi						
				fi				
			elif [ "$animal" = "$monstruo" ]
			then
				if [ $contadorY -gt $y ]
				then
						eval mapa$contadorY[$contadorX]="·"
						let movimientoIzquierdaX=$contadorX
						let movimientoIzquierdaY=$contadorY-1
						eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$monstruo"
				elif [ $contadorY -lt $y ]
				then
						if [ $contadorX -eq $posicionGuardadaDeMonstruo ]
						then
							posicionGuardadaDeMonstruo=99999999999
						else
							eval mapa$contadorY[$contadorX]="·"
							let movimientoIzquierdaX=$contadorX
							let movimientoIzquierdaY=$contadorY+1
							eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$monstruo"
							posicionGuardadaDeMonstruo=$contadorX	
						fi		
				elif [ $contadorX -gt $x ]
				then
						eval mapa$contadorY[$contadorX]="·"
						let movimientoIzquierdaX=$contadorX-1
						let movimientoIzquierdaY=$contadorY
						eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$monstruo"
				elif [ $contadorX -lt $x ]
				then
						eval mapa$contadorY[$contadorX]="·"
						let movimientoIzquierdaX=$contadorX+1
						let movimientoIzquierdaY=$contadorY
						eval mapa$movimientoIzquierdaY[$movimientoIzquierdaX]="$monstruo"
				fi

			fi
			let contadorX=$contadorX+1
		done 
		let contadorY=$contadorY+1
	done
}
INVENTARIO () {
echo "|---|---|---|---|---|---|---|---|---|---|""|-----|""|-----|"
echo "| ${arrayInventaria[0]} | ${arrayInventaria[1]} | ${arrayInventaria[2]} | ${arrayInventaria[3]} | ${arrayInventaria[4]} | ${arrayInventaria[5]} | ${arrayInventaria[6]} | ${arrayInventaria[7]} | ${arrayInventaria[8]} | ${arrayInventaria[9]} |""|  $objeto  |""|  $objetoEquipado  |""POINTS: $points"
echo "|---|---|---|---|---|---|---|---|---|---|""|-----|""|-----|"

}

GUARDAR_OBJETOX () {
	eval objeto='$'{mapa$y[$posicionNueva]}
	#eval mapa$y[$x]="$objeto"
	eval mapa$y[$x]="$objetoAnterior"
	objetoAnterior=$objeto
					if [ "$objeto" = "$trampa" ]
					then
						PANTALLA_GAME_OVER
					elif [ "$objeto" = "$muerte" ]
					then
						PANTALLA_GAME_OVER
					fi
	
	
}

GUARDAR_OBJETOY () {
	eval objeto='$'{mapa$posicionNueva[$x]}
	#eval mapa$y[$x]="$objeto"
	eval mapa$y[$x]="$objetoAnterior"
	objetoAnterior=$objeto
					if [ "$objeto" = "$trampa" ]
					then
						PANTALLA_GAME_OVER
					elif [ "$objeto" = "$muerte" ]
					then
						PANTALLA_GAME_OVER
					fi
	
}

GUARDAR_OBJETOXY () {
	eval objeto='$'{mapa$posicionNuevaY[$posicionNuevaX]}
	#eval mapa$y[$x]="$objeto"
	eval mapa$y[$x]="$objetoAnterior"
	xAnterior=$x
	yAnterior=$y
	objetoAnterior=$objeto
					if [ "$objeto" = "$trampa" ]
					then
						PANTALLA_GAME_OVER
					elif [ "$objeto" = "$muerte" ]
					then
						PANTALLA_GAME_OVER
					fi
	
}

PERSONAGE () {
	let posicionY=$tamanyMapaY/2
	let posicionX=$tamanyMapaX/2
	posicion=( "$posicionX" "$posicionY" )
	
}
POSICION_NUEVA_EN_MAPA_IZQUIERDA () {
	x="${posicion[0]}"
	y="${posicion[1]}"
	let x=$tamanyMapaXB-$x-1
	posicion=( "$x" "$y" )
	eval mapa$y[$x]="$tu"
	cambiarMapa=1
}
POSICION_NUEVA_EN_MAPA_DERECHA () {
	x="${posicion[0]}"
	y="${posicion[1]}"
	let x=$tamanyMapaXC-$x
	posicion=( "$x" "$y" )
	eval mapa$y[$x]="$tu"
	cambiarMapa=1
}
POSICION_NUEVA_EN_MAPA_ARRIBA () {
	x="${posicion[0]}"
	y="${posicion[1]}"		
	let y=$tamanyMapaYB-$y
	posicion=( "$x" "$y" )
	eval mapa$y[$x]="$tu"
	cambiarMapa=1
}
POSICION_NUEVA_EN_MAPA_ABAJO () {
	x="${posicion[0]}"
	y="${posicion[1]}"
	let y=$tamanyMapaY-$y
	posicion=( "$x" "$y" )
	eval mapa$y[$x]="$tu"
	cambiarMapa=1
}

IR_A_POSICION () {
	x="${posicion[0]}"
	y="${posicion[1]}"
	eval mapa$y[$x]="$tu"
}

ATAQUE_ARMA_CURVADA () {
	POSICION_IZQUIERDA
	POSICION_ARRIBA
	POSICION_DERECHA
	POSICION_ABAJO
	let points=$points+10

}
POSICION_IZQUIERDA () {
	let ataqueIzquierdaX=$x-1
	let ataqueIzquierdaY=$y
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	echo "$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}
POSICION_DERECHA () {
	let ataqueIzquierdaX=$x+1
	let ataqueIzquierdaY=$y
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}
POSICION_ARRIBA () {
	let ataqueIzquierdaX=$x
	let ataqueIzquierdaY=$y-1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"	
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}
POSICION_ABAJO () {
	let ataqueIzquierdaX=$x
	let ataqueIzquierdaY=$y+1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}



ATAQUE_DOBLE_ESPADA () {
	POSICION_DIAGONAL_IZQUIERDA
	POSICION_DIAGONAL_ARRIBA
	POSICION_DIAGONAL_DERECHA
	POSICION_DIAGONAL_ABAJO
	let points=$points+10

}
POSICION_DIAGONAL_IZQUIERDA () {
	let ataqueIzquierdaX=$x-1
	let ataqueIzquierdaY=$y-1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	echo "$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}
POSICION_DIAGONAL_DERECHA () {
	let ataqueIzquierdaX=$x+1
	let ataqueIzquierdaY=$y+1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}
POSICION_DIAGONAL_ARRIBA () {
	let ataqueIzquierdaX=$x+1
	let ataqueIzquierdaY=$y-1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"	
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}
POSICION_DIAGONAL_ABAJO () {
	let ataqueIzquierdaX=$x-1
	let ataqueIzquierdaY=$y+1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}

ATAQUE_ROCA_ABAJO () {
	ataque="$roca"
	DISPARO_ABAJO
	objetoEquipado="·"
	let points=$points+1000
}
ATAQUE_ROCA_DERECHA () {
	ataque="$roca"
	DISPARO_DERECHA
	objetoEquipado="·"
	let points=$points+1000
}
ATAQUE_ROCA_IZQUIERDA () {
	ataque="$roca"
	DISPARO_IZQUIERDA
	objetoEquipado="·"
	let points=$points+1000
}
ATAQUE_ROCA_ARRIBA () {
	ataque="$roca"
	DISPARO_ARRIBA
	objetoEquipado="·"
	let points=$points+1000
}

ATAQUE_ESCOPETA_ABAJO () {
	ataque="o"
	DISPARO_ABAJO
	let points=$points+10
}
ATAQUE_ESCOPETA_DERECHA () {
	ataque="o"
	DISPARO_DERECHA
	let points=$points+10
}
ATAQUE_ESCOPETA_IZQUIERDA () {
	ataque="o"
	DISPARO_IZQUIERDA
	let points=$points+10
}
ATAQUE_ESCOPETA_ARRIBA () {
	ataque="o"
	DISPARO_ARRIBA
	let points=$points+10
}
DISPARO_ARRIBA () {
	let ataqueIzquierdaX=$x
	let ataqueIzquierdaY=$y-1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x
	let ataqueIzquierdaY=$y-2
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x
	let ataqueIzquierdaY=$y-3
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x
	let ataqueIzquierdaY=$y-4
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}

DISPARO_DERECHA () {
	let ataqueIzquierdaX=$x+1
	let ataqueIzquierdaY=$y
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x+2
	let ataqueIzquierdaY=$y
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x+3
	let ataqueIzquierdaY=$y
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x+4
	let ataqueIzquierdaY=$y
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}

DISPARO_ABAJO () {
	let ataqueIzquierdaX=$x
	let ataqueIzquierdaY=$y+1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x
	let ataqueIzquierdaY=$y+2
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x
	let ataqueIzquierdaY=$y+3
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x
	let ataqueIzquierdaY=$y+4
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}

DISPARO_IZQUIERDA () {
	let ataqueIzquierdaX=$x-1
	let ataqueIzquierdaY=$y
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x-2
	let ataqueIzquierdaY=$y
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x-3
	let ataqueIzquierdaY=$y
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
	let ataqueIzquierdaX=$x-4
	let ataqueIzquierdaY=$y
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="$ataque"
	MOSTRAR_MAPA
	sleep 0.1
	eval mapa$ataqueIzquierdaY[$ataqueIzquierdaX]="·"
}

MOVIMIENTO () {
	while true
	do
		read -e -n 1 direccion
		case $direccion in			

			w)
				posicionAntigua=`echo "${posicion[1]}"`
				if [ $posicionAntigua -le 0 ] #ací es pot posar una variable
				then
					posicionNueva=$posicionAntigua
					posicion[1]=$posicionNueva
					MAPA
					POSICION_NUEVA_EN_MAPA_ARRIBA
				else
					let posicionNueva=$posicionAntigua-1
					GUARDAR_OBJETOY
					posicion[1]=$posicionNueva
				
				fi
				break
		
			;;
			x)
				posicionAntigua=`echo "${posicion[1]}"`
				if [ $posicionAntigua -ge $tamanyMapaYC ] #ací es pot posar una variable
				then
					posicionNueva=$posicionAntigua
					posicion[1]=$posicionNueva
					MAPA
					POSICION_NUEVA_EN_MAPA_ABAJO
				else
				let posicionNueva=$posicionAntigua+1
					GUARDAR_OBJETOY
				posicion[1]=$posicionNueva
				
				fi
				break
		
			;;
			a)
				posicionAntigua=`echo "${posicion[0]}"`
				if [ $posicionAntigua -le 0 ] #ací es pot posar una variable
				then
					posicionNueva=$posicionAntigua
					posicion[0]=$posicionNueva
					MAPA
					POSICION_NUEVA_EN_MAPA_IZQUIERDA
				else
					let posicionNueva=$posicionAntigua-1
					GUARDAR_OBJETOX
				posicion[0]=$posicionNueva
				
				fi
				break
			
			;;
			d)
				posicionAntigua=`echo "${posicion[0]}"`
				if [ $posicionAntigua -ge $tamanyMapaXB ] 
				then
					posicionNueva=$posicionAntigua
					posicion[0]=$posicionNueva
					MAPA
					POSICION_NUEVA_EN_MAPA_DERECHA
				else
				let posicionNueva=$posicionAntigua+1
					GUARDAR_OBJETOX
				posicion[0]=$posicionNueva
				
				fi
				break

			;;
			q)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -le 0 ]
				then
					echo -n #Inutil#Inutil
					MAPA
					POSICION_NUEVA_EN_MAPA_IZQUIERDA
				elif  [ $posicionAntiguaY -le 0 ]
				then
					echo -n #Inutil#Inutil
					MAPA
					POSICION_NUEVA_EN_MAPA_ARRIBA
				else
					let posicionNuevaX=$posicionAntiguaX-1
					
					let posicionNuevaY=$posicionAntiguaY-1
					GUARDAR_OBJETOXY
					posicion[0]=$posicionNuevaX
					posicion[1]=$posicionNuevaY
				
				fi
				break
			;;
			e)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -ge $tamanyMapaXB ]
				then
					echo -n #Inutil#Inutil
					MAPA
					POSICION_NUEVA_EN_MAPA_DERECHA
				elif  [ $posicionAntiguaY -le 0 ]
				then
					echo -n #Inutil#Inutil
					MAPA
					POSICION_NUEVA_EN_MAPA_ARRIBA
				else
					let posicionNuevaX=$posicionAntiguaX+1
				
					let posicionNuevaY=$posicionAntiguaY-1
					GUARDAR_OBJETOXY
					posicion[0]=$posicionNuevaX
					posicion[1]=$posicionNuevaY
				
				fi
				break
				
			;;
			z)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -le 0 ]
				then
					echo -n #Inutil#Inutil
					MAPA
					POSICION_NUEVA_EN_MAPA_IZQUIERDA
				elif  [ $posicionAntiguaY -ge $tamanyMapaYB ]
				then
					echo -n #Inutil#Inutil
					MAPA
					POSICION_NUEVA_EN_MAPA_ABAJO
				else
					let posicionNuevaX=$posicionAntiguaX-1
			
					let posicionNuevaY=$posicionAntiguaY+1
					GUARDAR_OBJETOXY
					posicion[0]=$posicionNuevaX
					posicion[1]=$posicionNuevaY
				
				fi
				break
				
			;;
			c)
				posicionAntiguaX=`echo "${posicion[0]}"`
				posicionAntiguaY=`echo "${posicion[1]}"`
				if [ $posicionAntiguaX -ge $tamanyMapaXB ]
				then
					echo -n #Inutil#Inutil
					MAPA
					POSICION_NUEVA_EN_MAPA_DERECHA
				elif  [ $posicionAntiguaY -ge $tamanyMapaYB ]
				then
					echo -n #Inutil#Inutil
					MAPA
					POSICION_NUEVA_EN_MAPA_ABAJO
				else
					let posicionNuevaX=$posicionAntiguaX+1
					let posicionNuevaY=$posicionAntiguaY+1
					GUARDAR_OBJETOXY
					posicion[0]=$posicionNuevaX
					posicion[1]=$posicionNuevaY
				
				fi
				break
				
			;;
			n)
				if [ "${arrayInventaria[0]}" = "·" ]
				then
				arrayInventaria[0]=$objeto
				elif [ "${arrayInventaria[1]}" = "·" ]  
				then
				arrayInventaria[1]=$objeto
				elif [ "${arrayInventaria[2]}" = "·" ]  
				then
				arrayInventaria[2]=$objeto
				elif [ "${arrayInventaria[3]}" = "·" ]  
				then
				arrayInventaria[3]=$objeto
				elif [ "${arrayInventaria[4]}" = "·" ]  
				then
				arrayInventaria[4]=$objeto
				elif [ "${arrayInventaria[5]}" = "·" ]  
				then
				arrayInventaria[5]=$objeto
				elif [ "${arrayInventaria[6]}" = "·" ]  
				then
				arrayInventaria[6]=$objeto
				elif [ "${arrayInventaria[7]}" = "·" ]  
				then
				arrayInventaria[7]=$objeto
				elif [ "${arrayInventaria[8]}" = "·" ]  
				then
				arrayInventaria[8]=$objeto
				elif [ "${arrayInventaria[9]}" = "·" ]  
				then
				arrayInventaria[9]=$objeto
				fi
				objetoAnterior="·"
				let points=$points+1000
				break
			;;
			N)
				
				if [ "${arrayInventaria[0]}" = "·" ]
				then
				arrayInventaria[0]=$objeto
				elif [ "${arrayInventaria[1]}" = "·" ]  
				then
				arrayInventaria[1]=$objeto
				elif [ "${arrayInventaria[2]}" = "·" ]  
				then
				arrayInventaria[2]=$objeto
				elif [ "${arrayInventaria[3]}" = "·" ]  
				then
				arrayInventaria[3]=$objeto
				elif [ "${arrayInventaria[4]}" = "·" ]  
				then
				arrayInventaria[4]=$objeto
				elif [ "${arrayInventaria[5]}" = "·" ]  
				then
				arrayInventaria[5]=$objeto
				elif [ "${arrayInventaria[6]}" = "·" ]  
				then
				arrayInventaria[6]=$objeto
				elif [ "${arrayInventaria[7]}" = "·" ]  
				then
				arrayInventaria[7]=$objeto
				elif [ "${arrayInventaria[8]}" = "·" ]  
				then
				arrayInventaria[8]=$objeto
				elif [ "${arrayInventaria[9]}" = "·" ]  
				then
				arrayInventaria[9]=$objeto
				fi
				objetoAnterior="·"
				let points=$points+1000
				break
			;;
			0)
				objetoSeleccionado=`echo "${arrayInventaria[9]}"`

				if [ "$objetoEquipado" = "$objetoSeleccionado" ]
				then
					arrayInventaria[9]="·"
					objetoAnterior="$objetoEquipado"
					objetoEquipado="·"
				else
					objetoEquipado=${arrayInventaria[9]}
				fi
				break
				
			;;
			1)
				objetoSeleccionado=`echo "${arrayInventaria[0]}"`
				
				if [ "$objetoEquipado" = "$objetoSeleccionado" ]
				then
					arrayInventaria[0]="·"
					objetoAnterior="$objetoEquipado"
					objetoEquipado="·"
				else
					objetoEquipado=${arrayInventaria[0]}
				fi
				arrayInventaria[0]="·"
				break
				
			;;			
			2)
				objetoSeleccionado=`echo "${arrayInventaria[1]}"`
			
				if [ "$objetoEquipado" = "$objetoSeleccionado" ]
				then
					arrayInventaria[1]="·"
					objetoAnterior="$objetoEquipado"
					objetoEquipado="·"
				else
					objetoEquipado=${arrayInventaria[1]}
				fi
				break
				
			;;			
			3)
				objetoSeleccionado=`echo "${arrayInventaria[2]}"`
			
				if [ "$objetoEquipado" = "$objetoSeleccionado" ]
				then
					arrayInventaria[2]="·"
					objetoAnterior="$objetoEquipado"
					objetoEquipado="·"
				else
					objetoEquipado=${arrayInventaria[2]}
				fi
				break
				
			;;			
			4)
				objetoSeleccionado=`echo "${arrayInventaria[3]}"`
			
				if [ "$objetoEquipado" = "$objetoSeleccionado" ]
				then
					arrayInventaria[3]="·"
					objetoAnterior="$objetoEquipado"
					objetoEquipado="·"
				else
					objetoEquipado=${arrayInventaria[3]}
				fi
				break
				
			;;			
			5)
				objetoSeleccionado=`echo "${arrayInventaria[4]}"`
			
				if [ "$objetoEquipado" = "$objetoSeleccionado" ]
				then
					arrayInventaria[4]="·"
					objetoAnterior="$objetoEquipado"
					objetoEquipado="·"
				else
					objetoEquipado=${arrayInventaria[4]}
				fi
				break
				
			;;			
			6)
				objetoSeleccionado=`echo "${arrayInventaria[5]}"`
		
				if [ "$objetoEquipado" = "$objetoSeleccionado" ]
				then
					arrayInventaria[5]="·"
					objetoAnterior="$objetoEquipado"
					objetoEquipado="·"
				else
					objetoEquipado=${arrayInventaria[5]}
				fi
				break
				
			;;			
			7)
				objetoSeleccionado=`echo "${arrayInventaria[6]}"`
			
				if [ "$objetoEquipado" = "$objetoSeleccionado" ]
				then
					arrayInventaria[6]="·"
					objetoAnterior="$objetoEquipado"
					objetoEquipado="·"
				else
					objetoEquipado=${arrayInventaria[6]}
				fi
				break
				
			;;			
			8)
				objetoSeleccionado=`echo "${arrayInventaria[7]}"`
			
				if [ "$objetoEquipado" = "$objetoSeleccionado" ]
				then
					arrayInventaria[7]="·"
					objetoAnterior="$objetoEquipado"
					objetoEquipado="·"
				else
					objetoEquipado=${arrayInventaria[7]}
				fi
				break
				
			;;
						
			9)
				objetoSeleccionado=`echo "${arrayInventaria[8]}"`
			
				if [ "$objetoEquipado" = "$objetoSeleccionado" ]
				then
					arrayInventaria[8]="·"
					objetoAnterior="$objetoEquipado"
					objetoEquipado="·"
				else
					objetoEquipado=${arrayInventaria[8]}
				fi
				break
				
			;;
			k)
				if [ "$objetoEquipado" = "$espadaCurvada" ]
				then
					ATAQUE_ARMA_CURVADA
				elif [ "$objetoEquipado" = "$espadas" ]
				then
					ATAQUE_DOBLE_ESPADA
				elif [ "$objetoEquipado" = "$escopeta" ]
				then
					ATAQUE_ESCOPETA_ABAJO
				elif [ "$objetoEquipado" = "$roca" ]
				then
					ATAQUE_ROCA_ABAJO
				fi
				break
			;;
			j)
				if [ "$objetoEquipado" = "$espadaCurvada" ]
				then
					ATAQUE_ARMA_CURVADA
				elif [ "$objetoEquipado" = "$espadas" ]
				then
					ATAQUE_DOBLE_ESPADA
				elif [ "$objetoEquipado" = "$escopeta" ]
				then
					ATAQUE_ESCOPETA_IZQUIERDA
				elif [ "$objetoEquipado" = "$roca" ]
				then
					ATAQUE_ROCA_IZQUIERDA
				fi
				break
			;;
			l)
				if [ "$objetoEquipado" = "$espadaCurvada" ]
				then
					ATAQUE_ARMA_CURVADA
				elif [ "$objetoEquipado" = "$espadas" ]
				then
					ATAQUE_DOBLE_ESPADA
				elif [ "$objetoEquipado" = "$escopeta" ]
				then
					ATAQUE_ESCOPETA_DERECHA
				elif [ "$objetoEquipado" = "$roca" ]
				then
					ATAQUE_ROCA_DERECHA
				fi
				break
			;;
			i)
				if [ "$objetoEquipado" = "$espadaCurvada" ]
				then
					ATAQUE_ARMA_CURVADA
				elif [ "$objetoEquipado" = "$espadas" ]
				then
					ATAQUE_DOBLE_ESPADA
				elif [ "$objetoEquipado" = "$escopeta" ]
				then
					ATAQUE_ESCOPETA_ARRIBA
				elif [ "$objetoEquipado" = "$roca" ]
				then
					ATAQUE_ROCA_ARRIBA
				fi
				break
			;;
			*)
			
			;;
		esac
	done
}
COMPROBAR_MUERTE () {
	contadorY=0
	contadorDeMort=0
	while [ $contadorY -lt $tamanyMapaY ]
	do 
		contadorX=0
		eval mapaConAnimales='$'{mapa$contadorY[*]}
		for totesLesCoses in $mapaConAnimales
		do
			if [ "$totesLesCoses" = "$tu" ]
			then
				let contadorDeMort=$contadorDeMort+1
			fi
			let contadorX=$contadorX+1
		done
		let contadorY=$contadorY+1
	done
	if [ $contadorDeMort = 0 ]
	then
		PANTALLA_GAME_OVER
	fi
		
}
COMPROBAR_VICTORIA () {
	contadorHijo=0
	contadorHija=0
	contadorCorona=0
	for aquestObjecte in ${arrayInventaria[*]}
	do
		if [ "$aquestObjecte" = "$hijo" ]
		then	
			contadorHijo=1 
		elif [ "$aquestObjecte" = "$hija" ]
		then
			contadorHija=1 
		elif [ "$aquestObjecte" = "$corona" ]
		then
			contadorCorona=1 
		fi
	done
	let contadorVictoria=$contadorHijo+$contadorHija+$contadorCorona
	if [ $contadorVictoria -eq 3 ]
	then	let points=$points+100000
		INVENTARIO
		PANTALLA_VICTORIA
	fi
}
TUTORIAL (){
	clear
	echo "Move set: 

Movement keys: q w e a d z x c
Pick object from the floor: n or N
Grab object from the inventory: 1234567890
Attack with weapon: i j k l

Objects:

You: $tu
Nothing: $nada
Rock: $roca
Flower: $flor 
Traps: $trampa $muerte
Enemies: $monstruo  $serpiente
Friendly NPCs: $aldeano $oveja
Weapons: $espadas $espadaCurvada $escopeta
You are searching: $corona $hijo $hija
"
echo -n "Press return to continue..."
read
}
PANTALLA_GAME_OVER () {
	echo " _______  _______  _______  _______    _______           _______  _______ "
	echo " (  ____ \(  ___  )(       )(  ____ \  (  ___  )|\     /|(  ____ \(  ____ )"
	echo " | (    \/| (   ) || () () || (    \/  | (   ) || )   ( || (    \/| (    )|"
	echo " | |      | (___) || || || || (__      | |   | || |   | || (__    | (____)|"
	echo " | | ____ |  ___  || |(_)| ||  __)     | |   | |( (   ) )|  __)   |     __)"
	echo " | | \_  )| (   ) || |   | || (        | |   | | \ \_/ / | (      | (\ (   "
	echo " | (___) || )   ( || )   ( || (____/\  | (___) |  \   /  | (____/\| ) \ \__"
	echo " (_______)|/     \||/     \|(_______/  (_______)   \_/   (_______/|/   \__/"
                                                                          
	exit
}
PANTALLA_VICTORIA () {
	echo "           _______                     _________ _      " 
	echo " |\     /|(  ___  )|\     /|  |\     /|\__   __/( (    /|"
	echo " ( \   / )| (   ) || )   ( |  | )   ( |   ) (   |  \  ( |"
	echo "  \ (_) / | |   | || |   | |  | | _ | |   | |   |   \ | |"
	echo "   \   /  | |   | || |   | |  | |( )| |   | |   | (\ \) |"
	echo "    ) (   | |   | || |   | |  | || || |   | |   | | \   |"
	echo "    | |   | (___) || (___) |  | () () |___) (___| )  \  |"
	echo "    \_/   (_______)(_______)  (_______)\_______/|/    )_)"

	exit
                                                        
}
#############################VARIABLES#################################
nada="·"
arbust="w"
muerte=`echo -e '\u2620'` #☠
flor=`echo -e '\u0759'` #ݙ
flor2=`echo -e '\u060F'` #؏
trampa=`echo -e '\u04C1'` #Ӂ
escopeta=`echo -e '\u0797'` #ޗ #
espadaYEscudo=`echo -e '\u093B'` #ऻ #
fantasma=`echo -e '\u0B6B'` #୫ #
ataque=`echo -e '\u0B75'` #୵
monstruo=`echo -e '\u1029'` #ဩ #
aldeano=`echo -e '\u1338'` #ጸ #
serpiente=`echo -e '\u135A'` #ፚ #

oveja=`echo -e '\u1387'` #ᎇ #
tu=`echo -e '\u1695'` #ᚕ
roca=`echo -e '\u1A12'` #ᨒ #
corona=`echo -e '\u265A'` #♚ 
espadas=`echo -e '\u2694'` #⚔ #
espadaCurvada=`echo -e '\u26B8'` #⚸ #
hijo=`echo -e '\u2D86'` #ⶆ
hija=`echo -e '\u2D87'` #ⶇ
objetoAnterior="·"
tamanyMapaY=18
tamanyMapaX=28
let tamanyMapaYB=$tamanyMapaY-1
let tamanyMapaXB=$tamanyMapaX-1
let tamanyMapaYC=$tamanyMapaY-1
let tamanyMapaXC=$tamanyMapaX-1
objeto="·"
contadorInventario=0
objetoEquipado="·"
arrayInventaria=( "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" "·" )
contadorDeMort=0
cambiarMapa=0
points=0
###########################MAIN PROGRAM###################################
TUTORIAL
MAPA
PERSONAGE
IR_A_POSICION
MOSTRAR_MAPA
INVENTARIO
while true
do
MOVIMIENTO
if [ $cambiarMapa -eq 0 ]
then
	IR_A_POSICION
else
	cambiarMapa=0
fi
INTELIGENCIA_ARTIFICIAL
MOSTRAR_MAPA
INVENTARIO
COMPROBAR_MUERTE
COMPROBAR_VICTORIA
done
