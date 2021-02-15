/*************************************
 ARROW FUNCTIONS
 *************************************/

////////////////// Función tradicional
function hola(a) {
    return a + 100;
}

// Desglose de la función flecha

// 1. Elimina la palabra "function" y coloca la flecha entre el argumento y el corchete de apertura.
(a) => {
    return a + 100;
}

// 2. Quita los corchetes del cuerpo y la palabra "return" — el return está implícito.
(a) => a + 100;

// 3. Suprime los paréntesis de los argumentos
a => a + 100;

////////////////// Función tradicional
function hola(a, b) {
    return a + b + 100;
}

// Función flecha
{
    (a, b) => a + b + 100;
}

////////////////// Función tradicional (sin argumentos)
{
    let a = 4;
    let b = 2;

    function hola() {
        return a + b + 100;
    }
}
// Función flecha (sin argumentos)
let a = 4;
let b = 2;
() => a + b + 100;

////////////////// Función tradicional

function hola(a, b) {
    let chuck = 42;
    return a + b + chuck;
}

// Función flecha
(a, b) => {
    let chuck = 42;
    return a + b + chuck;
}

////////////////// Función tradicional
{
    function bob(a) {
        return a + 100;
    }
}

// Función flecha
{
    let bob = a => a + 100;
}


/*************************************
 PROMISES
 *************************************/

const datos = [{
    id: 1,
    title: 'Iron Man',
    year: 2008
}, {
    id: 2,
    title: 'Spiderman',
    year: 2017
}];

const getDatossinRetraso = () => {
    return datos;
}

//Ahora con retraso
//DEvolverá undefined
const getDatosconRetraso = () => {
    setTimeout(() => {
        return datos;
    }, 1500)
}
console.log('Dará undefined', getDatosconRetraso())


const getDatosconRetrasoyPromise = () => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(datos);
        }, 1500);
    });
}
getDatosconRetrasoyPromise()
    .then((datos) => {
        console.log(datos)
    })
    .catch((error)=>{
        console.log(error)
    })

const getDatosconsync = () => {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(datos);
        }, 3000);
    });
}
async function fetchingdata (){
    try {
        const data = await getDatosconsync()

        console.log(data);
    }catch(err){
        console.log(err)
    }
}
fetchingdata()

