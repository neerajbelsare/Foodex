<%@page import="java.util.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<title>Upload Image</title>
<% int cnt10=0;%>

<body>

<div class="container p-5">
    <form action="uploadimage" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="example FormControl File1">Select your image</label> <input type="file" name="profile" class="form-control-file" id="exampleFormCor">
<h1>Upload Image</h1>
</div>
<button class="btn btn-outline-success" type="submit">Upload</button>
    </form>
</div>
</body>