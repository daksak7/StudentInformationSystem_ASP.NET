<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="StudentInfo.aspx.vb" Inherits="Homework_2.StudentInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>OGRBILSIS DEMO</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
</head>
<body style="background-color:#D6D6D6">

    <nav class=" navbar-expand-lg navbar navbar-light" style="background-color: #720B0B;">
  <a class="navbar-brand" href="Default.aspx">BACK TO THE HOMEPAGE</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

</nav>
    <form id="form1" runat="server">
        <div>

            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Student Info"></asp:Label>

            <asp:Label ID="LabelUpdateAlertifneeded" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="StudentID" DataSourceID="SqlDataSourceStudentInfo" Height="50px" Width="300px" AutoGenerateEditButton="True" OnRowEditing="EditRecord" OnCancilingEdit="CancelRecord">
                <Fields>
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
                    <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                    <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSourceStudentInfo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StudentID], [StudentName], [BirthDate] FROM [Students] WHERE ([StudentID] = @StudentID)" DeleteCommand="DELETE FROM [Students] WHERE [StudentID] = @StudentID" InsertCommand="INSERT INTO [Students] ([StudentName], [BirthDate]) VALUES (@StudentName, @BirthDate)" UpdateCommand="UPDATE [Students] SET [StudentName] = @StudentName, [BirthDate] = @BirthDate WHERE [StudentID] = @StudentID">
                <DeleteParameters>
                    <asp:Parameter Name="StudentID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StudentName" Type="String" />
                    <asp:Parameter Name="BirthDate" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="id" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StudentName" Type="String" />
                    <asp:Parameter Name="BirthDate" Type="DateTime" />
                    <asp:Parameter Name="StudentID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Courses Taken by the Students"></asp:Label>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcetest" DataKeyNames="CourseID" Width="400px">
                <Columns>
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="CourseCode" HeaderText="Course Code" SortExpression="CourseCode" />
                    <asp:HyperLinkField DataNavigateUrlFields="CourseID" DataNavigateUrlFormatString="CourseInfo.aspx?id={0}" DataTextField="CourseName" HeaderText="Course Name" Text="coursename" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourcetest" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Courses.CourseID,Courses.CourseCode, Courses.CourseName FROM Enrolment INNER JOIN Courses ON Enrolment.CourseID = Courses.CourseID 
WHERE ([StudentID] = @StudentID)"
              UpdateCommand="SELECT [StudentID], [StudentName], [BirthDate] FROM [Students] WHERE ([StudentID] = @StudentID)"
                >
                <SelectParameters>
                    <asp:ControlParameter ControlID="DetailsView1" Name="StudentID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </div>
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
