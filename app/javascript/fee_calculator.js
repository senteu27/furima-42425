function calculate (){
   const priceInput = document.getElementById("item-price");
   const feeTax = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");

   priceInput.addEventListener("input", () => {
      const price = Number(priceInput.value);
      const fee = Math.floor(price * 0.1);
      feeTax.textContent = fee;
      profit.textContent = (price - fee);
   });
};

window.addEventListener('turbo:load', calculate);
window.addEventListener('turbo:render', calculate);