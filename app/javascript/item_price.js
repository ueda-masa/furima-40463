const priceInput = document.getElementById("item-price"); // 商品価格のidをviewﾌｧｲﾙからもってくる
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price"); // 手数料のidをviewﾌｧｲﾙからもってくる
  const taxValue = Math.floor(inputValue * 0.1); // これは手数料
  addTaxDom.innerHTML = taxValue;

  // 下記は出品部分に利益を表示するため
  const profitDom = document.getElementById("profit");  // profitは販売利益、viewﾌｧｲﾙからもってくる
  profitDom.innerHTML = inputValue - taxValue;
});