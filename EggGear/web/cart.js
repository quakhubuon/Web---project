
window.addEventListener("load", function() {
    var cartForm = document.forms.cart;
    
    // Calculate the cost of the order
    calcCart();
    
    // Event handlers for the web form
    cartForm.elements.modelQty.onchange = calcCart;
 
    var shippingOptions = document.querySelectorAll('input[name="shipping"]');
    for (var i = 0; i < shippingOptions.length; i++) {
       shippingOptions[i].onclick = calcCart;
    }
   
 });
 
 
 function calcCart() {
    var cartForm = document.forms.cart;
    
    // Calculate the inital cost of the order
    var mCost = cartForm.elements.modelCost.value;
    var qIndex = cartForm.elements.modelQty.selectedIndex;
    var quantity = cartForm.elements.modelQty[qIndex].value;
    
    // Initial cost = model cost x quantity 
    var orderCost = mCost*quantity;
    cartForm.elements.orderCost.value = formatUSCurrency(orderCost);
 
    // Retrieve the cost of shipping
    var shipCost = document.querySelector('input[name="shipping"]:checked').value*quantity;
    cartForm.elements.shippingCost.value = formatNumber(shipCost, 2);
    
    // Calculate the order subtotal
    cartForm.elements.subTotal.value = formatNumber(orderCost + shipCost, 2);
    
    // Calculate the sales tax
    var salesTax = 0.1*(orderCost + shipCost);
    cartForm.elements.salesTax.value = formatNumber(salesTax, 2);
    
    // Calculate the cost of the total order
    var cartTotal = orderCost + shipCost + salesTax;
    cartForm.elements.cartTotal.value = formatUSCurrency(cartTotal);
    
    // Store the order details
    cartForm.elements.shippingType.value = 
       document.querySelector('input[name="shipping"]:checked').nextSibling.nodeValue;
 }
 
 function formatNumber(val, decimals) {
    return val.toLocaleString(undefined, {minimumFractionDigits: decimals, 
                                          maximumFractionDigits: decimals});
 }
 
 function formatUSCurrency(val) {
    return val.toLocaleString('vi-VN', {style: "currency", currency: "VND"} );
 }

 function checkout(){
    alert("Cảm ơn Quý khách! Đơn hàng đã được tiếp nhận");
 }