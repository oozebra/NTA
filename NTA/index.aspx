<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="NTA.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>National Training Agency</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/landing-page.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">
    <div class="navbar navbar-default navbar-fixed-top topnav">
        <div class="container topnav">
        <ul class="nav navbar-nav navbar-left">
          <li role="presentation" class="active">
              <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="#">Home</asp:HyperLink></li>
          

        <%   if (Session["mem"] != null)
                {  %>
            <li role="presentation">
                <asp:HyperLink ID="hpviewcourse" runat="server" NavigateUrl="~/stdRegCourse.aspx">View Course</asp:HyperLink></li>
          <li><asp:HyperLink ID="vcourse" runat="server" NavigateUrl="~/usersCourses.aspx">Current Courses</asp:HyperLink></li>
            <% if (client.mem_tp == "staff") { %>
            <asp:Label ID="Label1" runat="server" Text="Admin: "></asp:Label>
                    <li role="presentation">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx.cs">Register Users</asp:HyperLink></li>
           <li> <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/regCourse.aspx.cs">Register Courses</asp:HyperLink></li>
             <%   } %>
        </ul>
            
      
        <div class="nav navbar-nav navbar-right"> Welcome:  <mark><% =client.fname   %></mark> to NTA
        
            <asp:Button ID="btnlogout" runat="server" Text="Logout" OnClick="btnlogout_Click" class="btn btn-default"/></div>
          
            <%  }  else  {   %>
            <asp:HyperLink ID="logininlink" runat="server" NavigateUrl="~/login.aspx">Login in</asp:HyperLink>
       
            <%} %>
        <script runat="server">

    protected void btnlogout_Click(object sender, EventArgs e)
    {
                Session.Abandon();
    }
</script>
   
        </div></div>
    
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>Welcome to NTA</h1>
                        <h3>National Training Agency</h3>
                        <hr class="intro-divider">
                        <ul class="list-inline intro-social-buttons">
                            <li>
                                <a href="#" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Port of Spain</span></a>
                            </li>
                            <li>
                                <a href="http://localhost:8080/NTA-CHAG/sampleCoursesStreamSoapProxy/Chag.jsp" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Chaguanas</span></a>
                            </li>
                            <li>
                                <a href="http://localhost:50770/" class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">Trincity</span></a>
                            </li>
                            <li>
                                <a href="SangreGrande.html" class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">Sangre Grande</span></a>
                            </li>
                            <li>
                                <a href="Tobago.aspx"class="btn btn-default btn-lg"><i class="fa fa-linkedin fa-fw"></i> <span class="network-name">Tobago</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    </form>
</body>
</html>
