document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");// 商品価格のidをviewﾌｧｲﾙからもってくる

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");// 手数料のidをviewﾌｧｲﾙからもってくる
    const taxValue = Math.floor(inputValue * 0.1);// これは手数料
    addTaxDom.innerHTML = taxValue;

    const profitDom = document.getElementById("profit");  
    profitDom.innerHTML = Math.floor(inputValue - taxValue); // ここでMath.floorを追加しました
  });
});