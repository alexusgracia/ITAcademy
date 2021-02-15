class Persona {
    constructor(nom) {
        this.nom = nom;
    }
    //Getters
    decirNombre(){
        return this.nom;
    }
}
let p = new Persona('Alexandre')

console.log(`El nombre de la persona es ${p.decirNombre()}`)