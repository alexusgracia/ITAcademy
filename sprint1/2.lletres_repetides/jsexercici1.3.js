function exercici() {
    let nom = 'alexandre'
    let miMap = new Map();

    console.log(miMap.has('a'))

    for (let i = 0; i < nom.length; i++) {
        if (miMap.has(nom[i])) {
            miMap.set(nom[i], miMap.get(nom[i]) + 1)
        } else {
            miMap.set(nom[i], 1)
        }

    }
    console.log(miMap)
}
exercici()