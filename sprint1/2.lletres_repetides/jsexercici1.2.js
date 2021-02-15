function exercici() {

    let nom = 'alex4ndre'
    let vocals = 'aeiou'
    let consonants = 'bcdfghjklmnñpqrstvwxyz'
    let nombres = '0123456789'
    console.log(`Partim del nom ${nom}`)
    for (let i = 0; i < nom.length; i++) {
        if (vocals.includes(nom[i])) console.log(`He trobat la vocal ${nom[i]}`)
        else if (consonants.includes(nom[i])) console.log(`He trobat la consonant ${nom[i]}`)
        else if (nombres.includes(nom[i])) console.log(`Els noms de persones no contentenen el número: ${nom[i]}`)
    }
}

exercici()