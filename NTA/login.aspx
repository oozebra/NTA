<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="NTA.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal">
    <div  class="input-group input-group-sm">
        <asp:Label ID="Label1" class="label label-default" runat="server" Text="ID"></asp:Label>
        <asp:TextBox ID="userid"  class="form-control" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" class="label label-default" runat="server" Text="password"></asp:Label>
        <asp:TextBox ID="pwd" class="form-control" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="Login" OnClick="Button1_Click" />

        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
