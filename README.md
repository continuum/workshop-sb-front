# workshop-sb-front
Demo for Microservices &amp; Spring boot workshop
git

## Comandos gradle
                                                                          
| Comando | Descripción |
| ------- | ----------- |
| `./gradlew bootrun -x test` | Ejecuta la aplicación, sin ejecutar los tests |
| `./gradlew bootjar -x test` | Crea el jar de la aplicacion, sin ejecutar los tests |
| `./gradlew test` | Ejecuta los tests |
| `./gradlew clean` | Limpia el proyecto de clases y recursos auto-generados |

## Ejecutar aplicacion producción

### compilar y crear JAR
```
./gradlew bootjar -x test
```

### ejecutar el JAR
```
java -jar build/libs/workshop-sb-product-microservice-0.0.1.jar
```

### obtener todos los productos
    curl http://localhost:8080/api/v1/products
    
    status:
        200: [] // Array de productos
        404: Not Found
    
### obtener los productos por criterio name
    curl http://localhost:8080/api/v1/products?name=switch
    curl http://localhost:8080/api/v1/products?name=lite
    curl http://localhost:8080/api/v1/products?name=xbox
    
    status:
        200: [] // Array de productos
        404: Not Found

### crear un producto
    curl -X POST http://localhost:8080/api/v1/products -H "Content-Type: application/json" -d '{"name": "ps4", "price": 0}'
    curl -X POST http://localhost:8080/api/v1/products -H "Content-Type: application/json" -d '{"name": "ps4", "price": 300000}'

    status:
        201: Created //retorna el producto creado
        400: Bad Request //retorna error de parametros
        500: Server Error

### obtener un producto por id
    curl http://localhost:8080/api/v1/products/0
    curl http://localhost:8080/api/v1/products/1
    
    status:
        200: {} // Producto
        404: Not Found
