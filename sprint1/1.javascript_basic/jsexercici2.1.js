function calculadora(operacio, valor1, valor2){
    switch(operacio){
        case 'suma':
            return valor1+valor2;
        case 'resta':
            return valor1-valor2;
        case 'multiplicacio':
            return valor1*valor2;
        case 'divisio':
            if(valor2 === 0) {
                alert('No es pot dividir per 0');
                return null;
            }
            else return valor1/valor2;
    }
}
let operacio = 'divisio'
let valor1 = 40
let valor2 = 0
let resultat = calculadora(operacio,valor1,valor2);
console.log(`El resultat de la ${operacio} entre ${valor1} i ${valor2} és ${resultat}`)