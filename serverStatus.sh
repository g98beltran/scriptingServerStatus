#!/bin/bash

# Lista de direcciones a verificar
addresses=(
    "http://dir"
    
)

# Función para verificar la conectividad y autenticación
check_address() {
    address="$1"
    if curl -Is "$address" | grep -q "HTTP/1.1 401 Unauthorized"; then
        echo "La dirección $address requiere autenticación."
    elif curl -Is "$address" | grep -q "HTTP/1.1 200 OK"; then
        echo "La dirección $address permite acceso."
    else
        echo "La dirección $address no responde."
    fi
}

# Recorre la lista de direcciones y verifica cada una
for address in "${addresses[@]}"; do
    check_address "$address"
done
