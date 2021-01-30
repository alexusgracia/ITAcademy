class Estudiante {
    constructor(dni) {
        this.dni = dni;
    }
    //Getters
    get_dni(){
        return this.dni
    }
}

let arrowestudiante = (dni) => new Estudiante(dni);

console.log(arrowestudiante('12345678A').get_dni())