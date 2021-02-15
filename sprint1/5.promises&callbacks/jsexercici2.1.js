let employees = [{
    id: 1,
    name: 'Linux Torvalds'
}, {
    id: 2,
    name: 'Bill Gates'
}, {
    id: 3,
    name: 'Jeff Bezos'
}];

let salaries = [{
    id: 1,
    salary: 4000
}, {
    id: 2,
    salary: 1000
}, {
    id: 3,
    salary: 2000
}];

const get_empleat = id =>{
    return new Promise((resolve, reject)=>{
        if (employees.find(user => user.id === id)){
            resolve('Empleado encontrado')
        }
        else{
            reject('Empleado no encontrado')
        }
    })
}

get_empleat(4).then(r=>{
    console.log(r)
})
.catch(err=>{
    console.log(err)
})
