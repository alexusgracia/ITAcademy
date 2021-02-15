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



class UI{
    calcula(valor1, valor2, operacio){
        const calculs = document.getElementById('calculs-realitzats');
        const element = document.createElement('div');
        let resultat = calculadora(operacio, valor1, valor2)
        element.innerHTML = `
            <div class="card text-center mb-4">
                <div class="card-body">
                    <strong>Valor1</strong>: ${valor1}
                    <strong>Valor2</strong>: ${valor2}
                    <strong>Operació</strong>: ${operacio}
                    <strong>Resultat</strong>: ${resultat}
                </div>            
            </div>
        `;
        calculs.appendChild(element);
        this.resetForm();
    }
    resetForm(){
        document.getElementById('form').reset();
    }


}

//DOM Events
document.getElementById('form')
    .addEventListener("submit", function (event){
        const valor1 = parseInt(document.getElementById('valor1').value)
        const valor2 = parseInt(document.getElementById('valor2').value)
        const operacio = document.getElementById('operacio').value
        const ui = new UI();

        ui.calcula(valor1, valor2, operacio);

        event.preventDefault()
    })
