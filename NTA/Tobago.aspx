<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tobago.aspx.cs" Inherits="NTA.Tobago" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tobago</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <!--#include file="nav.inc"-->
        <div class="row">
        <div class="col-lg-12 col-xs-12 col-md-8">  
    <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover"></asp:GridView>
        </div>
            </div>
            </div>
    
    </form>
</body>
</html>
