$(document).on('turbolinks:load', function (){
  const $inputPrice = $('#item_price');
  const $textFee = $('#add-tax-price');
  const $textProfit = $('#profit');
  const errorMessage = '半角数字のみ入力可能'
  $inputPrice.on('input', function(event){
    let input = $inputPrice.val();
    if ($.isNumeric(input)) {
      const fee = Math.floor(input * 0.1)
      $textFee.text(fee);
      $textProfit.text(input - fee);
    } else {
      $textFee.text(errorMessage);
      $textProfit.text(errorMessage);
    }
  });
});