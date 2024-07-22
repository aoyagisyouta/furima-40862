function item (){
  const itemPrice = document.getElementById('item-price');
  itemPrice.addEventListener("keyup", () => {
    const tax = Math.floor(itemPrice.value / 10);
    const addTaxPrice = document.getElementById('add-tax-price');
    const profitPrice = Math.floor(itemPrice.value - tax);
    const Profit = document.getElementById('profit');
    addTaxPrice.innerHTML = `${tax}`;
    Profit.innerHTML = `${profitPrice}`;
  });
 };
 
 window.addEventListener('turbo:load', item);