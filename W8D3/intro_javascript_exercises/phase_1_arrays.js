// Array#uniq

Array.prototype.uniq = function() {
    // debugger
    let newArr = [];

    for (let i = 0; i < this.length; i++) {
        let ele = this[i];
        if (!newArr.includes(ele)) {
            newArr.push(ele);
        }
    }

    return newArr;
};

// console.log([10, 10, 13, 14].uniq());

// Array#twoSum
Array.prototype.twoSum = function() {
    let newArr = [];
    debugger
    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                newArr.push([i,j]);
            }
        }
    }
    return newArr;
}

// console.log([10, -10, 13, -10].twoSum());

// Array#transpose
Array.prototype.transpose = function() {
    let newArr = new Array(this.length);

    for (let i = 0; i < newArr.length; i++) {
        newArr[i] = new Array(newArr.length);
    }

    for (let i = 0; i < newArr.length; i++) {
        for (let j = 0; j < newArr[0].length; j++) {
            newArr[j][i] = this[i][j];
        }
    }

    return newArr;
}


//console.log([[1,2,3],[4,5,6],[7,8,9]].transpose());
