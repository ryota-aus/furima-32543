window.addEventListener('load', () => {
    const priceInput = document.getElementById("item-price");

    const inputValue = document.getElementById("add-tax-price");
    const addProfitDom = document.getElementById("profit");
    priceInput.addEventListener("input", () => {
    const price = priceInput.value
    
    const tax = Math.floor(price * 0.1);
    const sum = Math.floor(price - tax);


   
    inputValue.textContent = tax;
    addProfitDom.textContent = sum;    
  });
});