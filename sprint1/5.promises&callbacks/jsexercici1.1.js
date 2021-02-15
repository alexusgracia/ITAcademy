
function creadora_promise(paraula) {
    return new Promise((resolve, reject) => {
        if (paraula === 'ok') {
            setTimeout(function(){
                resolve("¡Promise ok!");
            }, 1000);
        } else {
            setTimeout(function(){
                reject('Doncs no tot ok')
            }, 2000);
        }
    });
}

let promise = creadora_promise('ok')

promise.then(res => {
    console.log('Promise ok', res)
})
    .catch(err => {
        console.log('Rejected', err)
    })

promise = creadora_promise('no_ok')

promise.then(res => {
    console.log('Promise ok', res)
})
    .catch(err => {
        console.log('Rejected', err)
    })

