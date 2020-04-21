<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CourseInfo.aspx.vb" Inherits="Homework_2.CourseInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>OGRBILSIS DEMO</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
</head>
<body style="background-color:#D6D6D6">

    <nav class=" navbar-expand-lg navbar navbar-light" style="background-color: #720B0B;">
  <a class="navbar-brand" href="Default.aspx">BACK TO HE HOMEPAGE</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

</nav>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="LabelUpdateAlert2ifneeded" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Course Info"></asp:Label>
            <br />

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="400px" AutoGenerateEditButton="True" AutoGenerateRows="False" DataKeyNames="CourseID" DataSourceID="SqlDataSourceCourseDetail">
                <Fields>
                    <asp:BoundField DataField="CourseID" HeaderText="CourseID" InsertVisible="False" ReadOnly="True" SortExpression="CourseID" />
                    <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" />
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                    <asp:BoundField DataField="Instructor" HeaderText="Instructor" SortExpression="Instructor" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSourceCourseDetail" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CourseID], [CourseCode], [CourseName], [Instructor] FROM [Courses] WHERE ([CourseID] = @CourseID)" DeleteCommand="DELETE FROM [Courses] WHERE [CourseID] = @CourseID" InsertCommand="INSERT INTO [Courses] ([CourseCode], [CourseName], [Instructor]) VALUES (@CourseCode, @CourseName, @Instructor)" UpdateCommand="UPDATE [Courses] SET [CourseCode] = @CourseCode, [CourseName] = @CourseName, [Instructor] = @Instructor WHERE [CourseID] = @CourseID">
                <DeleteParameters>
                    <asp:Parameter Name="CourseID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseCode" Type="String" />
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="Instructor" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="CourseID" QueryStringField="id" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CourseCode" Type="String" />
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="Instructor" Type="String" />
                    <asp:Parameter Name="CourseID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Registered Students"></asp:Label>
            <br />
            <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcetest" DataKeyNames="StudentID" Width="300px">
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourcetest" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Students.StudentID,Students.StudentName FROM Enrolment INNER JOIN Students ON Enrolment.StudentID = Students.StudentID 
WHERE ([CourseID] = @CourseID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DetailsView1" Name="CourseID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Register a new student"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="StudentName" DataValueField="StudentID">
                <asp:ListItem Value="NULL">&lt;Select student&gt;</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="LabelAlertRegister" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Students] ORDER BY [StudentName]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Enrolment] WHERE [StudentID] = @StudentID AND [CourseID] = @CourseID" InsertCommand="INSERT INTO [Enrolment] ([StudentID], [CourseID]) VALUES (@StudentID, @CourseID)" SelectCommand="SELECT * FROM [Enrolment]">
                <DeleteParameters>
                    <asp:Parameter Name="StudentID" Type="Int32" />
                    <asp:Parameter Name="CourseID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="StudentID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:QueryStringParameter Name="CourseID" QueryStringField="id" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
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
