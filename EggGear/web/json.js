document.getElementById("mycart").style.display = "none";

function thongbao(){
    alert("Xin lỗi!! Hệ Thống Đang Tạm Bảo Trì Để Nâng Cấp")
}

function hotro(){
    alert("Tel: 0978212451")
}

function soldout(){
    alert("Sản Phẩm Đang Tạm Hết!!")
}

function showcart(){
    var x = document.getElementById("mycart");
    if(x.style.display=="block"){
        document.getElementById("mycart").style.display = "none";
    }else{
        document.getElementById("mycart").style.display = "block";
    }

}   