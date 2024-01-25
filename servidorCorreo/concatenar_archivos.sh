# Verificar si CodigoProyecto.txt ya existe y eliminarlo si es necesario
if [ -f "CodigoProyecto.txt" ]; then
    rm CodigoProyecto.txt
fi

# Concatenar el contenido de todos los archivos y agregar el nombre de cada archivo
for file in *; do
    if [ -f "$file" ]; then
        echo "Contenido del archivo: $file" >> CodigoProyecto.txt
        cat "$file" >> CodigoProyecto.txt
        echo "" >> CodigoProyecto.txt
    fi
done

