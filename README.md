# workshop-sb-front

SpringBoot Products Front Continuum Workshop

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
java -jar build/libs/workshop-sb-front-0.0.1.jar
```

## urls

### Sección de administración

    http://localhost:8081/admin

### Sección de cliente

    http://localhost:8081/index