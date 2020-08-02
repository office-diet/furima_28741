window.addEventListener('load', function(){
  console.log ("ready");
  const inputPrice = document.getElementById("item_price");
  const textFee = document.getElementById("add-tax-price");
  const textProfit = document.getElementById("profit");

  inputPrice.addEventListener('change', function (){
    let price = this.value;
    let fee = Math.floor(price * 0.1);
    textFee.textContent = fee;
    textProfit.textContent = price - fee;
  });

})