<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stdRegCourse.aspx.cs" Inherits="NTA.stdRegCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Coures</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
   
</head>
<body>
    <form id="form1" runat="server">
        <!--#include file="nav.inc"-->
        <div class="row">
        <div class="col-lg-12 col-xs-12 col-md-8">  
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-hover" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                <asp:BoundField DataField="CID" HeaderText="CID" SortExpression="CID"></asp:BoundField>
                <asp:BoundField DataField="course_name" HeaderText="course_name" SortExpression="course_name"></asp:BoundField>

                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description"></asp:BoundField>
                <asp:BoundField DataField="credit" HeaderText="credit" SortExpression="credit"></asp:BoundField>
                <asp:BoundField DataField="RoomNo" HeaderText="RoomNo" SortExpression="RoomNo"></asp:BoundField>
                <asp:BoundField DataField="locale" HeaderText="locale" SortExpression="locale"></asp:BoundField>
                <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname"></asp:BoundField>
                <asp:BoundField DataField="startdate" HeaderText="startdate" SortExpression="startdate"></asp:BoundField>
                <asp:BoundField DataField="enddate" HeaderText="enddate" SortExpression="enddate"></asp:BoundField>
            </Columns>
        </asp:GridView>
        
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:NTAConnectionString %>' SelectCommand="SELECT DISTINCT Courses.CID, Courses.course_name, Courses.description, Courses.credit, TrainingRoom.RoomNo, Centres.locale, Members.fname, Courses.startdate, Courses.enddate FROM Centres INNER JOIN Courses INNER JOIN Roster ON Courses.CID = Roster.course_ID INNER JOIN TrainingRoom ON Courses.CID = TrainingRoom.course_ID ON Centres.centre_no = TrainingRoom.centre_ID INNER JOIN Members ON Roster.mem_ID = Members.ID WHERE (Members.mem_tp = 'trainer') AND (Courses.startdate <= CAST(GETDATE() AS DATE)) AND (Courses.enddate >= CAST(GETDATE() AS DATE))"></asp:SqlDataSource>
   </div>
            </div>
            <div class="col-md-3">
                <asp:Label ID="Label1" runat="server" Text="Selected courses:"></asp:Label>
        </div>
            <div class="col-md-4">
                <asp:ListBox ID="selectedCourseList" runat="server" Width="450" class="list-group">

        </asp:ListBox>
                </div>
                <div class="col-md-2">
        <asp:Button ID="remove" runat="server" Text="Register courses" OnClick="remove_Click" />
        </div>
            <div class="col-md-2">
                
    </div>
            
            </div>
        <div class="row">

        </div>
    </form>
</body>
</html>
