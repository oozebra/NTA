<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="regCourse.aspx.cs" Inherits="NTA.regCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lbl_cid" runat="server" Text="Coure Reg No. :"></asp:Label>
        <asp:TextBox ID="txt_cid" runat="server"></asp:TextBox>
         <br />
        <asp:Label ID="lbl_name" runat="server" Text="Course Title:"></asp:Label>
        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
         <br />
        <asp:Label ID="lbl_desc" runat="server" Text="Description"></asp:Label>
        <asp:TextBox ID="txt_desc" runat="server" TextMode="MultiLine"></asp:TextBox>
          <br />
        <asp:Label ID="Label1" runat="server" Text="Credits:"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Text="3" Value="3" />
            <asp:ListItem Text="1" Value="1" />
        </asp:DropDownList>
          <br />
        <asp:Label ID="Label2" runat="server" Text="Start Date"></asp:Label>
        <asp:TextBox ID="sdate" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="err" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
