<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/design.css">


</head>

<body>

<div class="header">
    <a href="#" class="logo">Notes</a>
    <div class="header-right">
        <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
        <button onclick="document.getElementById('id02').style.display='block'" style="width:auto;">Registration</button>
    </div>
</div>


<div id="id01" class="modal">

    <form class="modal-content animate" action="LoginServlet" method="post">

        <div class="container">

            <input type="text" placeholder="Enter Username" name="name" required>


            <input type="password" placeholder="Enter Password" name="password" required>

            <button type="submit">Login</button>

        </div>

    </form>
</div>


<div id="id02" class="modal">

    <form class="modal-content animate" action="RegistrationServlet" method="post">

        <div class="container">

            <input type="text" placeholder="Enter Username" name="name" required>


            <input type="password" placeholder="Enter Password" name="password" required>

            <button type="submit">Registration</button>

        </div>

    </form>
</div>


<script>
    // Get the modal
    var modal = document.getElementById('id01');
    var modal2 = document.getElementById('id02');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }else if(event.target == modal2){
            modal2.style.display = "none";
        }
    }
</script>


</body>
</html>
