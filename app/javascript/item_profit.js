function item(){

  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", function(){
      const inputValue = priceInput.value;
      const Sales_commission = document.getElementById("add-tax-price");
      Sales_commission.innerHTML = inputValue * 0.1
      const Sales_profit = document.getElementById("profit");
      Sales_profit.innerHTML = inputValue - Sales_commission.innerHTML
  })
}
  window.addEventListener('load', item)