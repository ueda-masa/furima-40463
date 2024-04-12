const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = Math.floor(inputValue * 0.1);
    const addTaxDomElement = document.getElementById("add-tax-price");
    addTaxDomElement.textContent = addTaxDom;

    const salesProfit = Math.floor(inputValue - taxValue);
    const salesProfitElement = document.getElementById("profit");
    salesProfitElement.textContent = salesProfit;
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);

