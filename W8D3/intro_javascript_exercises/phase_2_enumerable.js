// Array#myEach(callback)

Array.prototype.myEach = function (cb) {
    for (let i = 0; i < this.length; i++) {
        // debugger
        cb(this[i]);
    }
}

// let doubler = function(n) {
//      console.log(2*n);
// }

// console.log([1,2,3,4].myEach(doubler));

// Array#myMap(callback)

Array.prototype.myMap = function (cb) {
    let newArr = [];

    let eachCb = function(arg) {
        newArr.push(cb(arg));
    }
    
    this.myEach(eachCb);

    // Alternative Option 2 
    // this.myEach((arg) => {
    //     newArr.push(cb(arg));
    // });

    return newArr;
}

let mapDoubler = function (n) {
    return 2 * n;
}

// console.log([1,2,3,4].myMap(mapDoubler));

// pseudo-code below
// if acc
//  i = 1
//  else
//  i = 0
// acc ||= self[0]
// def myinject
//     acc = (option_value)
//     (0...self.length-1) do |i|
//         acc = self[i] if !acc
//         proc.call(acc, self[i+1])
        
//     end
//     return acc
// end