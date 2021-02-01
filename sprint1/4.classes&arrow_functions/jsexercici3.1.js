
function creadora(){
    //return new Object()
    return {}
}

let objecte1 = creadora()
let objecte2 = creadora()
objecte1.nom = 'Alexandre'
objecte1.longitud = objecte1.nom.length
objecte2.nom = 'Gràcia'
objecte2.longitud = objecte2.nom.length
console.log('Els objectes creats són:', objecte1, objecte2)