
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    if (htmlElement.children) {
        let childArr = Array.from(htmlElement.children);
        childArr.forEach ( ele => {
            htmlElement.removeChild(ele);
        });
    };
    
    let p = document.createElement("p");
    p.innerHTML= string;
    htmlElement.appendChild(p);
};

htmlGenerator('Party Time.', partyHeader);
// htmlGenerator('Hello.', partyHeader);

