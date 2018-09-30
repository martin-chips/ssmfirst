<%@page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//CN">
<html>
<head>
    <meta charset="utf-8">
    <title>嘿咻</title>
    <meta charset="utf-8">
    <%--此处的库需要换成你自己的或者是cdn--%>
    <script src="../jquery/jquery-3.3.1.js"></script>
</head>
<body>

c1:<input id="c1" name="checkbox" type="checkbox" checked="checked" /></br>
c2:<input id="c2" name="checkbox" type="checkbox" checked=true/></br>
c3:<input id="c3" name="checkbox" type="checkbox" checked=""/></br>
c4:<input id="c4" name="checkbox" type="checkbox" checked/></br>
c5:<input id="c5" name="checkbox" type="checkbox" /></br>
c6:<input id="c6" name="checkbox" type="checkbox" checked=false/></br>


<script>
    var a1=$("#c1").attr("checked");
    var a2=$("#c2").attr("checked");
    var a3=$("#c3").attr("checked");
    var a4=$("#c4").attr("checked");
    var a5=$("#c5").attr("checked");
    var a6=$("#c6").attr("checked");

    var p1=$("#c1").prop("checked");
    var p2=$("#c2").prop("checked");
    var p3=$("#c3").prop("checked");
    var p4=$("#c4").prop("checked");
    var p5=$("#c5").prop("checked");
    var p6=$("#c6").prop("checked");

    console.log("a1:"+a1);
    console.log("a2:"+a2);
    console.log("a3:"+a3);
    console.log("a4:"+a4);
    console.log("a5:"+a5);
    console.log("a6:"+a6);

    console.log("p1:"+p1);
    console.log("p2:"+p2);
    console.log("p3:"+p3);
    console.log("p4:"+p4);
    console.log("p5:"+p5);
    console.log("p6:"+p6);
</script>
</body>
</html>