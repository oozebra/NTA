<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="NTA.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label2" runat="server" Text="DB: Status: "></asp:Label>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="lbl_fname" runat="server" Text="First Name:"></asp:Label>
        <asp:TextBox ID="txt_fname" runat="server"></asp:TextBox>
         <br />
        <asp:Label ID="lbl_lname" runat="server" Text="Surname:"></asp:Label>
        <asp:TextBox ID="txt_lname" runat="server"></asp:TextBox>
         <br />
        <asp:Label ID="lbl_address" runat="server" Text="Address"></asp:Label>
        <asp:TextBox ID="txt_address" runat="server" TextMode="MultiLine"></asp:TextBox>
         <br />
        <asp:Label ID="lbl_type" runat="server" Text="Member Type"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem Text="Client" Value="client" />
            <asp:ListItem Text="Staff" Value="staff" />
            <asp:ListItem Text="Trainer" Value="trainer" />
        </asp:RadioButtonList>
         <br />
        <asp:Label ID="lbl_dob" runat="server" Text="Date of Birth:"></asp:Label>
        <asp:TextBox ID="txt_dob" runat="server" TextMode="Date"></asp:TextBox>
         <br />
        <asp:Label ID="lbl_pwd1" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="txt_pwd1" runat="server" TextMode="Password"></asp:TextBox>
         <br />
        <asp:Label ID="lbl_pwd2" runat="server" Text="Re Password"></asp:Label>
        <asp:TextBox ID="txt_pwd2" runat="server" TextMode="Password"></asp:TextBox>
         <br />

        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToValidate="txt_pwd2"
            CssClass="ValidationError"
            ControlToCompare="txt_pwd1"
            ErrorMessage="No Match" 
            ToolTip="Password must be the same" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="&laquo; (Required)" 
            ControlToValidate="txt_pwd2"
            CssClass="ValidationError"
            ToolTip="Compare Password is a REQUIRED field">
        </asp:RequiredFieldValidator>

        <asp:Button ID="sub" runat="server" Text="Register" OnClick="sub_Click" />

        <br />
        <asp:Label ID="err" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
