<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="NTA.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/login.css" rel="stylesheet" />
    <script src="scripts/login.js"></script>
</head>
<body>
 
  
        
        <div class="container">
    <div class="row">
        <div class="col-md-12">
            
            <div class="wrap">
                <p class="form-title">Sign In</p>
                <form class="login" runat="server">
					
                    <asp:TextBox ID="TextBox1"  class="form-control" runat="server" placeholder="UserID"></asp:TextBox>
					<asp:TextBox ID="pwd" class="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
      <asp:Button ID="Button1" class="btn btn-default btn-sm" runat="server" Text="Login" OnClick="Button1_Click" />
					
					
                   
                </form>
            </div>
			
        </div>
    </div>
 
</div>


       
       
       
        
        

       
  
</body>
</html>
