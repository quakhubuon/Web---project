function addCart(id) {
    var num = document.getElementById("number").value;
    $.post("addcart.php",{"id":id, "number":num},function(data, status){

    });
    alert(id + " " + num);
}