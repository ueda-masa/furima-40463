const price = () => {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const taxValue = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = taxValue;

    const profitDom = document.getElementById("profit");  
    profitDom.innerHTML = Math.floor(inputValue - taxValue); 
  });
};

document.addEventListener("turbo:load", price);
document.addEventListener("turbo:render", price);
