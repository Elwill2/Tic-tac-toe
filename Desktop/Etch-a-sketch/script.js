const clearButton = document.getElementById('clear-button');

const gridContainer = document.querySelector("#grid");

function createGrid(size) {
for (let i = 0; i < size * size; i++) {
const divs = document.createElement("div");
gridContainer.appendChild(divs);
divs.addEventListener("mouseover", function() {
divs.style.backgroundColor = "yellow";
});
divs.style.width = `${640 / size}px`;
divs.style.height = `${640 / size}px`;


    }
}
createGrid(16);


clearButton.addEventListener('click', function() {
    const gridSize = prompt("Which size grid would you like? (1-100)");
    if (gridSize < 1 || gridSize > 100) {
        alert("Please enter a number between 1 and 100.");
        return;
    }
    gridContainer.innerHTML = '';
    createGrid(gridSize);
});

