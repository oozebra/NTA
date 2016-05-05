<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="usersCourses.aspx.cs" Inherits="NTA.usersCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Courses</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!--#include file="nav.inc"-->
        <div class="row">
            <div class="col-lg-10 col-xs-12 col-md-8">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" CssClass="table table-hover">
                        <Columns>
                            <asp:BoundField DataField="course_name" HeaderText="course_name" SortExpression="course_name"></asp:BoundField>
                            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description"></asp:BoundField>
                            <asp:BoundField DataField="credit" HeaderText="credit" SortExpression="credit"></asp:BoundField>
                        </Columns>
                        <Columns>
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:NTAConnectionString %>' SelectCommand="SELECT DISTINCT Courses.course_name, Courses.description, Courses.credit FROM Courses INNER JOIN Roster ON Courses.CID = Roster.course_ID INNER JOIN Members ON Roster.mem_ID = Members.ID WHERE (Roster.mem_ID = @is )">
                        <SelectParameters>
        <asp:SessionParameter SessionField="mem_ID" Type="String" Name="is"/>
    </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            
        </div>
    </form>
</body>
</html>
