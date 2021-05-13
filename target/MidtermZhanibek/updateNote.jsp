
<%@include file="myHeader.jsp"%>
<div class="login-form">
    <div class="well">
        <h3><% out.print("Update a Note");%></h3>
        <form action="UpdateNoteServlet" method="post" align="center">
            <input type="hidden" name="action" value="update">
            <label for="noteId">Note ID</label>
            <input type="text" class="" placeholder="Enter Book ID" name="noteId" id="noteId"><br>
            <label for="title">Note Title</label>
            <input type="text" class="" placeholder="Enter the title" name="title" id="title"><br>
            <label for="date"><abbr title="target date">Target date</abbr></label>
            <input type="text" class="" placeholder="DD/MM/YYYY" name="date" id="date" align="right"><br>
            <label for="status">Note status</label>
            <input type="text" class="" placeholder="false or true" name="status" id="status"><br>
            <button type="submit" name="action" value="update">Update</button>
            <br>
            <p><c:out value="${message}"/></p>
        </form>
    </div>
</div>

</body>
</html>
