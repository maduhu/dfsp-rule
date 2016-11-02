var data = {
    commission: [
        {
            conditionId: 1,
            y: Math.random()
        },
        {
            conditionId: 1,
            y: Math.random()
        },
        {
            conditionId: 2,
            y: Math.random()
        }
    ],
    fee: [
        {
            conditionId: 1,
            y: Math.random()
        },
        {
            conditionId: 2,
            y: Math.random()
        },
        {
            conditionId: 3,
            y: Math.random()
        }
    ]
}

var y =  Object.keys(data).reduce(function(all, key) {
    data[key].forEach(function(record) {
        if (!all[record.conditionId]) {
            all[record.conditionId] = {};
        }
        if (!all[record.conditionId][key]) {
            all[record.conditionId][key] = []
        }
        all[record.conditionId][key].push(record);
    })
    return all;
}, {})

var z = Object.keys(y).map(function(key) {
    return y[key]
})

// var y = Object.keys(data).map(function(key) {
//     return data[key].reduce(function(all, record) {
//         if (!all.data[record.conditionId]) {
//             all.data[record.conditionId] = [];
//         }
//         all.data[record.conditionId].push(record);
//         return all;
//     }, {key: key, data: {}});
// }).reduce(function(all, record) {
//     var item = all.push(recor)
// }, []);

console.log(JSON.stringify(z, null, 2))

// var y = [
//     {
//         commission: [
//             {
//                 x: 1,
//                 y: 1
//             },
//             {
//                 x: 1,
//                 y: 2
//             }
//         ]
//     },
//     {
//         commission: [
//             {
//                 x: 2,
//                 y: 2
//             }
//         ]
//     }
// ]