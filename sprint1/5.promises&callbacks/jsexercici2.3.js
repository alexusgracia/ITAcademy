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
            resolve(employees[employees.findIndex(user => user.id === id)])
        }
        else{
            reject('Empleado no encontrado')
        }
    })
}

const get_salary = empleat =>{
    return new Promise((resolve, reject)=>{
        if (salaries.find(user => user.id === empleat.id)){
            resolve(salaries[salaries.findIndex(user => user.id === empleat.id)].salary)
        }
        else{
            reject('Salario no encontrado')
        }
    })
}

get_empleat(3).then(r=>{
    get_salary(r).then(res=>{
        console.log(res)
    })
})
.catch(err=>{
    console.log(err)
})
