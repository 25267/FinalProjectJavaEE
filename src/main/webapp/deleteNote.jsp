<%@include file="myHeader.jsp"%>


<div class="login-form">
    <div class="well">
        <h3>Delete Note</h3>
        <form action="DeleteNoteServlet" method="post" align="center">
            <input type="hidden" name="action" value="update">
            <label for="noteId">Note ID</label>
            <input type="text" class="" placeholder="Enter Book ID" name="noteId" id="noteId"><br>
            <button type="submit" name="action" value="update" class="btn btn-danger">Delete</button>
            <br>
            <p><c:out value="${message}"/></p>
        </form>
    </div>
</div>
</body>
</html>
