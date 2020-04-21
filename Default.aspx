<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="Homework_2._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>STUDENT INFORMATION SYSTEM</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>

   
</head>
<body style="background-color:#D6D6D6">

    <nav class=" navbar-expand-lg navbar navbar-light" style="background-color: #720B0B;">
  <a class="navbar-brand" href="Default.aspx">HOMEPAGE</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

</nav>



    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" BackColor="#720B0B" Font-Bold="True" ForeColor="White" Text="STUDENTS"></asp:Label>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="StudentID" DataSourceID="SqlDataSource1" PageSize="5" >
            <Columns>
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
                <asp:HyperLinkField DataNavigateUrlFields="StudentID" DataNavigateUrlFormatString="StudentInfo.aspx?id={0}" DataTextField="StudentName" HeaderText="Student Name" FooterText=" " Text="studentname"  ControlStyle-ForeColor="Black" />
                <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StudentID], [StudentName], [BirthDate] FROM [Students]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="Label2" runat="server" BackColor="#720B0B" Font-Bold="True" ForeColor="White" Text="COURSES"></asp:Label>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="CourseID" HeaderText="CourseID" InsertVisible="False" ReadOnly="True" SortExpression="CourseID" />
                <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" />
                <asp:HyperLinkField DataNavigateUrlFields="CourseID" DataNavigateUrlFormatString="CourseInfo.aspx?id={0}" DataTextField="CourseName" HeaderText="Course Name" Text="coursename" ControlStyle-ForeColor="Black" />
                <asp:BoundField DataField="Instructor" HeaderText="Instructor" SortExpression="Instructor" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CourseID], [CourseCode], [CourseName], [Instructor] FROM [Courses]"></asp:SqlDataSource>
    </form>
    <br />
  <div class="card-footer text-muted">
    All rigths reserved.Made for BIM308-Web Server Programming Course as a Homework by <a href="http://github.com/daksak7">Doğancan Aksak</a>
  </div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
