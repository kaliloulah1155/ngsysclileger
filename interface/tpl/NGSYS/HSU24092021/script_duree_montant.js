// function checkTime() {
//     var d = new Date(); // current time
//     var hours = d.getHours();
//     var mins = d.getMinutes();
//     var day = d.getDay();

//     return day >= 1 &&
//         day <= 5 &&
//         hours >= 9 &&
//         (hours < 17 || hours === 17 && mins <= 30);
// };

// console.log(checkTime());

const replaceSpecialChars = (str) => {
    return str.normalize('NFD').replace(/[\u0300-\u036f]/g, '') // Remove accents
        //.replace(/([^\w]+|\s+)/g, '-') // Replace space and other characters by hyphen
        .replace(/\-\-+/g, '-') // Replaces multiple hyphens by one hyphen
        .replace(/(^-+|-+$)/, ''); // Remove extra hyphens from beginning or end of the string
}

function removeSpecials(str) {
    var lower = str.toLowerCase();
    var upper = str.toUpperCase();

    var res = "";
    for (var i = 0; i < lower.length; ++i) {
        if (lower[i] != upper[i] || lower[i].trim() === '')
            res += str[i];
    }
    return res;
}
console.log(removeSpecials(replaceSpecialChars("This is a sentence!!! é côte d\'ivoire  ")));