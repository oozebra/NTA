<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createCourseSchedule.aspx.cs" Inherits="NTA.createCourseSchedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Select Course: "></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="course_name" DataValueField="CID"></asp:DropDownList>
        <br />

        <asp:Label ID="Label2" runat="server" Text="Select Trainer"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="fname" DataValueField="ID"></asp:DropDownList>
        <br />


        <asp:Label ID="Label4" runat="server" Text="Select room no."></asp:Label>
        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="RoomNo" DataValueField="RoomNo"></asp:DropDownList>

        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:NTAConnectionString %>' SelectCommand="SELECT [RoomNo], [centre_no] FROM [Rooms]"></asp:SqlDataSource>
        <br />

        
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:NTAConnectionString %>' SelectCommand="SELECT [fname], [ID] FROM [Members] WHERE ([mem_tp] = @mem_tp)">
            <SelectParameters>
                <asp:Parameter DefaultValue="trainer" Name="mem_tp" Type="String"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:NTAConnectionString %>' SelectCommand="SELECT [course_name], [CID] FROM [Courses]"></asp:SqlDataSource>

        <asp:Button ID="Button1" runat="server" Text="Add Course" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="err" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
