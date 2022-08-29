function cul (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const taxVal = Math.floor(itemPrice.value * 0.1);
    const addTaxPrice  = document.getElementById("add-tax-price");
    const profitVal = itemPrice.value - Math.floor(itemPrice.value * 0.1);
    const profit  = document.getElementById("profit");
    addTaxPrice.innerHTML = `${taxVal}`;
    profit.innerHTML = `${profitVal}`;
  });
};

window.addEventListener('load', cul);

