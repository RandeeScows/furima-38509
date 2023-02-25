window.addEventListener('load', ()=> {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const calcTax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = calcTax;
    const profitDom = document.getElementById("profit");
    const calcProfit = inputValue - calcTax;
    profitDom.innerHTML =  calcProfit;
  })
})
